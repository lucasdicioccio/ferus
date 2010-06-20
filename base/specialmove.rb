# specialmove.rb
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


# enable detection of special moves

module Ferus
class SpecialMove
	
	attr_reader :deadline,:action
	def initialize(hash) #timer is in sec
		@deadline = Time.now + hash[:timing]
		@sequence = hash[:sequence].dup
		@action = hash[:action]
	end
	
	def finished_with_key?(key)
		if @sequence.size == 1 and @sequence[0] == key
			true
		else
			@sequence.shift
			false
		end
	end
	
	def elapsed?
		return(@deadline < Time.now)
	end
	
end
end
