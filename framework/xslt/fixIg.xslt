<?xml version="1.0" encoding="UTF-8"?>
<!--
  - Strip off schema declaration and unofficial extension
  -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xsi xs f">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
  <xsl:param name="version"/>
  <xsl:param name="altVNumber"/>
  <xsl:template match="/">
    <xsl:comment>DO NOT EDIT THIS FILE - It is generated and any changes made here will be overwritten</xsl:comment>
    <xsl:choose>
      <xsl:when test="not($version)">
        <xsl:apply-templates select="*"/>
      </xsl:when>
      <xsl:when test="$version='STU3'">
        <xsl:apply-templates mode="STU3" select="*"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message terminate="yes">
          <xsl:value-of select="concat('Do not currently support converting IG for version ', $version)"/>
        </xsl:message>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template mode="STU3" match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates mode="STU3" select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template mode="STU3" match="f:title"/>
  <xsl:template mode="STU3" match="f:url/@value">
    <xsl:attribute name="value">
      <xsl:value-of select="concat(substring-before(., 'ImplementationGuide'), 'STU3/ImplementationGuide/', ancestor::f:ImplementationGuide/f:id/@value)"/>
    </xsl:attribute>
  </xsl:template>
  <xsl:template mode="STU3" match="f:fhirVersion/@value">
    <xsl:attribute name="value">
      <xsl:value-of select="$altVNumber"/>
    </xsl:attribute>
  </xsl:template>
  <xsl:template match="@xsi:schemaLocation|f:extension[@url='http://hl7.org/fhir/tools-profile-spreadsheet' or @url='http://hl7.org/fhir/StructureDefinition/tools-alternateVersion']|f:resource[f:extension[@url='http://hl7.org/fhir/StructureDefinition/implementationguide-spreadsheet-profile' and f:valueBoolean/@value=true()]]"/>
  <xsl:template mode="STU3" match="@xsi:schemaLocation|f:extension[@url='http://hl7.org/fhir/tools-profile-spreadsheet' or @url='http://hl7.org/fhir/StructureDefinition/tools-alternateVersion']|f:resource[f:extension[@url='http://hl7.org/fhir/StructureDefinition/implementationguide-spreadsheet-profile' and f:valueBoolean/@value=true()]]"/>
  <xsl:template match="f:dependsOn">
    <xsl:if test="not(f:extension[@url='http://hl7.org/fhir/StructureDefinition/tools-alternateVersion' and not(f:valueCode/@value=$version)])">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
    </xsl:if>
  </xsl:template>
  <xsl:template mode="STU3" match="f:dependsOn">
    <xsl:if test="not(f:extension[@url='http://hl7.org/fhir/StructureDefinition/tools-alternateVersion' and not(f:valueCode/@value=$version)])">
      <dependency xmlns="http://hl7.org/fhir">
        <xsl:apply-templates mode="STU3" select="@*|f:extension"/>
        <type value="reference"/>
        <xsl:apply-templates mode="STU3" select="f:uri"/>
      </dependency>
    </xsl:if>
  </xsl:template>
  <xsl:template mode="STU3" match="f:definition">
    <xsl:apply-templates mode="STU3" select="f:package|f:grouping|descendant::f:page[f:nameUrl/@value='STU3/artifacts.html'][1]"/>
  </xsl:template>
  <xsl:template match="f:resource">
    <xsl:if test="not(f:extension[@url='http://hl7.org/fhir/StructureDefinition/implementationguide-spreadsheet-profile' and f:valueBoolean/@value=true()])">
      <xsl:if test="not(f:extension[@url='http://hl7.org/fhir/StructureDefinition/tools-alternateVersion'] or $version) or f:extension[@url='http://hl7.org/fhir/StructureDefinition/tools-alternateVersion']/f:valueCode/@value=$version">
        <xsl:copy>
          <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
      </xsl:if>
    </xsl:if>
  </xsl:template>
  <xsl:template mode="STU3" match="f:package">
    <xsl:variable name="relevant">
      <xsl:for-each select="parent::*/f:resource[not(f:extension[@url='http://hl7.org/fhir/StructureDefinition/implementationguide-spreadsheet-profile' and f:valueBoolean/@value=true()]) and f:extension[@url='http://hl7.org/fhir/StructureDefinition/tools-alternateVersion']/f:valueCode/@value=$version and f:package/@value=current()/@id]">content</xsl:for-each>
    </xsl:variable>
    <xsl:if test="not($relevant='')">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
        <xsl:for-each select="parent::*/f:resource[not(f:extension[@url='http://hl7.org/fhir/StructureDefinition/implementationguide-spreadsheet-profile' and f:valueBoolean/@value=true()]) and f:extension[@url='http://hl7.org/fhir/StructureDefinition/tools-alternateVersion']/f:valueCode/@value=$version and f:package/@value=current()/@id]">
          <xsl:copy>
            <xsl:apply-templates mode="STU3" select="@*|f:extension"/>
            <xsl:if test="f:exampleBoolean/@value='true' or f:exampleCanonical">
              <example xmlns="http://hl7.org/fhir" value="true"/>
            </xsl:if>
            <xsl:apply-templates mode="STU3" select="f:name|f:description"/>
            <xsl:for-each select="f:reference">
              <sourceReference xmlns="http://hl7.org/fhir">
                <xsl:apply-templates mode="STU3" select="@*|node()"/>
              </sourceReference>
            </xsl:for-each>
          </xsl:copy>
        </xsl:for-each>
      </xsl:copy>
    </xsl:if>
  </xsl:template>
  <xsl:template match="f:page">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="f:page">
    <xsl:if test="not(*[self::f:source or self::f:nameUrl][contains(@value, '/artifacts.html')])">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
        <xsl:if test="*[self::f:source or self::f:nameUrl]/@value='artifacts.html'">
          <xsl:call-template name="doPageResources">
            <xsl:with-param name="ver" select="$version"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:copy>
    </xsl:if>
  </xsl:template>
  <xsl:template mode="STU3" match="f:page">
    <xsl:copy>
      <xsl:apply-templates mode="STU3" select="@*|f:extension"/>
      <xsl:for-each select="f:nameUrl">
        <source xmlns="http://hl7.org/fhir">
          <xsl:choose>
            <xsl:when test="@value='STU3/artifacts.html'">
              <xsl:attribute name="value">artifacts.html</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates select="@*|node()"/>
            </xsl:otherwise>
          </xsl:choose>
        </source>
      </xsl:for-each>
      <xsl:apply-templates select="f:title"/>
      <kind xmlns="http://hl7.org/fhir" value="page"/>
      <xsl:choose>
        <xsl:when test="f:generation/@value='html'">
          <format xmlns="http://hl7.org/fhir" value="text/html"/>
        </xsl:when>
        <xsl:when test="f:generation/@value='markdown'">
          <format xmlns="http://hl7.org/fhir" value="text/markdown"/>
        </xsl:when>
      </xsl:choose>
      <xsl:if test="f:nameUrl/@value='STU3/artifacts.html'">
        <xsl:call-template name="doPageResources">
          <xsl:with-param name="ver" select="$version"/>
        </xsl:call-template>
      </xsl:if>
    </xsl:copy>
  </xsl:template>
  <xsl:template name="doPageResources">
    <xsl:param name="ver"/>
    <xsl:variable name="name">
      <xsl:choose>
        <xsl:when test="f:name">name</xsl:when>
        <xsl:otherwise>title</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:for-each select="ancestor::f:ImplementationGuide/f:package/f:resource|ancestor::f:ImplementationGuide/f:definition/f:resource">
      <xsl:if test="(not(f:extension[@url='http://hl7.org/fhir/StructureDefinition/tools-alternateVersion']) and $ver='') or f:extension[@url='http://hl7.org/fhir/StructureDefinition/tools-alternateVersion']/f:valueCode/@value=$ver">
        <page>
          <xsl:variable name="type" select="substring-before(*[self::f:sourceReference or self::f:reference]/f:reference/@value, '/')"/>
          <xsl:variable name="id" select="substring-after(*[self::f:sourceReference or self::f:reference]/f:reference/@value, '/')"/>
          <xsl:variable name="value">
            <xsl:choose>
              <xsl:when test="starts-with($id, 'ext-') or contains(f:package/@value, 'xtension') or contains(f:groupingId/@value, 'xtension')">
                <xsl:value-of select="concat('extension-', $id, '.html')"/>
              </xsl:when>
              <xsl:when test="$type='ValueSet' and not(f:example/@value='true' or f:exampleBoolean/@value='true' or f:exampleReference or f:exampleCanonical or f:purpose/@value='example')">
                <xsl:value-of select="concat('valueset-', $id, '.html')"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="concat($id, '.html')"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="f:source or $version">
              <source xmlns="http://hl7.org/fhir" value="{$value}"/>
            </xsl:when>
            <xsl:otherwise>
              <nameUrl xmlns="http://hl7.org/fhir" value="{$value}"/>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:element name="{$name}" namespace="http://hl7.org/fhir">
            <xsl:attribute name="value">
              <xsl:value-of select="f:name/@value"/>
            </xsl:attribute>
          </xsl:element>
          <xsl:if test="@kind or $version">
            <xsl:choose>
              <xsl:when test="$type='Conformance' or $type='CapabilityStatement' or $type='SearchParameter' or contains($id, 'example')">
                <kind xmlns="http://hl7.org/fhir" value="example"/>
              </xsl:when>
              <xsl:otherwise>
                <kind xmlns="http://hl7.org/fhir" value="resource"/>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
              <xsl:when test="$type='Conformance' or $type='SearchParameter'">
                <format xmlns="http://hl7.org/fhir" value="generated-resource"/>
              </xsl:when>
              <xsl:otherwise>
                <format xmlns="http://hl7.org/fhir" value="generated"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
          <xsl:if test="not(@kind or $version)">
            <generation xmlns="http://hl7.org/fhir" value="generated"/>
<!--              <extension url="http://hl7.org/fhir/StructureDefinition/implementationguide-page-generated">
              <valueBoolean value="true"/>
            </extension>-->
          </xsl:if>
        </page>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>