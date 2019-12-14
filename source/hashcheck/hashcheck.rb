# Secure Hash Algorithm choices: md2 md4 md5 sha1 sha256 sha384 sha512

require 'optparse'
require 'paint'

VERSION = '1.0.0'.freeze

# implement commandline options
options = { file: nil, algorithm: nil }

parser =
  OptionParser.new do |opts|
    opts.banner = "Usage: #{Paint['hashcheck.rb [options]', :red, :white]}"

    opts.on('-f', '--file file', 'Path to file') do |file|
      options[:file] = file
    end

    opts.on('-a', '--algorithm algorithm', 'Algorithm') do |algorithm|
      options[:algorithm] = algorithm
    end

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

if options[:file].nil?
  print 'Enter path to file: '
  options[:file] = STDIN.gets.chomp
end
if options[:algorithm].nil?
  print 'Enter algorithm: '
  options[:algorithm] = STDIN.gets.chomp
end

shell_command =
  `CertUtil -hashfile "#{options[:file]}" "#{options[:algorithm]}"`
puts shell_command.inspect.split('\n')[1]
