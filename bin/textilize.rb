#!/usr/bin/env ruby
#$VERBOSE = true

require 'rubygems'
require 'redcloth'

puts RedCloth.new(ARGF.read).to_html.gsub(/\t/, '  ')

