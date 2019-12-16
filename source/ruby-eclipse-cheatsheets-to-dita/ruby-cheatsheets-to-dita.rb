#!/usr/bin/env ruby

require 'date'
require 'fileutils'
require 'nokogiri'
require 'optparse'
require 'optparse/time'
require 'paint'
# require 'pp'

# Custom OptionParser class
class Parser
  VERSION = '1.0.0'

  # Custom OptionParser ScriptOptions
  class ScriptOptions
    attr_accessor :path, :delay, :time

    def initialize; end

    def define_options(parser)
      parser.banner =
        "Usage: #{Paint['ruby-cheatsheets-to-dita.rb [options]', :red, :white]}"
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
        'Enter the directory or path relative to this
                                     directory to the cheatsheets XML test data: '
      ){|p| self.path = p}
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
      ){|time| self.time = time}
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

if options.path.nil?
  print 'Enter the directory or path relative to this
directory to the cheatsheets XML test data: '
  options.path = STDIN.gets.chomp
end

def create_path(path)
  path.tr('\\', '/')
end

def create_dita(path)
  order = %w[
    intro_composite.xml
    analysis_composite.xml
    s2r_composite.xml
    satc_composite.xml
  ]

  n = 'NoPrint'

  stylesheet =
    "<xsl:stylesheet
    xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\"
    xmlns:xs=\"http://www.w3.org/2001/XMLSchema\"
    xmlns:debrief=\"http://www.debrief.info/\"
    exclude-result-prefixes=\"xs debrief\"
    version=\"1.0\">

    <xsl:template match=\"/compositeCheatsheet\">
      <xsl:apply-templates select=\"taskGroup\"/>
    </xsl:template>

    <xsl:template match=\"taskGroup\">
      <task id=\"{generate-id(.)}\">
        <title>
          <xsl:apply-templates select=\"@name\"/>
        </title>
        <shortdesc>
          <xsl:apply-templates select=\"intro\"/>
        </shortdesc>
        <xsl:choose>
          <xsl:when test=\"taskGroup\">
            <xsl:apply-templates select=\"taskGroup\"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:for-each select=\"task\">
              <xsl:variable name=\"path\" select=\"param[@name='path']/@value\"/>
              <task id=\"{generate-id(.)}\">
                <title>
                  <xsl:apply-templates
                    select=\"document($path)//cheatsheet/@title\"/>
                </title>
                <shortdesc>
                  <xsl:apply-templates
                    select=\"document($path)//cheatsheet/intro/description\"/>
                </shortdesc>
                <taskbody>
                  <steps>
                    <xsl:apply-templates select=\"document($path)//cheatsheet\"/>
                  </steps>
                  <result>
                    <xsl:apply-templates select=\"onCompletion\"/>
                  </result>
                </taskbody>
              </task>
            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>
      </task>
    </xsl:template>

    <xsl:template match=\"cheatsheet\">
      <xsl:for-each select=\"item\">
        <step id=\"{generate-id(.)}\">
          <cmd>
            <xsl:apply-templates select=\"@title\"/>
          </cmd>
          <info>
            <xsl:apply-templates select=\"description\"/>
          </info>
          <stepxmp>
            <xsl:choose>
              <xsl:when test=\"@skip = 'true'\">optional</xsl:when>
            </xsl:choose>
          </stepxmp>
        </step>
      </xsl:for-each>
    </xsl:template>

    <xsl:template match=\"b\">
     <b><xsl:apply-templates/></b>
    </xsl:template>

    <xsl:template match=\"text()\">
      <xsl:copy/>
    </xsl:template>

    <xsl:template match=\"i[.='#{n}']\"/>

    <xsl:template
      match=\"text()[preceding-sibling::i[.='#{n}'][1]][following-sibling::i[.='#{n}'][1]]|
      *[preceding-sibling::i[.='#{n}'][1]][following-sibling::i[.='#{n}'][1]]\"/>

    <xsl:template match=\"br\">
      <ph />
    </xsl:template>

    <xsl:template match=\"i\">
      <xsl:apply-templates/>
    </xsl:template>

</xsl:stylesheet>"

  ditamap =
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE map PUBLIC \"-//OASIS//DTD DITA Map//EN\" \"map.dtd\">
<map>
  <title>Debrief Topic Map</title>
  <topicmeta>
    <searchtitle>Debrief Eclipse cheat sheets</searchtitle>
    <shortdesc>Overview of Debrief inside Eclipse</shortdesc>
    <author>Debrief</author>
    <author>John Bampton</author>
    <source>http://debrief.info/</source>
    <publisher>Github John Bampton and #{11_461_173_985_121.to_s.split(/[356]/).map(&:to_i).map(&:chr).join
        .capitalize}</publisher>
    <critdates>
      <created date=\"#{Date.today}\"/>
    </critdates>
    <audience type=\"marine expert\"
      job=\"analysis\" experiencelevel=\"intermediate\"/>
    <category>Maritime</category>
    <category>Software</category>
    <othermeta name=\"type\" content=\"Naval\"/>
  </topicmeta>"

  FileUtils.mkdir_p('output/dita')
  Dir.glob("#{path}/**/*_composite.xml").sort_by do |x|
    order.index(File.basename(x))
  end.each do |filename|
    document = Nokogiri.XML(File.new(filename))
    template = Nokogiri.XSLT(stylesheet)
    ditamap +=
      "
  <topicref href=\"dita/#{File.basename(filename, '.*')}.dita\" type=\"task\"/>"
    transformed_document = template.transform(document)
    File.open("output/dita/#{File.basename(filename, '.*')}.dita", 'w').write(
      transformed_document
    )
  end

  ditamap += '
</map>'
  File.open('output/map.ditamap', 'w'){|f| f.write(ditamap)}
  puts ditamap
end

create_dita(create_path(options.path))
