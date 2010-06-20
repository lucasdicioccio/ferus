#explosion.rb

class Explosion

	attr_accessor :x,:y
	
	def initialize(x,y)
		@x,@y = x,y
		@animation2 = Ferus::Animation.new( ["./app/data/anim/a1.png",
										"./app/data/anim/a2.png",
										"./app/data/anim/a3.png",
										"./app/data/anim/a4.png",
										"./app/data/anim/a5.png",
										"./app/data/anim/a6.png",
										"./app/data/anim/a7.png",
										"./app/data/anim/a8.png",
										"./app/data/anim/a9.png",
										"./app/data/anim/a10.png",
										"./app/data/anim/a11.png",
										"./app/data/anim/a12.png",
										"./app/data/anim/a13.png",
										"./app/data/anim/a14.png"],
										{:autoanimate => true,:times =>1})
										 
	end
	
	def put
		@animation2.put_at(x,y)
	end
	
	def removed?
		@animation2.removed?
	end
	
end
