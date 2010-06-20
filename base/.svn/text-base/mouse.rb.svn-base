#mouse.rb
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

module Ferus
class Mouse
	include Singleton
	def initialize
		@cursor = nil
	end

	def x
		SDL::Mouse.state[0]
	end
	
	def y
		SDL::Mouse.state[1]
	end
	
	def xy
		SDL::Mouse.state[0 .. 1]
	end
	
	def to(x,y)
		SDL::Mouse.warp(x,y)
	end
	
	def show
		SDL::Mouse.show
	end
	
	def hide
		SDL::Mouse.hide
	end
	
	#Don't know how it works...
	#def cursor(path=nil)
		#@cursor = SDL::Surface.load(path) if path
		#SDL::Mouse.setCursor(@cursor,0,0,0,0,0,0)
	#end
	
end
end
