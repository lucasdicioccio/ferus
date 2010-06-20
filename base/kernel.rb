#kernel2.rb


module Ferus
class FerusKernel

	include Singleton
	attr_accessor 	:next_screen,:current_screen,:m_event,:m_keymap,:m_screen
	attr_reader		:event_thread, :render_thread
	
	# Initialize is simply the basic first operation
	# It loads everything that is needed later
	def initialize
		Display.instance
		Keyboard.instance
		Mouse.instance
		Mixer.instance
		
		#@m_event	= Monitor.new
		#@m_keymap	= Monitor.new
		@m_screen	= Monitor.new
		#@m_load		= Monitor.new
		
		@next_screen = nil
		@current_screen = nil
		
		@event_thread    = nil
		@render_thread   = nil
		@main_thread     = Thread.current
		@methods_thread  = []
		
	end
	
	# Starts a thread for the events and continues its main execution
	# by continuously rendering the screen
	def start(hash)
		set_next_screen(hash)
		swap_screen
		loop
	end
	
	def loop
		while(@current_screen) do
		
			render_screen
			
			@current_screen.routines	if @current_screen.respond_to? :routines
			@current_screen.first_boot 	if @current_screen.respond_to?(:first_boot) and !@current_screen.class.booted?
			@current_screen.boot 		if @current_screen.respond_to? :boot
			@current_screen.music 		if @current_screen.respond_to? :music
		
			check_events
			
			@event_thread.join
			@render_thread.join
			
			swap_screen
			
		end
	end

	def swap_screen
		@m_screen.synchronize do
			@current_screen = @next_screen
			@next_screen 	= nil
		end
	end

	def set_next_screen(hash=nil)
		@m_screen.synchronize do
			@next_screen = Kernel.const_get((hash[:screen]+"_screen").camelize).new(hash[:params])
		end
		@next_screen.load if @next_screen and @next_screen.respond_to? :load and !@next_screen.loaded?
	end
	
	private
	
	def exit
		@m_screen.synchronize do
			@current_screen.kill! if @current_screen
			@next_screen = nil
		end
		puts "the progam has normally exited"
	end
	
	
	# Try to render the screen when @current_screen does not have to
	# quit . It does not leave a semi-rendered screen appear because 
	# @next_screen will begin its own rendering only after this one ends
	def render_screen	
		@render_thread = Thread.new do
			while(!@current_screen.exiting?) do
				Animation.animate_all
				@current_screen.render
				Display.instance.flip
			end
		end
	end

	# Starts a thread that will look for pressed keys by comparing them
	# to the @keymap which should be the one of @current_screen.
	# Events more probable are evaluated first.
	#
	# Scenario 3 (current implementation) : create a new thread for each 
	# method and then wait for their completion before quiting the checking
	# thread
	#
	# Scenario 4 (future implementation) : will give a choice to the
	# coder between letting an action live "longer" than the screen which created it
	# can lead to memory leak if the programmer do bad
	
	def check_events
		@event_thread = Thread.new do 
			while(!@current_screen.exiting?) do
					case(event = SDL::Event2.poll) # .wait freezes everything due to Ruby green threads approach
					when SDL::Event2::MouseMotion
					
					when SDL::Event2::KeyDown
						t = Thread.new do # scenario 2 and 3
							@current_screen.mysend(event)
						end
						@methods_thread << t # scenario 3				
					when SDL::Event2::Quit
						puts "quitting"
						exit
					else
						sleep(0.01)  # may become a parametrable value due to spinlock
					end #end case
			end # end while
		
			@methods_thread.each do |th| # scenario 3
				th.join					 # 
			end# end each				 #
			
		end# end thread
	end# end check_events
	
	
end# end FerusKernel
end
