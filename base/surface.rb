# surface.rb
# This file is part of Férus, "Framework Elegant en RUby et SDL".

# Copyright(c) Di Cioccio Lucas (FrihD)
# bizarrebizarre@gmail.com

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

# this is a wrapper of SDL::Surface with most used methods,
# of course it slows down the program execution, but it is more 
# readable and easier to use for common beings

module Ferus
class Surface

	attr_accessor :x,:y # coordinates
	
	# given the path of the pic, SDL loads it
	def initialize(path)
		puts "*loading surface : #{path}" if $DEBUG
		@surface = SDL::Surface.load(path)
		@x,@y = 0,0
	end
	
	def put
		Display.instance.put(@surface,@x,@y) if @surface
	end
	
	def put_at(x,y)
		Display.instance.put(@surface,x,y) if @surface
	end
	
	#def lock
		#@surface.lock
	#end
	
	#def unlock
		#@surface.unlock
	#end
	
	#def brouille
		#puts "surface #{@surface} must be locked before" if @surface.must_lock? and --debug
		#@surface.put_pixel(rand(100),0,[0,0,0])
	#end

	#def masque
		#puts @surface.Amask.inspect
	#end
	
end
end
