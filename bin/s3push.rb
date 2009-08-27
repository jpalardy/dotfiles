#!/usr/bin/env ruby

############################################################

require 'rubygems'
require 'aws/s3'

############################################################

AWS::S3::Base.establish_connection!(:access_key_id => ENV['AMAZON_ACCESS_KEY_ID'],
                                    :secret_access_key => ENV['AMAZON_SECRET_ACCESS_KEY'],
                                    :use_ssl => true)

def push_file(filename, path, bucket)
  AWS::S3::S3Object.store(File.join(path, filename), open(filename), bucket)
end

############################################################

def error(message)
  $stderr.puts "#{File.basename($0)}: #{message}"
  usage(1)
end

def usage(status=0)
  $stderr.puts <<-END
Usage: #{File.basename($0)} filename(s) --bucket bucketName [--path some/path]

    --help,               -h   Show this message
    --bucket                   Name of the S3 bucket
    --path                     Path to prepend to filenames
  END

  exit status
end

############################################################

def parse_argv
  result = { :bucket => nil,
               :path => '',
              :files => []  }

  require 'getoptlong'
  opts = GetoptLong.new(['--bucket',      GetoptLong::REQUIRED_ARGUMENT],
                        ['--path',        GetoptLong::OPTIONAL_ARGUMENT],
                        ['--help',  '-h', GetoptLong::NO_ARGUMENT])

  opts.each do |opt, arg|
    case opt
    when '--help'
      usage
    when '--bucket'
      result[:bucket] = arg
    when '--path'
      result[:path] = arg
    end
  end

  result[:files] = ARGV

  error "missing bucket name" unless result[:bucket]

  return result
end

############################################################

options = parse_argv

options[:files].each do |filename|
  push_file(filename, options[:path], options[:bucket])
end

