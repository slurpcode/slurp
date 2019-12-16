# Secure Hash Algorithm choices: md2 md4 md5 sha1 sha256 sha384 sha512

require 'optparse'
require 'optparse/time'
require 'paint'
# require 'pp'

# Custom OptionParser class
class Parser
  VERSION = '1.0.0'

  # Custom OptionParser ScriptOptions
  class ScriptOptions
    attr_accessor :file, :algorithm, :delay, :time

    def initialize; end

    def define_options(parser)
      parser.banner = "Usage: #{Paint['hashcheck.rb [options]', :red, :white]}"
      parser.separator ''
      parser.separator 'Specific options:'

      # add additional options
      specify_file_option(parser)
      specify_algorithm_option(parser)
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

    def specify_file_option(parser)
      parser.on('-f', '--file file', 'Path to file') do |f|
        self.file = f
      end
    end

    def specify_algorithm_option(parser)
      parser.on('-a', '--algorithm algorithm', 'Algorithm') do |a|
        self.algorithm = a
      end
    end

    def delay_execution_option(parser)
      # Cast 'delay' argument to a Float.
      parser.on('--delay N', Float, 'Delay N seconds before executing') do |n|
        self.delay = n
      end
    end

    def execute_at_time_option(parser)
      # Cast 'time' argument to a Time object.
      parser.on('-t', '--time [TIME]', Time, 'Begin execution at given time') do |time|
        self.time = time
      end
    end
  end

  #
  # Return a structure describing the options.
  #
  def parse(args)
    # The options specified on the command line will be collected in
    # *options*.

    @options = ScriptOptions.new
    @args = OptionParser.new do |parser|
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

if options.file.nil?
  print 'Enter path to file: '
  options.file = STDIN.gets.chomp
end
if options.algorithm.nil?
  print 'Enter algorithm: '
  options.algorithm = STDIN.gets.chomp
end

shell_command =
  `CertUtil -hashfile "#{options.file}" "#{options.algorithm}"`
puts shell_command.inspect.split('\n')[1]
