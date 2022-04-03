#!/usr/bin/env ruby
# to finish `time`

require 'nokogiri'
require 'optparse'
require 'optparse/time'
require 'paint'
# require 'pp'

# Custom OptionParser class
class Parser
  VERSION = '1.0.0'.freeze

  # Custom OptionParser ScriptOptions
  class ScriptOptions
    attr_accessor :delay, :path, :time

    def initialize; end

    def define_options(parser)
      parser.banner =
        "Usage: #{Paint['well-formed.rb [options]', :red, :white]}"
      parser.separator ''
      parser.separator 'Specific options:'

      # add additional options
      specify_path_option(parser)
      delay_execution_option(parser)
      execute_at_time_option(parser)

      parser.separator ''
      parser.separator 'Common options:'
      # No argument, shows at tail.  This will print an options summary.
      # Try it and see!
      parser.on_tail('-h', '--help', 'Show this message') do
        puts parser
        exit
      end
      # Another typical switch to print the version.
      parser.on_tail('--version', 'Show version') do
        puts VERSION
        exit
      end
    end

    def specify_path_option(parser)
      parser.on(
        '-p',
        '--path path',
        'Path to check for well formedness'
      ){ |p| self.path = p}
    end

    def delay_execution_option(parser)
      # Cast 'delay' argument to a Float.
      parser.on('--delay N', Float, 'Delay N seconds before executing') do |n|
        self.delay = n
      end
    end

    def execute_at_time_option(parser)
      # Cast 'time' argument to a Time object.
      parser.on(
        '-t',
        '--time [TIME]',
        Time,
        'Begin execution at given time'
      ){ |time| self.time = time}
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
  print 'Enter the path to check for well formedness: '
  options.path = $stdin.gets.chomp
end

# Used to check the well formedness of XML files
@error = 0
def check(path)
  Dir.glob("#{path}/**/*.{dita,ditamap,xml,xsd,xsl}").each do |filename|
    doc = File.open(filename){ |xml| Nokogiri.XML(xml)}
    unless doc.errors.empty?
      (@error = 1
       puts filename, doc.errors)
    end
  end
end

def create_path(path)
  path.tr('\\', '/')
end

check(create_path(options.path))

exit 1 unless @error.zero?
