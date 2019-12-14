#!/usr/bin/env ruby

require 'date'
require 'fileutils'
require 'nokogiri'

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

  <xsl:template match=\"i[.='#{
    n
  }']\"/>

  <xsl:template
    match=\"text()[preceding-sibling::i[.='#{
    n
  }'][1]][following-sibling::i[.='#{n}'][1]]|
    *[preceding-sibling::i[.='#{
    n
  }'][1]][following-sibling::i[.='#{
    n
  }'][1]]\"/>

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
    <publisher>Github John Bampton and #{
    11_461_173_985_121.to_s.split(/[356]/).map(&:to_i).map(&:chr).join
      .capitalize
  }</publisher>
    <critdates>
      <created date=\"#{
    Date.today
  }\"/>
    </critdates>
    <audience type=\"marine expert\"
      job=\"analysis\" experiencelevel=\"intermediate\"/>
    <category>Maritime</category>
    <category>Software</category>
    <othermeta name=\"type\" content=\"Naval\"/>
  </topicmeta>"

FileUtils.mkdir_p('output/dita')
Dir.glob('cheatsheets-xml-test-data/**/*_composite.xml').sort_by do |x|
  order.index(File.basename(x))
end.each do |filename|
  document = Nokogiri.XML(File.new(filename))
  template = Nokogiri.XSLT(stylesheet)
  ditamap +=
    "
  <topicref href=\"dita/#{
      File.basename(filename, '.*')
    }.dita\" type=\"task\"/>"
  transformed_document = template.transform(document)
  File.open("output/dita/#{File.basename(filename, '.*')}.dita", 'w').write(
    transformed_document
  )
end

ditamap += '
</map>'

File.open('output/map.ditamap', 'w') { |f| f.write(ditamap) }

puts ditamap
