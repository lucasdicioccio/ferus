#keyboard.rb


module Ferus
class Keyboard
	include Singleton
	
	#Segfault, try to debug it later
	#def is_pressed?(key)
		#SDL::Key.press?(key)
	#end
	
	def initialize
		config = YAML::load_file("./app/config/config.yaml")
		repeat(config)
	end
	
	def modifiers
		SDL::Key.modState
	end
	
	def repeat(hash)
		if hash[:delay] == 0
			SDL::Key.disableKeyRepeat
		else
			SDL::Key.enableKeyRepeat(hash[:delay],hash[:interval])
		end
	end
	
end
end
