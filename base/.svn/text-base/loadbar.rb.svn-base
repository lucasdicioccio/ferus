#loadbar.rb

module Ferus
class LoadBar

	attr_accessor :percentage,:color,:x,:y

	def initialize(x,y,w,max_l,direction=:horizontal_left,color=[0,0,0])
		@x	= x
		@y	= y
		@w	= w
		@max_l	= max_l
		@color	= color
		@dir	= direction
		@percentage	= 0
	end
	
	def put
		put_at(@x,@y)
	end

	def put_at(x,y)
		case @dir
		when :horizontal_left
			Display.instance.display.fillRect(x,y,@max_l*@percentage/100.0,@w,@color)
		when :horizontal_right
			Display.instance.display.fillRect(x-@max_l*@percentage/100.0,y,@max_l*@percentage/100.0,@w,@color)
		when :vertical_bottom
			Display.instance.display.fillRect(x,y-@max_l*@percentage/100.0,@w,@max_l*@percentage/100.0,@color)
		when :vertical_top
			Display.instance.display.fillRect(x,y,@w,@max_l*@percentage/100.0,@color)
		end
	end

end
end

