<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--
	Front-end Admin bar
	-----------------------------------------------------
	Info
		Version:	0.1
		Date:		24-119-2010
		Author:		João Barbosa
		E-mail:		joao.ofb@gmail.com
		Website:	www.joaootavio.com.br
	-----------------------------------------------------
	Parameters
		logged-label: text that precedes username link
		admin-link: text for the administration link
		logout-link: text for the logout link
	-----------------------------------------------------
	Usage
		<xsl:call-template name="front-admin-bar">
			<xsl:with-param name="logged-label" select="Logged in as: " />
			<xsl:with-param name="logged-label" select="Back to admin" />
			<xsl:with-param name="logged-label" select="Logout" />
		</xsl:call-template>
	-----------------------------------------------------
-->

	<xsl:template name="front-admin-bar">

		<xsl:param name="logged-label" select="Logged-in as: " />
		<xsl:param name="admin-link" select="Back to admin" />
		<xsl:param name="logout-link" select="Logout" />

		<xsl:if test="string-length($cookie-username) > 0">
			<div class="adminBar">
				<h1><a href="{$root}"><xsl:value-of select="$website-name" /></a></h1>
				<h2>
					<xsl:value-of select="$logged-label">
					<a href="{$root}/symphony/system/authors/">
						<xsl:value-of select="$cookie-username" />
					</a>
					<xsl:text>&#160;|&#160;</xsl:text>
					<a href="{$root}/symphony">
						<xsl:value-of select="$admin-link" />
					</a>
					<xsl:text>&#160;|&#160;</xsl:text>
					<a href="{$root}/symphony/logout">
						<xsl:value-of select="$logout-link" />
					</a>
				</h2>
			</div>	
		</xsl:if>

	</xsl:template>

</xsl:stylesheet>