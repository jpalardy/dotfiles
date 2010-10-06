#!/usr/bin/env ruby

require 'yaml'
require 'pp'

pp YAML::load_file(ARGV[0])

