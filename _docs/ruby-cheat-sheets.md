---
title: 📄 Eclipse cheat sheets (XML) to DITA with Ruby, XSL, Nokogiri
permalink: /docs/eclipse-cheat-sheets-to-dita-with-ruby-xsl-nokogiri/
---

# From Java, XSLT 2.0 with Saxon to Ruby, XSLT 1.0 with the Nokogiri Ruby gem

Using
[Ruby](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
on this project allows use to harness the power of
[RubyGems](https://rubygems.org/) particularly the
[Nokogiri](http://www.nokogiri.org/) gem along with XSLT 1.0 / XPath 1.0 to
create the DITA XML files. Using Ruby eliminates the need to use Eclipse and
Apache Ant and can be run standalone from the command line as long as you have
Ruby installed.

The Ruby file: `ruby-cheatsheets-to-dita.rb` builds the output parent Ditamap `map.ditamap`
(output/map.ditamap) and the 4 sub DITA tasks in the `output/dita` folder.

[&#8593;](<#eclipse-cheat-sheets-(xml)-to-dita-with-ruby-xsl-nokogiri>)
[&#8595;](#watch-this-space)

## DITA Background

[Darwin Information Typing Architecture](https://en.wikipedia.org/wiki/Darwin_Information_Typing_Architecture)
(DITA) is an [XML](https://en.wikipedia.org/wiki/XML) data model for authoring
and using the [DITA Open Toolkit](http://www.dita-ot.org/) (DITA-OT) you can
publish those ideas.

The DITA standard is maintained by the [OASIS](https://www.oasis-open.org/) DITA
Technical Committee.

[&#8593;](<#eclipse-cheat-sheets-(xml)-to-dita-with-ruby-xsl-nokogiri>)
[&#8595;](#watch-this-space)

## The Project

The Ruby code in `ruby-cheatsheets-to-dita.rb` has some [XSL](https://en.wikipedia.org/wiki/XSL)
code embedded, as well as some [XML](https://en.wikipedia.org/wiki/XML) markup
in a interpolated
[string literal](http://ruby-doc.org/core-2.2.0/doc/syntax/literals_rdoc.html)
syntax.

The
[Eclipse cheat sheets](https://www.oracle.com/technical-resources/articles/enterprise-architecture/eclipse-cheat-sheets.html)
test data folder - `cheatsheets-xml-test-data` is best viewed inside Eclipse,
and is used as input when `ruby-cheatsheets-to-dita.rb` runs.

[&#8593;](<#eclipse-cheat-sheets-(xml)-to-dita-with-ruby-xsl-nokogiri>)
[&#8595;](#watch-this-space)

## Resources

- [Nokogiri](http://www.nokogiri.org/)
- [JetBrains RubyMine](https://www.jetbrains.com/ruby/)
- [Eclipse](https://eclipse.org/)
- [Eclipse cheat sheets](https://www.oracle.com/technical-resources/articles/enterprise-architecture/eclipse-cheat-sheets.html)
- [DITA](https://en.wikipedia.org/wiki/Darwin_Information_Typing_Architecture)
- [W3C - The Extensible Stylesheet Language Family (XSL)](http://www.w3.org/Style/XSL/)
- [The Organization for the Advancement of Structured Information Standards (OASIS)](<https://en.wikipedia.org/wiki/OASIS_(organization)>)

[&#8593;](<#eclipse-cheat-sheets-(xml)-to-dita-with-ruby-xsl-nokogiri>)
[&#8595;](#watch-this-space)

## Watch This Space

[&#8593;](<#eclipse-cheat-sheets-(xml)-to-dita-with-ruby-xsl-nokogiri>)
