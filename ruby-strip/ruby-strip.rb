#!/usr/bin/env ruby
# frozen_string_literal: true

# to finish `time`

require "fileutils"
require "optparse"
require "optparse/time"
require "paint"
# require 'pp'

# Custom OptionParser class
class Parser
  VERSION = "1.0.0"

  # Custom OptionParser ScriptOptions
  class ScriptOptions
    attr_accessor :path, :delay, :time

    def initialize; end

    def define_options(parser)
      parser.banner = "Usage: #{Paint['ruby-strip.rb [options]', :red, :white]}"
      parser.separator ""
      parser.separator "Specific options:"

      # add additional options
      specify_path_option(parser)
      delay_execution_option(parser)
      execute_at_time_option(parser)

      parser.separator ""
      parser.separator "Common options:"
      # No argument, shows at tail.  This will print an options summary.
      # Try it and see!
      parser.on_tail("-h", "--help", "Show this message") do
        puts parser
        exit
      end
      # Another typical switch to print the version.
      parser.on_tail("--version", "Show version") do
        puts VERSION
        exit
      end
    end

    def specify_path_option(parser)
      parser.on(
        "-p",
        "--path path",
        'Directory or path relative to this
                                     directory to check for excess whitespace.'
      ) {|p| self.path = p}
    end

    def delay_execution_option(parser)
      # Cast 'delay' argument to a Float.
      parser.on("--delay N", Float, "Delay N seconds before executing") do |n|
        self.delay = n
      end
    end

    def execute_at_time_option(parser)
      # Cast 'time' argument to a Time object.
      parser.on(
        "-t",
        "--time [TIME]",
        Time,
        "Begin execution at given time"
      ) {|time| self.time = time}
    end
  end

  #
  # Return a structure describing the options.
  #
  def parse(args)
    # The options specified on the command line will be collected in
    # *options*.

    @options = ScriptOptions.new
    @args =
      OptionParser.new do |parser|
        @options.define_options(parser)
        parser.parse!(args)
      end
    @options
  end

  attr_reader :parser, :options
end

example = Parser.new
options = example.parse(ARGV)
# pp options # example.options
# pp ARGV

sleep(options.delay) if options.delay
if options.path.nil?
  print "Enter directory or path relative to this directory to check for excess whitespace: "
  options.path = $stdin.gets.chomp
end

def create_path(path)
  path.tr("\\", "/")
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
  Dir.glob("output/**/*.*").each do |filename|
    file = File.open(filename, "r+")
    contents = file.read
    strip_contents = contents.strip
    file.rewind
    file.truncate(0)
    file.write(strip_contents)
    file.close
  end
end

strip_space(create_path(options.path))
