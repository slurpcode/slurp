<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xs xd"
                version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>
                <xd:b>Author:</xd:b> John Bampton</xd:p>
            <xd:p>To finish</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:strip-space elements="*"/>

    <xd:doc>
        <xd:desc>Inside the 'source' folder since we are one level down</xd:desc>
    </xd:doc>
    <xsl:param name="pathToProject" select="'../.'"/>
    <xd:doc>
        <xd:desc>Path to the XML Schema should be inside the path to the project.</xd:desc>
    </xd:doc>
    <xsl:param name="pathToXMLSchema" select="'../assets/xml-schema'"/>

    <xd:doc>
        <xd:desc>Entry point to the script</xd:desc>
    </xd:doc>
    <xsl:template name="main"><!--  loop through the 'input schema' folder   -->
        <xsl:for-each select="collection(concat(resolve-uri($pathToXMLSchema),'/?select=*.xsd;recurse=yes;'))">
            <xsl:variable name="du" select="reverse(tokenize(document-uri(.), '/'))"/>
            <xsl:variable name="filename" select="subsequence($du, 1, 1)"/>
            <xsl:variable name="type" select="subsequence($du, 2, 1)"/>
            <!--<xsl:variable name="folder" select="subsequence($du, 3, 1)"/>-->
            <xsl:apply-templates select="*[local-name(.) = 'schema']">
                <xsl:with-param name="location"
                                select="concat(resolve-uri($pathToProject), 'schema/',  $type, '/', $filename)"/>
            </xsl:apply-templates>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="location"/>
    </xd:doc>
    <xsl:template match="*[local-name(.) = 'schema']">
        <xsl:param name="location"/>
        <!--  The next line writes a new doc at location which for this project is
            in the 'schema' folder -->
        <xsl:result-document encoding="UTF-8" href="{$location}" indent="yes">
            <xsl:element name="xsd:schema" namespace="{namespace-uri(.)}">
                <xsl:for-each select="namespace::*">
                    <xsl:sort select="name(.)"/>
                    <xsl:namespace name="{name(.)}">
                        <xsl:value-of select="."/>
                    </xsl:namespace>
                </xsl:for-each>
                <xsl:apply-templates select="@*">
                    <xsl:sort select="name(.)"/>
                </xsl:apply-templates>
                <xsl:for-each select="*[local-name(.) = 'import']">
                    <xsl:sort select="@namespace"/>
                    <xsl:copy-of select="."/>
                </xsl:for-each>
                <xsl:apply-templates select="node()[not(local-name(.) = 'import')]">
                    <xsl:sort select="@name"/>
                </xsl:apply-templates>
            </xsl:element>
        </xsl:result-document>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
