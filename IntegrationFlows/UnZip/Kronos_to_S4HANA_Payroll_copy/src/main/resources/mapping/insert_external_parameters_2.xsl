<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns2="urn:sap-com:document:sap:idoc:soap:messages">
	<xsl:output omit-xml-declaration="yes" indent="yes" />
	<xsl:strip-space elements="*" />



	
	<xsl:param name="Client_Number_of_Receiver" />
	<xsl:param name="Port_Number_of_Receiver" />
	<xsl:param name="Partner_Number_of_Sender" />
	<xsl:param name="Partner_Type_of_Sender" />
	<xsl:param name="Port_Number_of_Sender" />
	<xsl:param name="Partner_Type_of_Receiver" />
	<xsl:param name="Partner_Number_of_Receiver" />
	

	<xsl:template match="node()|@*">

		<xsl:copy>
			<xsl:apply-templates select="node()|@*" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="ns2:MANDT">
	<ns2:MANDT>		<xsl:value-of select="$Client_Number_of_Receiver" /></ns2:MANDT>
	</xsl:template>
	
	<xsl:template match="ns2:SNDPOR">
	<ns2:SNDPOR>		<xsl:value-of select="$Port_Number_of_Sender" /></ns2:SNDPOR>
	</xsl:template>
	
	<xsl:template match="ns2:SNDPRT">
	<ns2:SNDPRT>		<xsl:value-of select="$Partner_Type_of_Sender" /></ns2:SNDPRT>
	</xsl:template>
	
	<xsl:template match="ns2:SNDPRN">
	<ns2:SNDPRN>		<xsl:value-of select="$Partner_Number_of_Sender" /></ns2:SNDPRN>
	</xsl:template>
	
	<xsl:template match="ns2:RCVPOR">
	<ns2:RCVPOR>		<xsl:value-of select="$Port_Number_of_Receiver" /></ns2:RCVPOR>
	</xsl:template>
	
	<xsl:template match="ns2:RCVPRT">
	<ns2:RCVPRT>		<xsl:value-of select="$Partner_Type_of_Receiver" /></ns2:RCVPRT>
	</xsl:template>
	
	<xsl:template match="ns2:RCVPRN">
	<ns2:RCVPRN>		<xsl:value-of select="$Partner_Number_of_Receiver" /></ns2:RCVPRN>
	</xsl:template>
	
	
</xsl:stylesheet>