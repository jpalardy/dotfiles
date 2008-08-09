#!/usr/bin/env ruby
$VERBOSE = true

############################################################

require 'yaml'
require 'pp'

pp YAML::load_file(ARGV[0])

