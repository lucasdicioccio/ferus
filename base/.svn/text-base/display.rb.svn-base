# display.rb
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

# SDLDisplay class is a simple wrapper for the rubysdl soup,
# regarding the main window configuration

module Ferus
class Display
	
	include Singleton
	attr_reader :display
	def initialize(flags=0)
		config = YAML::load_file("./app/config/config.yaml")
		flags = 0
		flags += SDL::DOUBLEBUF if config[:doublebuffering]
		flags += case config[:videosurfacelocation]
				 when 'hw'
					SDL::HWSURFACE
				 when 'sw'
					SDL::SWSURFACE
				 when 'best_with_alpha'
					SDL::SRCALPHA
				 else #default is best without alpha
					SDL::SRCCOLORKEY
				 end
		#SDL::WM.icon=(SDL::Surface.load('./app/config/icon'))
		SDL::WM.setCaption(config[:title],config[:iconname])
		@display = SDL::setVideoMode(config[:width],
									 config[:height],
									 config[:bpp],
									 flags)
		set_title(config[:title])
	end
	
	def flip
		@display.flip
	end
	
	def set_title(nom)
		SDL::WM.set_caption(nom,"")
	end
	
	def put(*params)
		@display.put(*params)
	end
	
	def fullscreen
		puts "trying to toggle fullscreen" if $DEBUG
		@display.toggleFullScreen
	end
	
end
end
