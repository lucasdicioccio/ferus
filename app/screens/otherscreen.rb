#otherscreen.rb

class OtherScreen < Ferus::Screen
	keystate(:default,	{ESCAPE	=>	:quit,
			 			RETURN	=>	:ms})
	
	during_loading [:long_long_method]
	
	def long_long_method
		3.times do |t|
			puts "#{@params} wait #{t+1} sec"
			sleep(t+1)
		end
	end
	
	def ms
		set_next_screen :screen => "main"
	end
	
end
