#animation.rb
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
class Animation

	@@animations = []
	attr_reader :pictures,:executions
	
	# While initializing a SDLAnimation, you should provide an array with
	# all the pictures to load in a right order
	# You then provide an optional hash with 
	# :times => number_of_sprite_execution (leave blank for infinite)
	# :autoanimate => true/false if the animation rounds by itself (default yes)
	def initialize(array,params={})
		@pictures = []
		@executions = 0
		@removed = false
		array.each { |p| @pictures << Surface.new(p) }
		if @pictures.length == 1
			puts "no picture in #{self.inspect}"
		end
		@times = params[:times]
		@@animations << self if params[:autoanimate] == true
	end
	
	def put
		@pictures[0].put if @pictures[0]
	end
	
	def put_at(x,y)
		@pictures[0].put_at(x,y) if @pictures[0]
	end
	
	def animate
		@pictures << @pictures.shift
		if @times
			if @executions > @times*@pictures.length
				remove
				@removed = true
			end
			@executions += 1
		end
	end
	
	def removed?
		@removed
	end
	
	def remove
		@@animations -= [self]
		@@animations.compact!
	end
	
	def Animation.animate_all
		@@animations.each { |a| a.animate }
	end
	
end
end
