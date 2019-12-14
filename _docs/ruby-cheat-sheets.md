---
title: Eclipse cheat sheets (XML) to DITA with Ruby, XSL, Nokogiri
permalink: /docs/eclipse-cheat-sheets-to-dita-with-ruby-xsl-nokogiri/
---

# The Ruby Story

This project uses [Ruby](https://www.ruby-lang.org/en/) and tries to be and easy to use tutorial on all things  [Ruby](http://ruby-doc.org).

Ruby dates back to the 1990's and was first created by a Japanese man named [Yukihiro "Matz" Matsumoto](https://en.wikipedia.org/wiki/Yukihiro_Matsumoto).

Hey come and check out the [Ruby in 4 seconds](https://youtu.be/ayx4fASYkZU) video.

[Ruby](https://www.ruby-lang.org/en/) is very [powerful](https://www.ruby-lang.org/en/documentation/success-stories/), is growing in popularity and is currently ranked 11th on the [TIOBE Index](http://www.tiobe.com/tiobe_index).

There are two types of Ruby files: .rb, .rbw

[Matz](https://twitter.com/matz_translated) made run Ruby fun and easy to learn, so don't be scared and first check out a short Ruby YouTube video I created.

[Ruby in 29 seconds](https://youtu.be/2ei7S0FU65E)

[&#8593;](#the-ruby-story) [&#8595;](#watch-this-space)

## From Java, XSLT 2.0 with Saxon to Ruby, XSLT 1.0 with the Nokogiri Ruby gem

Using [Ruby](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579) on this project allows use to harness the power of [RubyGems](https://rubygems.org/) particularly the [Nokogiri](http://www.nokogiri.org/) gem along with XSLT 1.0 / XPath 1.0 to create the DITA XML files.  Using Ruby eliminates the need to use Eclipse and Apache Ant and can be run standalone from the command line as long as you have Ruby installed.

The Ruby file: `default.rb` builds the output parent Ditamap `map.ditamap` (output/map.ditamap) and the 4 sub DITA tasks in the `output/dita` folder.

[&#8593;](#the-ruby-story) [&#8595;](#watch-this-space)

## DITA Background

[Darwin Information Typing Architecture](https://en.wikipedia.org/wiki/Darwin_Information_Typing_Architecture) (DITA) is an [XML](https://en.wikipedia.org/wiki/XML) data model for authoring and using the [DITA Open Toolkit](http://www.dita-ot.org/) (DITA-OT) you can publish those ideas.

The DITA standard is maintained by the [OASIS](https://www.oasis-open.org/) DITA Technical Committee.

[&#8593;](#the-ruby-story) [&#8595;](#watch-this-space)

## The Project

The Ruby code in `default.rb` has some [XSL](https://en.wikipedia.org/wiki/XSL) code embedded,
 as well as some [XML](https://en.wikipedia.org/wiki/XML) markup in a interpolated [string literal](http://ruby-doc.org/core-2.2.0/doc/syntax/literals_rdoc.html) syntax.

The [Eclipse cheat sheets](https://www.oracle.com/technical-resources/articles/enterprise-architecture/eclipse-cheat-sheets.html) test data folder - `cheatsheets-xml-test-data` is best viewed inside Eclipse, and is used as input when `default.rb` runs.

[&#8593;](#the-ruby-story) [&#8595;](#watch-this-space)

## Resources

- [Nokogiri](http://www.nokogiri.org/)
- [JetBrains RubyMine](https://www.jetbrains.com/ruby/)
- [Eclipse](https://eclipse.org/)
- [Eclipse cheat sheets](https://www.oracle.com/technical-resources/articles/enterprise-architecture/eclipse-cheat-sheets.html)
- [DITA](https://en.wikipedia.org/wiki/Darwin_Information_Typing_Architecture)
- [W3C - The Extensible Stylesheet Language Family (XSL)](http://www.w3.org/Style/XSL/)
- [The Organization for the Advancement of Structured Information Standards (OASIS)](<https://en.wikipedia.org/wiki/OASIS_(organization)>)

[&#8593;](#the-ruby-story) [&#8595;](#watch-this-space)

## Watch This Space

[&#8593;](#the-ruby-story)
