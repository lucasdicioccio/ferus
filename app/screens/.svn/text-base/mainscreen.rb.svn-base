#mainscreen.rb

class MainScreen < Ferus::Screen
	
	music	("./app/data/sounds/ophelia-mdlj.ogg")
	
	keystate(:default,{ESCAPE	=>	:quit,
			 RETURN	=>	:shop,
			 SPACE	=>	:shoot,
			 A		=>	:shop,
			 B		=>	:bomb,
			 P		=>	:prout,
			 F1		=>	:fullscreen,
			 M		=>	:mouse_test,
			 S		=>	:sound_test,
			 T		=>	:keyboard_test,
			 RIGHT	=>	:move_right,
			 DOWN	=>	:move_down,
			 UP		=>	:move_up,
			 LEFT	=>	:move_left,
			 TAB	=>	:switch_select})
	
	#special_moves( [ {:sequence => [UP,DOWN],
					#:action => :special,
	                #:timing => 100}
	                #])
	                
	routines [:circle,:check_crash,:check_hit,:rockets]
	at_first_boot [:first_boote]
	during_loading [:boote]
	at_quit [:quite]
	
	
	GRID_DEF = 5
	
	def first_boote
		puts "this is my first boot"
	end
	
	def boote
		Unit.new(:name => 1) if Unit.get_all.empty?
		@units 	= Unit.get_all
		@shoots = []
		@unit_p = 0
		@unit 	= @units[0]
		@boss = Ennemi.new
		@bidule = Bidule.new(50,50)
		@explosions = []
		#@music = Ferus::Music.new("./app/data/sounds/ophelia-mdlj.ogg")
		#@music.fade_in(15000,0)
	end
	
	def quite
		puts "mainscreen exited"
	end
	
	#########
	def rockets
		while(!exiting?) do
			Shoot.rockets.each do |r|
				r.move
			end
			sleep(0.01)
		end
	end
	
	def circle
		@unit.x = 400
		@unit.y = 300
		dt = Math::PI / 100
		t = 0
		while(!exiting?) do
			t +=dt
			x_inc = Math.sin(t)*3
			y_inc = Math.cos(t)*3
			@boss.x -= x_inc
			@boss.y -= y_inc
			sleep(0.01)
		end
	end
	
	def check_crash
		while(!exiting?) do
			if @unit.y > 600 or @unit.y < 0
				puts "crashed"
				#SDL.set_gamma(2,2,2)
				sleep(0.5)
				#SDL.set_gamma(1,1,1)
			end
		end
	end
	
	def check_hit
		while(!self.exiting?) do
			@shoots.each do |s|
				if @boss.hit_by?(s)
					@explosions << Explosion.new(@boss.x,@boss.y)
					@bidule.animate
				end
			end
			sleep(0.1)
		end
	end
	##########
	
	def prout
		puts "simulating very slow method execution"
		sleep(5)
		#@unit.images[0].brouille
		#@unit.images[0].masque
	end
	
	def special
		puts "special moves!!! #{Time.now.to_i}"
	end
	
	def shoot
		@shoots << Shoot.new(@unit.x,@unit.y)
	end

	def bomb
		@explosions << Explosion.new(@unit.x,@unit.y)
	end
	
	def shop
		quit_for :screen => "other", :params => "youpi"
	end

	def move_right
		@unit.x += GRID_DEF
	end
	
	def move_left
		@unit.x -= GRID_DEF
	end
	
	def move_up
		@unit.y -= GRID_DEF
	end
	
	def move_down
		@unit.y += GRID_DEF
	end
	
	def	switch_select
		@unit_p = (@unit_p + 1)%(@units.length)
		@unit=@units[@unit_p]
	end
	
	def mouse_test
		Ferus::Mouse.instance.cursor("./app/data/pics/cursor.png")
	end
	
	def keyboard_test
		Ferus::Keyboard.instance.modifiers
	end
	
	def sound_test
		#@music.fade_out(3000)
		s = Ferus::Sound.new("./app/data/sounds/flute.wav",1)
		s.play
	end
	
end
