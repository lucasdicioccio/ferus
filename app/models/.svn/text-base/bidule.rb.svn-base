#bidule.rb

class Bidule

	attr_accessor :x,:y
	
	def initialize(x,y)
		@x,@y = x,y
		@animation = Ferus::Animation.new( ["./app/data/anim/1.png",
										"./app/data/anim/2.png",
										"./app/data/anim/3.png",
										"./app/data/anim/4.png",
										"./app/data/anim/5.png",
										"./app/data/anim/6.png"],
										{:autoanimate => false})
	end
	
	def put
		@animation.put_at(x,y)
	end
	def animate
		@animation.animate
	end
	
end
