#music.rb
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
class Music

	def initialize(path)
		puts "*loading sound : #{path}" if $DEBUG
		@music = SDL::Mixer::Music.load(path)
	end
	
	def set_volume(vol)
		SDL::Mixer.setVolumeMusic(vol)
	end
	
	def play(times=-1)
		SDL::Mixer.playMusic(@music,times)
	end
	
	def pause
		SDL::Mixer.pauseMusic
	end
	
	def resume
		SDL::Mixer.resumeMusic
	end
	
	def halt
		SDL::Mixer.haltMusic
	end
	
	alias :stop :halt
	
	def fade_out(ms)		
		SDL::Mixer.fadeOutMusic(ms)
	end
	
	def fade_in(ms,times)
		SDL::Mixer.fadeInMusic(@music,ms,times)
	end
	
end
end
