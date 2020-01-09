<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet 
	exclude-result-prefixes="ditaarch opentopic e" 
	version="2.0" 
	xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" 
	xmlns:e="print-pdf" 
	xmlns:fo="http://www.w3.org/1999/XSL/Format" 
	xmlns:opentopic="http://www.idiominc.com/opentopic" 
	xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:ot-placeholder="http://suite-sol.com/namespaces/ot-placeholder">
   
    <xsl:variable name="map-based-page-sequence-generation" select="false()" as="xs:boolean"/>
    
	<xsl:attribute-set name="topic.title" use-attribute-sets="common.title">
		<xsl:attribute name="border-bottom">3pt solid #1d3768</xsl:attribute>
        <xsl:attribute name="space-before">0pt</xsl:attribute>
        <xsl:attribute name="space-after">16.8pt</xsl:attribute>
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="padding-top">16.8pt</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
		<xsl:attribute name="color">#1d3768</xsl:attribute>
    </xsl:attribute-set>

	<xsl:attribute-set name="topic.topic.title" use-attribute-sets="common.title common.border__bottom">
        <xsl:attribute name="space-before">15pt</xsl:attribute>
        <xsl:attribute name="space-before">12pt</xsl:attribute>
        <xsl:attribute name="space-after">5pt</xsl:attribute>
        <xsl:attribute name="font-size">14pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="padding-top">12pt</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
		<xsl:attribute name="color">#1d3768</xsl:attribute>
    </xsl:attribute-set>
	
	<xsl:attribute-set name="common.border__bottom">
		<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
		<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
		<xsl:attribute name="border-bottom-color">#1d3768</xsl:attribute>
	</xsl:attribute-set> 
	
	<xsl:attribute-set name="__fo__root" use-attribute-sets="base-font">
        <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="xml:lang" select="translate($locale, '_', '-')"/>
        <xsl:attribute name="writing-mode" select="$writing-mode"/>
    </xsl:attribute-set>
	
	<xsl:attribute-set name="namespace-custom-table-nb">
		<xsl:attribute name="border-collapse">collapse</xsl:attribute>
		<xsl:attribute name="width">100%</xsl:attribute>
		<xsl:attribute name="table-layout">fixed</xsl:attribute>
		<xsl:attribute name="font-size">10pt</xsl:attribute>
		<xsl:attribute name="border">none</xsl:attribute>
		<xsl:attribute name="padding">0pt</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="namespace-custom-tc-0">
		<xsl:attribute name="padding">0pt</xsl:attribute>
		<xsl:attribute name="margin">0pt</xsl:attribute>
	</xsl:attribute-set>
		
	<xsl:attribute-set name="namespace-custom-school-style">
		<xsl:attribute name="font-size">12pt</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="namespace-custom-last-body-header">
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="start-indent">20mm</xsl:attribute>
		<xsl:attribute name="space-before">10pt</xsl:attribute>
		<xsl:attribute name="space-before.conditionality">retain</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="listItemstyle">
		<xsl:attribute name="font-size">10pt</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="region-after-last">
		<xsl:attribute name="extent">
		  <xsl:value-of select="'4cm'"/>
		</xsl:attribute>
		<xsl:attribute name="display-align">after</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="region-body.odd-first">
		<xsl:attribute name="margin-top">
		  <xsl:value-of select="'200pt'"/>
		</xsl:attribute>
		<xsl:attribute name="margin-bottom">
		  <xsl:value-of select="$page-margin-bottom"/>
		</xsl:attribute>
		<xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
		  <xsl:value-of select="$page-margin-inside"/>
		</xsl:attribute>
		<xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
		  <xsl:value-of select="$page-margin-outside"/>
		</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="region-before-first">
		<xsl:attribute name="extent">
		  <xsl:value-of select="'200pt'"/>
		</xsl:attribute>
	</xsl:attribute-set>	
	  
	<xsl:attribute-set name="body" use-attribute-sets="base-font">
		<xsl:attribute name="start-indent">0</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="body__toplevel" use-attribute-sets="base-font">
		<xsl:attribute name="start-indent">0</xsl:attribute>
	</xsl:attribute-set>
	  
	<xsl:attribute-set name="odd__header-first">
		<xsl:attribute name="text-align">end</xsl:attribute>
		<xsl:attribute name="end-indent">20mm</xsl:attribute>
		<xsl:attribute name="space-before">10pt</xsl:attribute>
		<xsl:attribute name="space-before.conditionality">retain</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="odd__footer">
		<xsl:attribute name="text-align">end</xsl:attribute>
		<xsl:attribute name="end-indent">20mm</xsl:attribute>
		<xsl:attribute name="space-after">10pt</xsl:attribute>
		<xsl:attribute name="space-after.conditionality">retain</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="steps.step" use-attribute-sets="ol.li">
        <xsl:attribute name="space-after">3pt</xsl:attribute>
        <xsl:attribute name="space-before">3pt</xsl:attribute>
		<xsl:attribute name="start-indent">15pt</xsl:attribute>
    </xsl:attribute-set>
	
	<!--Ordered list-->
    <xsl:attribute-set name="ol" use-attribute-sets="common.block">
        <xsl:attribute name="provisional-distance-between-starts">1mm</xsl:attribute>
        <xsl:attribute name="provisional-label-separation">1mm</xsl:attribute>
    </xsl:attribute-set>


