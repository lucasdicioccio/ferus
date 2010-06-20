#ennemi.rb

class Ennemi
	
	attr_accessor :x,:y
	attr_reader :life
	
	def initialize
		@life = 100
		@x = 700
		@y = 300
		@picture = Ferus::Surface.new("./app/data/pics/2.png")
		@animation = Ferus::Animation.new( ["./app/data/anim/1.png",
										"./app/data/anim/2.png",
										"./app/data/anim/3.png",
										"./app/data/anim/4.png",
										"./app/data/anim/5.png",
										"./app/data/anim/6.png"],
										{:autoanimate => true})
		@texte = Ferus::Text.new("ouee",@x,@y,"DejaVuSans.ttf",30)
	end
	
	def hit_by?(shoot)
		dist = (shoot.x - @x)** 2 + (shoot.y - @y)**2
		if dist < 40**2
			@life -= 1
			true
			@texte.color = [rand(256),rand(256),rand(256)]
		end
	end
	
	def put
		@picture.put_at(@x,@y)
		@animation.put_at(@x,@y)
		@texte.text = life.to_s
		@texte.put
	end
	
end
