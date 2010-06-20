# unit.rb
# describes the units

class Unit

	@@units = []
	
	attr_reader :name,:images
	attr_accessor :x,:y

	def initialize(hash)
		@images 	=	[]
		@name		=	hash[:name]
		@x,@y = 0,0
		@images << Ferus::Surface.new("./app/data/pics/#{name}.png") #to change
		@@units <<self
	end

	def Unit.get_all
		@@units
	end
	
end
