<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="utf-8" />

  <xsl:param name="delim" select="','" />
  <xsl:param name="quote" select="'&quot;'" />
  <xsl:param name="break" select="'&#xA;'" />

  <xsl:template match="/">
    <xsl:text>ITEMID,COLOR,CATEGORY,ITEMTYPE,QTY,PRICE,CONDITION</xsl:text>
    <xsl:value-of select="$break" />
    <xsl:apply-templates select="INVENTORY/ITEM" />
  </xsl:template>

  <xsl:template match="ITEM">
    <xsl:apply-templates />
    <xsl:if test="following-sibling::*">
      <xsl:value-of select="$break" />
    </xsl:if>
  </xsl:template>

  <xsl:template match="ITEMID">
    <xsl:value-of select="concat($quote, normalize-space(), $quote)" />
    <xsl:if test="following-sibling::*">
      <xsl:value-of select="$delim" />
    </xsl:if>
  </xsl:template>

  <xsl:template match="ITEMTYPE">
    <xsl:value-of select="concat($quote, normalize-space(), $quote)" />
    <xsl:if test="following-sibling::*">
      <xsl:value-of select="$delim" />
    </xsl:if>
  </xsl:template>

  <xsl:template match="CONDITION">
    <xsl:value-of select="concat($quote, normalize-space(), $quote)" />
    <xsl:if test="following-sibling::*">
      <xsl:value-of select="$delim" />
    </xsl:if>
  </xsl:template>

  <xsl:template match="*">
    <xsl:variable name="value" select="normalize-space()" />

    <!-- Quote the value if required -->
    <xsl:choose>
        <xsl:when test="contains($value, '&quot;')">
            <xsl:variable name="x" select="replace($value, '&quot;',  '&quot;&quot;')"/>
            <xsl:value-of select="concat('&quot;', $x, '&quot;')"/>
        </xsl:when>
        <xsl:when test="contains($value, $delim)">
            <xsl:value-of select="concat('&quot;', $value, '&quot;')"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$value"/>
        </xsl:otherwise>
    </xsl:choose>

    <xsl:if test="following-sibling::*">
      <xsl:value-of select="$delim" />
    </xsl:if>
  </xsl:template>


  <xsl:template match="text()" />
</xsl:stylesheet>
