#sound.rb
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
class Sound

	attr_accessor :channel
	
	def initialize(path,channel)
		puts "*loading sound : #{path}" if $DEBUG
		@sound = SDL::Mixer::Wave.load(path)
		@channel = channel
		@volume = 128
	end
	
	def set_volume(vol)
		@sound.setVolume(vol)
	end
	
	def play(loop=0)
		SDL::Mixer.playChannel(@channel,@sound,loop)
	end

	def pause
		SDL::Mixer.pause(@channel)
	end
	
	def resume
		SDL::Mixer.resume(@channel)
	end
	
	def halt
		SDL::Mixer.halt(@channel)
	end
	
	alias :stop :halt
	
end

end
