#!/usr/bin/env ruby
# rubyonwar.rb

require 'singleton'
require 'rubygems'
require 'sdl'
require 'thread'
require 'monitor'
require 'yaml'
require 'find'

["./base","./app/screens","./app/views","./app/models"].each do |r|
        Find.find(r) do |f|
                require f if f =~ /.rb$/
        end
end

Ferus::FerusKernel.instance.start(:screen => $*[0] || "main")
