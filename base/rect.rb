#rect.rb


module Ferus
class Rect

	attr_accessor :x,:y,:w,:h,:color

	def initialize(x=0,y=0,w=1,h=1,color=nil)
	
		@x		= x
		@y		= y
		@w		= w
		@h		= h
		@color	= color
		
	end

	def put
		Display.instance.display.fillRect(x,y,w,h,color)
	end

end
end
