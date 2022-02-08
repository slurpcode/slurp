---
layout: null
---
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="common.xsl"/>
    <xsl:template match="/rss">
        <html>
            <head>
                <style>
                    body {background-color: fuchsia; color: white; font-size: 20pt;}
                    p {text-align: center;}
                </style>
            </head>
            <body>
                <xsl:apply-templates select="channel/item"/>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
