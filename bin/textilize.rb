#!/usr/bin/env ruby

require 'rubygems'
require 'redcloth'

puts RedCloth.new(ARGF.read).to_html.gsub(/\t/, '  ')

