#!/usr/bin/env ruby

require 'fileutils'
require 'optparse'
require 'paint'

VERSION = '1.0.0'.freeze

# implement commandline options
options = {path: nil}

parser =
  OptionParser.new do |opts|
    opts.banner = "Usage: #{Paint['ruby-strip.rb [options]', :red, :white]}"

    opts.on(
      '-p',
      '--path',
      'Directory or path
                                     relative to this directory
                                     to check for excess whitespace.'
    ){|path| options[:path] = path}

    opts.on('-h', '--help', 'Displays help') do
      puts opts
      exit
    end

    opts.on_tail('--version', 'Show program version') do
      puts VERSION
      exit
    end
  end

parser.parse!

if options[:path].nil?
  print 'Enter path to file: '
  options[:path] = STDIN.gets.chomp
end

def create_path(path)
  path.tr('\\', '/')
end

# entry point function calls the two other worker functions
def strip_space(src)
  Dir.glob("#{src}/**/*.*").each do |filename|
    copy_with_path(filename, "output/#{filename}")
  end
  strip_white_space
end

# function that copies the folder of input files to the
# output folder. Creates the directories if they don't exist
def copy_with_path(src, dst)
  FileUtils.mkdir_p(File.dirname(dst))
  FileUtils.cp(src, dst)
end

# Function that strips that white space from each file
def strip_white_space
  Dir.glob('output/**/*.*').each do |filename|
    file = File.open(filename, 'r+')
    contents = file.read
    strip_contents = contents.strip
    file.rewind
    file.truncate(0)
    file.write(strip_contents)
    file.close
  end
end

strip_space(create_path(options[:path]))