<!-- End common attribute sets  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   -->

	
	<xsl:template name="createFrontMatter">
        <fo:page-sequence master-reference="front-matter" xsl:use-attribute-sets="__force__page__count">
            <xsl:call-template name="insertFrontMatterStaticContents"/>
            <fo:flow flow-name="xsl-region-body">
                <fo:block xsl:use-attribute-sets="__frontmatter">
                    <!-- set the title -->
                    <fo:block xsl:use-attribute-sets="__frontmatter__owner">
                        <fo:table xsl:use-attribute-sets="namespace-custom-table-nb">
							<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
							<fo:table-column column-width="proportional-column-width(4)" column-number="2"/>
							<fo:table-body>  
								<fo:table-row>
									<fo:table-cell>
										<fo:block xsl:use-attribute-sets=	"__frontmatter__title">
											<fo:external-graphic src="url({concat($artworkPrefix, '/Customization/OpenTopic/common/artwork/logo.png')})" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="left" xsl:use-attribute-sets=	"__frontmatter__title">
											<fo:block padding-top="1cm">
											Debrief Cheat Sheets
											</fo:block>
										</fo:block>
										<fo:block text-align="left">Welcome to the Debrief Cheat Sheets. This is a set of self-teach tutorials that you will use to learn about Debrief. In working through the tutorials you'll encounter the breadth of the Debrief applicaftion, ready for using the tool for your own analysis.</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
                    </fo:block>
                </fo:block>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>
	
	<xsl:template match="*[contains(@class, ' task/cmd ')]" priority="1">
       <fo:table xsl:use-attribute-sets="namespace-custom-table-nb">
            <fo:table-column column-width="proportional-column-width(8)" column-number="1"/>
            <fo:table-column column-width="proportional-column-width(2)" column-number="2"/>
            <fo:table-body>  
                <fo:table-row> 
                    <fo:table-cell>
                        <fo:block xsl:use-attribute-sets="cmd listItemstyle">
                            <xsl:call-template name="commonattributes"/>
                            <xsl:if test="../@importance='optional'">
                                <xsl:call-template name="getVariable">
                                    <xsl:with-param name="id" select="'Optional Step'"/>
                                </xsl:call-template>
                                <xsl:text> </xsl:text>
                            </xsl:if>
                            <xsl:apply-templates/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell display-align="center" number-rows-spanned="2">
                        <fo:block xsl:use-attribute-sets="stepxmp" text-align="center">
                            <xsl:call-template name="commonattributes"/>
                            <xsl:apply-templates select="following-sibling::*[2]" mode="oursinline" />
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell xsl:use-attribute-sets="namespace-custom-tc-0" start-indent="30pt">
                        <fo:block xsl:use-attribute-sets="info">
                            <xsl:call-template name="commonattributes"/>
                            <xsl:apply-templates select="following-sibling::*[1]" mode="oursinline"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    <xsl:template match="*[contains(@class, ' task/info ')]"></xsl:template>
		
    <xsl:template match="*[contains(@class, ' task/info ')]" mode="oursinline">
		<fo:block xsl:use-attribute-sets="info">
			<xsl:call-template name="commonattributes"/>
			<xsl:apply-templates/>
		</fo:block>
    </xsl:template>
	
	 <xsl:template match="*[contains(@class, ' task/steps ')]/*[contains(@class, ' task/step ')]">
        <!-- Switch to variable for the count rather than xsl:number, so that step specializations are also counted -->
        <xsl:variable name="actual-step-count" select="number(count(preceding-sibling::*[contains(@class, ' task/step ')])+1)"/>
        <fo:list-item xsl:use-attribute-sets="steps.step" keep-together.within-page="always">
            <fo:list-item-label xsl:use-attribute-sets="steps.step__label listItemstyle">
                <fo:block xsl:use-attribute-sets="steps.step__label__content">
                    <fo:inline>
                        <xsl:call-template name="commonattributes"/>
                    </fo:inline>
                    <xsl:if test="preceding-sibling::*[contains(@class, ' task/step ')] | following-sibling::*[contains(@class, ' task/step ')]">
                        <xsl:call-template name="getVariable">
                            <xsl:with-param name="id" select="'Ordered List Number'"/>
                            <xsl:with-param name="params">
                                <number>
                                    <xsl:value-of select="$actual-step-count"/>
                                </number>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:if>
                </fo:block>
            </fo:list-item-label>
            <fo:list-item-body xsl:use-attribute-sets="steps.step__body">
                <fo:block xsl:use-attribute-sets="steps.step__content">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>
        </fo:list-item>
    </xsl:template>
	
	<xsl:template match="*[contains(@class, ' task/stepxmp ')]" mode="oursinline">
		<!-- insert image here 	-->
	 	<fo:external-graphic src="url({concat($artworkPrefix, '/Customization/OpenTopic/common/artwork/newbox.png')})" />
		<!-- output optional 	 	-->
		<fo:block font-size="8pt">			
			<xsl:if test="child::text()">(</xsl:if>
			<xsl:apply-templates/>
			<xsl:if test="child::text()">)</xsl:if>
		</fo:block>
    </xsl:template>
	
	<xsl:template match="*[contains(@class, ' task/stepxmp ')]"></xsl:template>	
	
    <xsl:template name="insertBodyFirstFooter">
		<fo:static-content flow-name="first-body-footer">
            <fo:table xsl:use-attribute-sets="namespace-custom-table-nb">
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="2"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="3"/>
				<fo:table-body>  
					<fo:table-row>
						<fo:table-cell xsl:use-attribute-sets="namespace-custom-tc-0">
							<fo:block></fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="namespace-custom-tc-0" text-align="center">
							<fo:block>DebriefNG Cheat Sheets</fo:block>
							<fo:block>www.debrief.info</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="namespace-custom-tc-0">
							<fo:block xsl:use-attribute-sets="__body__first__footer">
				                <xsl:call-template name="getVariable">
			                    <xsl:with-param name="id" select="'Body first footer'"/>
			                    <xsl:with-param name="params">
			                        <heading>
			                            <fo:inline xsl:use-attribute-sets="__body__first__footer__heading">
			                                <fo:retrieve-marker retrieve-class-name="current-header"/>
			                            </fo:inline>
			                        </heading>
			                        <pagenum>
			                            <fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
			                                <fo:page-number/> of <fo:page-number-citation ref-id="{generate-id(.)}"/> 
			                            </fo:inline>
			                        </pagenum>
			                    </xsl:with-param>
			                </xsl:call-template>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>	
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertBodyOddFooter">
		<fo:static-content flow-name="odd-body-footer">
            <fo:table xsl:use-attribute-sets="namespace-custom-table-nb">
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="2"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="3"/>
				<fo:table-body>  
					<fo:table-row>
						<fo:table-cell xsl:use-attribute-sets="namespace-custom-tc-0">
							<fo:block></fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="namespace-custom-tc-0" text-align="center">
							<fo:block>DebriefNG Cheat Sheets</fo:block>
							<fo:block>www.debrief.info</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="namespace-custom-tc-0">
							<fo:block xsl:use-attribute-sets="__body__first__footer">
								<xsl:call-template name="getVariable">
				                    <xsl:with-param name="id" select="'Body odd footer'"/>
				                    <xsl:with-param name="params">
				                        <heading>
				                            <fo:inline xsl:use-attribute-sets="__body__odd__footer__heading">
				                                <fo:retrieve-marker retrieve-class-name="current-header"/>
				                            </fo:inline>
				                        </heading>
				                        <pagenum>
				                            <fo:inline xsl:use-attribute-sets="__body__odd__footer__pagenum">
				                                 <fo:page-number/> of <fo:page-number-citation ref-id="{generate-id(.)}"/>
				                            </fo:inline>
				                        </pagenum>
				                    </xsl:with-param>
				                </xsl:call-template>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>	
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyLastHeader">
        <fo:static-content flow-name="last-body-header">
            <fo:block xsl:use-attribute-sets="namespace-custom-last-body-header">
            <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Body odd header'"/>
                    <xsl:with-param name="params">
                        <prodname>
                          <xsl:value-of select="$productName"/>
                        </prodname>
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__header__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__odd__header__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertBodyLastFooter">
        <fo:static-content flow-name="last-body-footer">
			<fo:block  text-align="end" xsl:use-attribute-sets="namespace-custom-school-style" end-indent="20mm" margin-bottom="10pt">
				Signed: <fo:leader leader-length="3cm" leader-pattern-width="1mm" leader-pattern="rule"></fo:leader>
				Date: <fo:leader leader-length="3cm" leader-pattern-width="1mm" leader-pattern="rule"></fo:leader>
			</fo:block>
            <fo:table xsl:use-attribute-sets="namespace-custom-table-nb">
				<fo:table-column column-width="proportional-column-width(1)" column-number="1"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="2"/>
				<fo:table-column column-width="proportional-column-width(1)" column-number="3"/>
				<fo:table-body>  
					<fo:table-row>
						<fo:table-cell xsl:use-attribute-sets="namespace-custom-tc-0">
							<fo:block></fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="namespace-custom-tc-0" text-align="center">
							<fo:block>DebriefNG Cheat Sheets</fo:block>
							<fo:block>www.debrief.info</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="namespace-custom-tc-0">
							<fo:block xsl:use-attribute-sets="__body__first__footer">
								<xsl:call-template name="getVariable">
				                    <xsl:with-param name="id" select="'Body first footer'"/>
				                    <xsl:with-param name="params">
				                        <heading>
				                            <fo:inline xsl:use-attribute-sets="__body__first__footer__heading">
				                                <fo:retrieve-marker retrieve-class-name="current-header"/>
				                            </fo:inline>
				                        </heading>
				                        <pagenum>
				                            <fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
				                                 <fo:page-number/> of <fo:page-number-citation ref-id="{generate-id(.)}"/>
				                            </fo:inline>
				                        </pagenum>
				                    </xsl:with-param>
				                </xsl:call-template>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>	
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertBodyOddHeader">
        <fo:static-content flow-name="odd-body-header">
            <fo:block xsl:use-attribute-sets="namespace-custom-last-body-header">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Body odd header'"/>
                    <xsl:with-param name="params">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__header__heading">
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__odd__header__pagenum">
                                <fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertBodyFirstHeader">
		<fo:static-content flow-name="first-body-header">
            <fo:block xsl:use-attribute-sets="odd__header-first">
				<fo:block>
					<xsl:call-template name="getVariable">
	                    <xsl:with-param name="id" select="'Body first header'"/>
	                    <xsl:with-param name="params">
	                        <prodname>
	                          <xsl:value-of select="$productName"/>
	                        </prodname>
	                        <heading>
	                            <fo:inline xsl:use-attribute-sets="__body__first__header__heading">
	                                <fo:retrieve-marker retrieve-class-name="current-header"/>
	                            </fo:inline>
	                        </heading>
	                        <pagenum>
	                            <fo:inline xsl:use-attribute-sets="__body__first__header__pagenum">
	                                <fo:page-number/>
	                            </fo:inline>
	                        </pagenum>
	                    </xsl:with-param>
	                </xsl:call-template>
				</fo:block>
				<fo:block  xsl:use-attribute-sets="namespace-custom-school-style" text-align="left" start-indent="20mm">
					Name: <fo:leader leader-length="3cm" leader-pattern-width="1mm" leader-pattern="rule"></fo:leader> Date: <fo:leader leader-length="3cm" leader-pattern-width="1mm" leader-pattern="rule"></fo:leader>
				</fo:block>
				<fo:block>
					<fo:external-graphic content-width="175.9mm" src="url({concat($artworkPrefix, '/Customization/OpenTopic/common/artwork/debrief_banner.jpg')})" />
				</fo:block>
				<fo:block text-align="right" margin-top="7pt" color="#1d3768">Please forward feedback on this cheat-sheet to support@debrief.info</fo:block>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template match="/" mode="create-page-masters">
	    
        <!-- Frontmatter simple masters -->
        <fo:simple-page-master master-name="front-matter-first" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body__frontmatter.odd"/>
        </fo:simple-page-master>

        <fo:simple-page-master master-name="front-matter-last" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body__frontmatter.even"/>
            <fo:region-before  region-name="last-frontmatter-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="last-frontmatter-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>

        <xsl:if test="$mirror-page-margins">
          <fo:simple-page-master master-name="front-matter-even" xsl:use-attribute-sets="simple-page-master">
              <fo:region-body xsl:use-attribute-sets="region-body__frontmatter.even"/>
              <fo:region-before region-name="even-frontmatter-header" xsl:use-attribute-sets="region-before"/>
              <fo:region-after region-name="even-frontmatter-footer" xsl:use-attribute-sets="region-after"/>
          </fo:simple-page-master>
        </xsl:if>

        <fo:simple-page-master master-name="front-matter-odd" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body__frontmatter.odd"/>
            <fo:region-before region-name="odd-frontmatter-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="odd-frontmatter-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>

        <!--TOC simple masters-->
        <xsl:if test="$mirror-page-margins">
          <fo:simple-page-master master-name="toc-even" xsl:use-attribute-sets="simple-page-master">
              <fo:region-body xsl:use-attribute-sets="region-body.even"/>
              <fo:region-before region-name="even-toc-header" xsl:use-attribute-sets="region-before"/>
              <fo:region-after region-name="even-toc-footer" xsl:use-attribute-sets="region-after"/>
          </fo:simple-page-master>
        </xsl:if>

        <fo:simple-page-master master-name="toc-odd" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.odd"/>
            <fo:region-before region-name="odd-toc-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="odd-toc-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>

        <fo:simple-page-master master-name="toc-last" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.even"/>
            <fo:region-before region-name="even-toc-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="even-toc-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>

        <fo:simple-page-master master-name="toc-first" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.odd"/>
            <fo:region-before region-name="odd-toc-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="odd-toc-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>

        <!--BODY simple masters-->
        <fo:simple-page-master master-name="body-first" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.odd-first"/>
            <fo:region-before region-name="first-body-header" xsl:use-attribute-sets="region-before-first"/>
            <fo:region-after region-name="first-body-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>

        <xsl:if test="$mirror-page-margins">
          <fo:simple-page-master master-name="body-even" xsl:use-attribute-sets="simple-page-master">
              <fo:region-body xsl:use-attribute-sets="region-body.even"/>
              <fo:region-before region-name="even-body-header" xsl:use-attribute-sets="region-before"/>
              <fo:region-after region-name="even-body-footer" xsl:use-attribute-sets="region-after"/>
          </fo:simple-page-master>
        </xsl:if>

        <fo:simple-page-master master-name="body-odd" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.odd"/>
            <fo:region-before region-name="odd-body-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="odd-body-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>

        <fo:simple-page-master master-name="body-last" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.even"/>
            <fo:region-before region-name="last-body-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="last-body-footer" xsl:use-attribute-sets="region-after-last"/>
        </fo:simple-page-master>

        <!--INDEX simple masters-->
        <fo:simple-page-master master-name="index-first" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body__index.odd"/>
            <fo:region-before region-name="odd-index-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="odd-index-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>

        <xsl:if test="$mirror-page-margins">
          <fo:simple-page-master master-name="index-even" xsl:use-attribute-sets="simple-page-master">
              <fo:region-body xsl:use-attribute-sets="region-body__index.even"/>
              <fo:region-before region-name="even-index-header" xsl:use-attribute-sets="region-before"/>
              <fo:region-after region-name="even-index-footer" xsl:use-attribute-sets="region-after"/>
          </fo:simple-page-master>
        </xsl:if>

        <fo:simple-page-master master-name="index-odd" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body__index.odd"/>
            <fo:region-before region-name="odd-index-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="odd-index-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>

        <!--GLOSSARY simple masters-->
        <fo:simple-page-master master-name="glossary-first" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.odd"/>
            <fo:region-before region-name="odd-glossary-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="odd-glossary-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>

        <xsl:if test="$mirror-page-margins">
          <fo:simple-page-master master-name="glossary-even" xsl:use-attribute-sets="simple-page-master">
              <fo:region-body xsl:use-attribute-sets="region-body.even"/>
              <fo:region-before region-name="even-glossary-header" xsl:use-attribute-sets="region-before"/>
              <fo:region-after region-name="even-glossary-footer" xsl:use-attribute-sets="region-after"/>
          </fo:simple-page-master>
        </xsl:if>

        <fo:simple-page-master master-name="glossary-odd" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.odd"/>
            <fo:region-before region-name="odd-glossary-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="odd-glossary-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>
    </xsl:template>
	
	
    <xsl:template match="*[contains(@class, ' topic/topic ')]">
        <xsl:variable name="topicType" as="xs:string">
            <xsl:call-template name="determineTopicType"/>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$topicType = 'topicChapter'">
                <xsl:call-template name="processTopicChapter"/>
            </xsl:when>
            <xsl:when test="$topicType = 'topicAppendix'">
                <xsl:call-template name="processTopicAppendix"/>
            </xsl:when>
            <xsl:when test="$topicType = 'topicAppendices'">
                <xsl:call-template name="processTopicAppendices"/>
            </xsl:when>
            <xsl:when test="$topicType = 'topicPart'">
                <xsl:call-template name="processTopicPart"/>
            </xsl:when>
            <xsl:when test="$topicType = 'topicPreface'">
                <xsl:call-template name="processTopicPreface"/>
            </xsl:when>
            <xsl:when test="$topicType = 'topicNotices'">
                <xsl:if test="$retain-bookmap-order">
                    <xsl:call-template name="processTopicNotices"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$topicType = 'topicTocList'">
                <xsl:call-template name="processTocList"/>
            </xsl:when>
            <xsl:when test="$topicType = 'topicIndexList'">
                <xsl:call-template name="processIndexList"/>
            </xsl:when>
            <xsl:when test="$topicType = 'topicSimple'">
                
                <xsl:variable name="page-sequence-reference" select="if ($mapType = 'bookmap') then 'body-sequence' else 'ditamap-body-sequence'"/>
                <xsl:choose>
                    <xsl:when test="empty(ancestor::*[contains(@class,' topic/topic ')]) and empty(ancestor::ot-placeholder:glossarylist)">
                        <fo:page-sequence master-reference="{$page-sequence-reference}" 
                            force-page-count="no-force" initial-page-number="1">
                            <xsl:call-template name="startPageNumbering"/>
                            <xsl:call-template name="insertBodyStaticContents"/>
                            <fo:flow flow-name="xsl-region-body">
                                <xsl:apply-templates select="." mode="processTopic"/>
                                <fo:block id="{generate-id(.)}"></fo:block>
                            </fo:flow>
                        </fo:page-sequence>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="." mode="processTopic"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="." mode="processUnknowTopic">
                    <xsl:with-param name="topicType" select="$topicType"/>
                </xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
	
	<xsl:template match="ph">
		<fo:block><xsl:text>&#10;</xsl:text></fo:block>
	</xsl:template>
	
    <xsl:template match="/" mode="create-page-sequences">
        <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'toc-sequence'"/>
            <xsl:with-param name="master-reference" select="'toc'"/>
        </xsl:call-template>
        <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'body-sequence'"/>
            <xsl:with-param name="master-reference" select="'body'"/>
        </xsl:call-template>
        <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'ditamap-body-sequence'"/>
            <xsl:with-param name="master-reference" select="'body'"/>
            <xsl:with-param name="first" select="true()"/>
            <xsl:with-param name="last" select="true()"/>
        </xsl:call-template>
        <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'index-sequence'"/>
            <xsl:with-param name="master-reference" select="'index'"/>
            <xsl:with-param name="last" select="false()"/>
        </xsl:call-template>
        <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'front-matter'"/>
            <xsl:with-param name="master-reference" select="'front-matter'"/>
        </xsl:call-template>
        <xsl:if test="$generate-back-cover">
            <xsl:call-template name="generate-page-sequence-master">
                <xsl:with-param name="master-name" select="'back-cover'"/>
                <xsl:with-param name="master-reference" select="'back-cover'"/>
                <xsl:with-param name="first" select="false()"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'glossary-sequence'"/>
            <xsl:with-param name="master-reference" select="'glossary'"/>
            <xsl:with-param name="last" select="false()"/>
        </xsl:call-template>
    </xsl:template>
	
	<xsl:template name="generate-page-sequence-master">
		<xsl:param name="master-name"/>
		<xsl:param name="master-reference"/>
		<xsl:param name="first" select="true()"/>
		<xsl:param name="last" select="true()"/>
		<fo:page-sequence-master master-name="{$master-name}">
		  <fo:repeatable-page-master-alternatives>
			<xsl:if test="$first">
			  <fo:conditional-page-master-reference master-reference="{$master-reference}-first"
													odd-or-even="odd"
													page-position="first"/>
			</xsl:if>
			<xsl:if test="$last">
			  <fo:conditional-page-master-reference master-reference="{$master-reference}-last"
													odd-or-even="any"
													page-position="last"/>
			</xsl:if> 
			<xsl:choose>
			  <xsl:when test="$mirror-page-margins">
				<fo:conditional-page-master-reference master-reference="{$master-reference}-odd"
													  odd-or-even="odd"/>
				<fo:conditional-page-master-reference master-reference="{$master-reference}-even"
													  odd-or-even="even"/>
			  </xsl:when>
			  <xsl:otherwise>
				<fo:conditional-page-master-reference master-reference="{$master-reference}-odd"/>
			  </xsl:otherwise>
			</xsl:choose>
		  </fo:repeatable-page-master-alternatives>
		</fo:page-sequence-master>
	  </xsl:template>
	  
</xsl:stylesheet>