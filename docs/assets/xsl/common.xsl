<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:atom="http://www.w3.org/2005/Atom">
    <xsl:template match="atom:entry">
        <div>
            <p>
                <xsl:value-of select="atom:title" disable-output-escaping="yes"/>
            </p>
            <p>
                <xsl:value-of select="atom:content" disable-output-escaping="yes"/>
            </p>
            <p>
                <xsl:value-of select="substring(atom:published,1,10)"/>
            </p>
        </div>
    </xsl:template>
    <xsl:template match="item">
        <div>
            <p>
                <xsl:value-of select="title" disable-output-escaping="yes"/>
            </p>
            <p>
                <xsl:value-of select="description" disable-output-escaping="yes"/>
            </p>
            <p>
                <xsl:value-of select="substring(pubDate,1,16)"/>
            </p>
        </div>
    </xsl:template>
</xsl:stylesheet>
