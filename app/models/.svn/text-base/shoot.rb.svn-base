# shoot.rb
class Shoot
	
	attr_accessor :x,:y,:gone,:direction
	@@rockets=[]
	
	def initialize(x,y)
		@x,@y=x,y
		@direction = [1,1]
		@speed = 20
		@gone = false
		@surf = Ferus::Surface.new("./app/data/pics/shoot.png")
		@@rockets << self
	end
	
	def move
		var = @direction.collect{|u| u*@speed}
		@x += var[0]
		@y += var[1]
		@direction[0] = -1 if @x > 800 
		@direction[0] =  1 if @x < 0
		@direction[1] = -1 if @y > 600
		@direction[1] =  1 if @y < 0
	end
	
	def Shoot.rockets
		@@rockets
	end
	
	def put
		@surf.put_at(@x,@y)
	end
	
end
