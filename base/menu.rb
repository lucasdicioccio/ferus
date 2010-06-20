#menu.rb
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
class Menu

	attr_reader :items,:id_selection
	
	def initialize(collection=[])
		@items=collection
	end

	def selected_item
		@items[@id_selection]
	end
	
	def each_item
		@items.each {|i| yield i }
	end
	
	def each_with_selection
		iteration = 0
		@items.each do |i|
			if i == selected_item
				yield(i,true,iteration)
			else
				yield(i,false,iteration)
			end
			iteration += 1
		end
	end
	
end

class SimpleMenu < Menu
	
	def initialize(collection,idselect)
		super(collection)
		@id_selection = idselect
	end
	
	def previous_item
		@id_selection -= 1 if @id_selection > 0
	end
	
	def next_item
		@id_selection += 1 if @id_selection < @items.length - 1
	end
	
end

class CircularMenu < Menu
	
	def initialize(collection,idselect)
		super(collection)
		@id_selection = idselect
	end
	
	def previous_item
		@items = [@items.pop] + @items
	end
	
	def next_item
		@items << @items.shift
	end
		
end

class SweepMenu < Menu
	def initialize(collection,height)
		@all_items = collection
		@height = height
		@id_selection = 0
		@slice_pointer = 0
		slice!
	end
	
	def slice!
		@items = @all_items[@slice_pointer .. @slice_pointer + @height -1]
		puts "s:#{@slice_pointer} i:#{@id_selection}"
	end
	
	def next_item
		if @id_selection < @all_items.length - 1
			@id_selection += 1
			if (@id_selection > @height - 1) and (@slice_pointer < @all_items.length - (0+@height))
				@slice_pointer += 1
			end
			slice!
		end
	end
	
	def previous_item
		if @id_selection > 0
			@id_selection -= 1
			if (@id_selection < @all_items.length - (0 + @height)) and @slice_pointer > 0
				@slice_pointer -= 1
			end
			slice!
		end
	end
	
	def selected_item
		@all_items[@id_selection]
	end
	
end
end
