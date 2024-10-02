<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="yes" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="CURRENCY" />
	<xsl:param name="Partner_External_Application_ID" />
	<xsl:param name="External_System" />

	<xsl:template match="node()|@*">

		<xsl:copy>
			<xsl:apply-templates select="node()|@*" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="Financial_Company_Code">
		<xsl:copy>
		<xsl:apply-templates select="node()|@*" />
		</xsl:copy>
		<xsl:choose>
			<xsl:when test="$CURRENCY=''">
				<CURRENCY>
					<xsl:value-of select="'USD'" />
				</CURRENCY>
			</xsl:when>
			<xsl:otherwise>
				<CURRENCY>
					<xsl:value-of select="$CURRENCY" />
				</CURRENCY>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="$Partner_External_Application_ID!=''">
			<Partner_External_Application_ID>
				<xsl:value-of select="$Partner_External_Application_ID" />
			</Partner_External_Application_ID>
		</xsl:if>
		<xsl:if test="$External_System!=''">
			<External_System>
				<xsl:value-of select="$External_System" />
			</External_System>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>