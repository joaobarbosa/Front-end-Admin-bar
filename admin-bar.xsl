<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--
	Front-end Admin bar

	Info
		Version:	0.3
		Date:		24-11-2010
		Author:		João Barbosa
		E-mail:		joao.ofb@gmail.com
		Website:	www.joaootavio.com.br

	Parameters
		dev-username: developer's username
		logged-label: text that precedes username link
		admin-link: text for the administration link
		logout-link: text for the logout link

	Usage
		<xsl:call-template name="front-admin-bar">
			<xsl:with-param name="dev-username" select="'developer-username'" />
			<xsl:with-param name="logged-label" select="'Logged in as: '" />
			<xsl:with-param name="logged-label" select="'Back to admin'" />
			<xsl:with-param name="logged-label" select="'Logout'" />
		</xsl:call-template>
-->

	<xsl:param name="cookie-username" />
	
	<xsl:template name="front-admin-bar">
	
		<!-- Developer Username -->
		<xsl:param name="dev-username" />
		<!-- Link labels -->
		<xsl:param name="logged-label" select="'Logged-in as: '" />
		<xsl:param name="admin-link-label" select="'Back to admin'" />
		<xsl:param name="logout-link-label" select="'Logout'" />
		<xsl:param name="debug-link-label" select="'Debug this page'" />
	
		<xsl:if test="string-length($cookie-username) > 0">
			<div class="adminBar">
				<h1><a href="{$root}"><xsl:value-of select="$website-name" /></a></h1>
				<span>
					<!-- Logged in info -->
					<xsl:value-of select="$logged-label" />
					<a href="{$root}/symphony/system/authors">
						<xsl:value-of select="$cookie-username" />
					</a>
					<xsl:choose>
						<xsl:when test="$cookie-username = $dev-username">
							<!-- Developer Front-end Admin Bar -->
							<xsl:call-template name="debug-link">
								<xsl:with-param name="label" select="$debug-link-label" />
							</xsl:call-template>
							<xsl:call-template name="admin-link">
								<xsl:with-param name="label" select="$admin-link-label" />
							</xsl:call-template>
							<xsl:call-template name="logout-link">
								<xsl:with-param name="label" select="$logout-link-label" />
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<!-- Author Front-end Admin Bar -->
							<xsl:call-template name="admin-link">
								<xsl:with-param name="label" select="$admin-link-label" />
							</xsl:call-template>
							<xsl:call-template name="logout-link">
								<xsl:with-param name="label" select="$logout-link-label" />
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</span>
			</div>	
		</xsl:if>
	
	</xsl:template>
	
	<xsl:template name="debug-link">
		<xsl:param name="label" />
		<xsl:text>&#160;|&#160;</xsl:text>
		<a href="{$current-url}?debug"><xsl:value-of select="$label" /></a>
	</xsl:template>

	<xsl:template name="admin-link">
		<xsl:param name="label" />
		<xsl:text>&#160;|&#160;</xsl:text>
		<a href="{$root}/symphony"><xsl:value-of select="$label" /></a>
	</xsl:template>

	<xsl:template name="logout-link">
		<xsl:param name="label" />
		<xsl:text>&#160;|&#160;</xsl:text>
		<a href="{$root}/symphony/logout"><xsl:value-of select="$label" /></a>
	</xsl:template>

</xsl:stylesheet>