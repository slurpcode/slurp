# 🖨️ DITA to PDF with Eclipse

## Overview

This program runs inside [Eclipse](https://www.eclipse.org/), an
[integrated development environment](https://en.wikipedia.org/wiki/Integrated_development_environment)
(IDE) and is mainly a [Java](http://www.oracle.com/technetwork/java/index.html)
based project in that all the code libraries use Java
([Apache FOP](https://xmlgraphics.apache.org/fop/),
[Saxon](https://sourceforge.net/projects/saxon/files/Saxon-HE/),
[DITA Open Toolkit](http://www.dita-ot.org/),
[Apache ANT](http://ant.apache.org/)) and it also uses
[XSL](https://www.w3.org/Style/XSL/) and [XML](https://www.w3.org/XML/) heavily.
Development was originally done in
[oXygen XML Editor](https://www.oxygenxml.com/) then ported to Eclipse. Java is
now ranked first on the [TIOBE Index](https://www.tiobe.com/tiobe-index).

This project takes DITA XML as input and transforms it to
[PDF](https://en.wikipedia.org/wiki/PDF) with the
DITA Open Toolkit and a custom-made plugin using Apache Ant. Using PDF allows us
to print a nicely formatted documents on paper. Using Eclipse generating the PDF
output can be done in one click by building the project and this creates a
publishing pipeline making all the different PDF's one after the other.

[Darwin Information Typing Architecture](https://en.wikipedia.org/wiki/Darwin_Information_Typing_Architecture)
(DITA) is an XML data model for authoring and using DITA-OT you can publish
those ideas. The DITA standard is maintained by the
[OASIS](<https://en.wikipedia.org/wiki/OASIS_(organization)>) DITA Technical
Committee. Some of the largest and most successful companies in the world use
DITA. The next link is an informal list of
[companies using DITA](http://www.ditawriter.com/companies-using-dita/).

The Roadmap for this project is to make this into an easy to follow tutorial on
how to build and customize DITA-OT PDF plugins and publish your DITA content
using Eclipse. I am currently using DITA-OT 2.2.2 and I am aiming at keeping the
'info.debrief' plugin compatible with the current version of DITA-OT.

## How DITA-OT PDF Plugins work

Plugins are placed in the DITA-OT plugins directory. You can see the plugin I
built in this directory named 'info.debrief' and the auto built vanilla plugin
named 'sample'.

When ready a plugin must be integrated into DITA-OT using Apache Ant. I built
this project using OS X and I installed Ant through Homebrew.

To integrate a new plugin on the command line from inside the root DITA-OT
folder it would be -> ant -f integrator.xml

You can also run the integrator inside Eclipse as an Ant build by right clicking
on '/libs/dita-ot-2.2.2/integrator.xml' and selecting -> Run As -> Ant Build and
this should integrate the plugin with the toolkit.

Every plugin has a 'transtype' -> the two transtype's are 'debrief' and 'sample'

PDF Plugins are comprised of some XML config files, some artwork and some custom
XSL (XSLT/XSL-FO/XPath) code DITA-OT provides that base XSL code that you
'override' with your custom work.

The two main files that configure plugins are plugin.xml and integrator.xml
which should be in the root of the plugin folder. The 'cfg' folder contains the
rest of the customization.

Custom XSL can be placed in two XSL files both named custom.xsl. I placed all
the custom code at
'libs/dita-ot-2.2.2/plugins/info.debrief/cfg/fo/xsl/custom.xsl' for this
project. The other file is seen in the adjacent 'attrs' directory.

Placing the custom code only in these two files follows best practice techniques
on how to build a DITA-OT PDF plugin.

## List of resources and technologies used on this GitHub project

Eclipse - <https://eclipse.org/>

The Apache Software Foundation - <http://www.apache.org/>

Apache FOP - <https://xmlgraphics.apache.org/fop/>

Apache ANT - <http://ant.apache.org>

Saxon XSLT - <https://en.wikipedia.org/wiki/Saxon_XSLT>

Saxon - <http://saxon.sourceforge.net/>

Saxonica - <http://www.saxonica.com/welcome/welcome.xml>

Online community for the Darwin Information Typing Architecture OASIS Standard -
<http://dita.xml.org/>

DITA - <https://en.wikipedia.org/wiki/Darwin_Information_Typing_Architecture>

DITA-Open Toolkit - <http://www.dita-ot.org/>

W3C - The Extensible Stylesheet Language Family (XSL) -
<http://www.w3.org/Style/XSL/>

W3C XSLT 2.0 - <http://www.w3.org/TR/xslt20/>

XSL Formatting Objects - <https://en.wikipedia.org/wiki/XSL_Formatting_Objects>

XSL-FO Processors - <http://www.w3.org/community/ppl/wiki/XSL-FO_Processors>

XML - <https://en.wikipedia.org/wiki/XML>

Adobe PDF - <https://en.wikipedia.org/wiki/Portable_Document_Format>

The Organization for the Advancement of Structured Information Standards
(OASIS) - <https://en.wikipedia.org/wiki/OASIS_(organization)>

oXygen XML Editor - <http://www.oxygenxml.com>

DITA-OT installing plugins -
<https://dita-ot.sourceforge.net/>

Generate sample DITA-OT plugin -
<https://dita-generator.elovirta.com/>

Creating DITA-OT plugins -
<https://sourceforge.net/projects/dita-ot/>

Customizing PDF output -
<http://www.dita-ot.org/1.8/readme/dita2pdf-customization.html>

[comment]: <> (XSLT FAQ. Docbook FAQ. Braille. - <http://www.dpawson.co.uk/>)

Homebrew — The missing package manager for OS X - <http://brew.sh/>

Apache Ant Wikipedia - <https://en.wikipedia.org/wiki/Apache_Ant>

Install Ant with Homebrew - <https://formulae.brew.sh/formula/ant#default>

Installing Apache Ant - <http://ant.apache.org/manual/install.html>

Codecademy - Learn the Command Line -
<https://www.codecademy.com/courses/learn-the-command-line>

Codecademy - Learn Java - <https://www.codecademy.com/learn/learn-java>

Got 15 minutes and want to learn Git?
<https://try.github.io/levels/1/challenges/1>

Ruby regular expression editor - <http://rubular.com/>

Essential programmer training - <http://www.codewars.com/>

Mastering Markdown - <https://guides.github.com/features/mastering-markdown/>

GitHub Desktop - <https://desktop.github.com/>

TechSmith Camtasia - <https://www.techsmith.com/camtasia.html>

MD5 - <https://en.wikipedia.org/wiki/MD5>

sha1sum - <https://en.wikipedia.org/wiki/Sha1sum>

IDE - Integrated Development Environment -
<https://en.wikipedia.org/wiki/Integrated_development_environment>

Git (software) - <https://en.wikipedia.org/wiki/Git_(software)>
man page - <https://en.wikipedia.org/wiki/Man_page>

Terminal (OS X) - <https://en.wikipedia.org/wiki/Terminal_(OS_X)>
