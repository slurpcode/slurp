# 🌘 Eclipse cheat sheets to DITA to PDF

The original project created a set of DITA XML files and one highly customized
[PDF](https://www.adobe.com/au/acrobat/about-adobe-pdf.html) and there
are a couple of example PDFs that can be seen in the root of this repository.
Recently I added support for other output formats that are not customized
including HTMLHelp, TocJS and XHTML.

This program runs inside [Eclipse](https://www.eclipse.org/), an
[integrated development environment](https://en.wikipedia.org/wiki/Integrated_development_environment)
(IDE) and is mainly a Java based project in that all the code libraries use Java
([Apache FOP](https://xmlgraphics.apache.org/fop/),
[Saxon](https://sourceforge.net/projects/saxon/files/Saxon-HE/),
[DITA Open Toolkit](http://www.dita-ot.org/),
[Apache ANT](http://ant.apache.org/), Eclipse) and it also uses
[XSL](https://www.w3.org/Style/XSL/) and [XML](https://www.w3.org/XML/) heavily.
Using Eclipse allows us to create a publishing pipeline creating all the working
output formats one after the other, in one click by building the project.
Development was originally done in
[oXygen XML Editor](https://www.oxygenxml.com) then ported to Eclipse.

Since Java is now ranked number two on the
[TIOBE Index](https://www.tiobe.com/tiobe-index/), this project aims to be an easy
to follow tutorial on all the technologies listed.

The roadmap for this project is to keep the "info.debrief" custom DITA-OT plugin
up to date with the latest current version of DITA-OT, in depth instructions on
how to get up and running inside Eclipse and lots more.

When built and run this project takes a set of
[Eclipse cheat sheets](https://www.oracle.com/technical-resources/articles/enterprise-architecture/eclipse-cheat-sheets.html)
and transforms them to PDF. Eclipse cheat sheets are obviously best viewed
inside Eclipse. Using PDF allows us to print nicely formatted cheat sheets on
paper which allows the user to work through the cheat sheets with a pen and
check off each item as they go. Using cheat sheets physically on paper was seen
as a new way to learn and was the original concept of the Debrief cheat sheets
publishing project I worked on.

[Darwin Information Typing Architecture](https://en.wikipedia.org/wiki/Darwin_Information_Typing_Architecture)
(DITA) is an XML data model for authoring and using DITA-OT you can publish
those ideas. The DITA standard is maintained by the
[OASIS](https://www.oasis-open.org/)
[DITA Technical Committee](https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=dita).
Some of the largest and most successful companies in the world use DITA. The
next link is an informal list of
[companies using DITA](http://www.ditawriter.com/companies-using-dita/).

The running Ant Build is a two-step process, first the DITA XML is created from
the Eclipse cheat sheets (XML files) and then you use the DITA-Open Toolkit to
create the PDF from the auto created DITA files.

The two parts of the transformation and rendering consist of:

1. - This is the transformation step, and it uses cheatsheet-to-dita.xsl which
     requires an XSLT 2.0 compliant processor.
   - I used the open source product Saxon from
     [Saxonica](http://www.saxonica.com/welcome/welcome.xml) which came included
     with the DITA-OT 2.2.1 library.
   - This file takes as input a collection on XML files (Eclipse cheat sheets)
     and creates multiple output files - a parent DITA Map and some associated
     tasks.
   - The "output/debrief" and sub "dita" folder contains the dynamically created
     (transformed) DITA files from this step.

2. - This is the rendering (printing) step, and the 'info.debrief' custom
     DITA-OT plugin produces the PDF via the DITA-OT base libraries, and a XSL -
     Formatting Objects Processor (FO Processor)
   - The "output/debrief/pdf" folder contains the resulting PDF output from this
     step
   - I used Apache FOP 2.1 for the FO Processor

## How DITA-OT PDF Plugins work

Plugins are placed in the DITA-OT plugins directory. You can see the plugin I
built in this directory named "info.debrief".

<!-- ![info.debrief plugin location](_static/images/dita/info.debrief_plugin_location.png) -->

When ready a plugin must be integrated into DITA-OT using **Apache Ant**. I
built this project using OS X, and I installed Ant through **Homebrew**.

On the command line from inside the root DITA-OT folder it would be -> ant -f
integrator.xml

You can also run the integrator inside Eclipse as an Ant build by right clicking
on "src/libs/DITA-OT1.8.5/integrator.xml" and selecting -> Run As -> Ant Build
(first one) and this should integrate the plugin with the toolkit.

<!-- ![Run DITA-OT integrator inside eclipse with Ant](_static/images/eclipse/eclipse_run_dita_ot_integrator.png) -->

Every DITA-OT PDF plugin has a file name plugin.xml at its root where you set
the configuration values. The plugin id must match the folder name of the
plugin. Every plugin has a "transtype" -> this plugins transtype is "debrief".
You can see the plugin.xml file and where to set the plugin id and transtype in
the next image:

<!-- ![plugin.xml](_static/images/dita/transtype.png) -->

PDF Plugins are comprised of some XML config files, some artwork and some custom
XSL (XSLT/XSL-FO/XPath) code DITA-OT provides that base XSL code that you
'override' with your custom work.

The two main files that configure plugins are <u>plugin.xml</u> and
<u>integrator.xml</u> which should be in the root of the plugin folder. The
"cfg" folder contains the rest of the customization.

Custom XSL can be placed in two XSL files both named "custom.xsl". I placed all
the custom code at
"src/libs/DITA-OT1.8.5/plugins/info.debrief/cfg/fo/xsl/custom.xsl" for this
project. The other file is seen in the adjacent "attrs" directory.

<!-- ![custom.xsl](_static/images/dita/custom.xsl.png) -->

Placing the custom code only in these two files follows best practice techniques
on how to build a DITA-OT PDF plugin.
