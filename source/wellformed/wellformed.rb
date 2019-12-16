# Checks well formedness of xml based files and prints error messages

require 'nokogiri'

# Used to validate XML files and will traverse the imports
# or includes if needed to find the validation errors
def validate(path)
  Dir.glob("#{path}/**/*.{xml,xsd,xsl}").each do |filename|
    doc = File.open(filename) { |f| Nokogiri.XML(f) }
    puts filename, doc.errors unless doc.errors.empty?
  end
end

def create_path(path)
  path.tr('\\', '/')
end

validate(create_path(ARGV[0]))
