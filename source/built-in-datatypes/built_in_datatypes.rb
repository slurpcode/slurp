require 'nokogiri'
require 'optparse'

VERSION = '1.0.0'.freeze

def create_path(path)
  path.tr('\\', '/')
end

# implement commandline options
options = {path: nil}

parser =
  OptionParser.new do |opts|
    opts.banner = "Usage: #{Paint['built_in_datatypes.rb', :red, :white]}"

    opts.on('-p', '--path path', 'Path to schema') do |path|
      options[:path] = path
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

if options[:path].nil?
  print 'Enter path to schema: '
  options[:path] = STDIN.gets.chomp
end

@error = 0
@allowed = %w[
  string
  boolean
  base64Binary
  hexBinary
  float
  decimal
  double
  anyURI
  QName
  NOTATION
  duration
  dateTime
  time
  date
  gYearMonth
  gYear
  gMonthDay
  gDay
  gMonth
  normalizedString
  integer
  token
  nonPositiveInteger
  long
  nonNegativeInteger
  language
  Name
  NMTOKEN
  negativeInteger
  int
  unsignedLong
  positiveInteger
  NCName
  NMTOKENS
  short
  unsignedInt
  ID
  IDREF
  ENTITY
  byte
  unsignedShort
  IDREFS
  ENTITIES
  unsignedByte
]

# start
project_path = create_path(options[:path])
@datatypes = []

Dir.glob("#{project_path}/**/*.xsd").map do |schema|
  doc = Nokogiri.XML(File.open(schema))
  doc.xpath('//*[starts-with(@type,"xsd:")]').map do |tag|
    type = tag.attribute('type').to_s.split(':').last
    next if @datatypes.include?(type)

    @datatypes << type
  end
end

@datatypes.map do |type|
  next if @allowed.include?(type)

  @error = 1
  puts "#{type} does not match any built in XML Schema datatype"
end

exit 1 unless @error.zero?
