#text.rb
SDL::TTF.init

module Ferus
class Text

	@@fonts = {}
	
	attr_accessor :text,:x,:y,:color
	attr_reader :font,:size
	
	def initialize(text,x,y,font,size,color=[256,256,256])
		@text = text
		@x,@y=x,y
		@font = font
		@size = size
		@color = color
		add_font(font,size) unless @@fonts[@font] and @@fonts[@font][@size]
	end
	
	def change_font(font,size)
		@font = font
		@size = size
		add_font(font,size) unless @@fonts[@font] and @@fonts[@font][@size]
	end
	
	def put_at(x,y,color=@color)
		@@fonts[@font][@size].draw_solid_utf8(Display.instance.display,@text,x,y,color[0],color[1],color[2]) if @@fonts[@font] and @@fonts[@font][@size]
	end
	
	def put #should heavily be simplified
		@@fonts[@font][@size].draw_solid_utf8(Display.instance.display,@text,@x,@y,@color[0],@color[1],@color[2]) if @@fonts[@font] and @@fonts[@font][@size]
	end
	
	private
	def add_font(font,size)
		puts "*loading font: #{font}" if $DEBUG
		f = SDL::TTF.open("./app/data/fonts/#{font}",size)
		@@fonts[font] = {} unless @@fonts[font]
		@@fonts[font][size] = f 
	end
	
end
end
