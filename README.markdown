# Front-end Admin bar

---------------------------------------

This is a XSLT utility for Symphony CMS that adds a simple admin bar in the top of the site when logged in as a developer/author, displaying options like 'Logout' or 'Back to admin'.

---------------------------------------

## Info
- Version:	0.3
- Date:		24-11-2010
- Author:	João Barbosa
- E-mail:	<joao.ofb@gmail.com>
- Website:	<http://www.joaootavio.com.br>

---------------------------------------

## Sample CSS Code

<https://gist.github.com/714098>

---------------------------------------

## Usage

Add the <code>admin-bar.xsl</code> file to your <code>/workspace/utilities</code> folder.

On your <code>master.xsl</code> (or an specific page you want to use it), import the XSL file...

<code><xsl:import href="../utilities/admin-bar.xsl"/></code>

... and call the template right after your <code>body</code> tag:

	<xsl:call-template name="front-admin-bar">
		<xsl:with-param name="dev-username" select="'developer-username'" />
		<xsl:with-param name="logged-label" select="'Logged in as: '" />
		<xsl:with-param name="admin-link-label" select="'Back to admin'" />
		<xsl:with-param name="logout-link-label" select="'Logout'" />
		<xsl:with-param name="debug-link" select="'Debug this page'" />
	</xsl:call-template>

---------------------------------------

## Required Parameters

- **dev-username**: developer's username  
*Required for identifying which sidebar options that will be displayed*

---------------------------------------

## Optional Parameters

- **logged-label**: text that precedes username link  
*Default Value: 'Logged in as: '*
- **admin-link**: text for the administration link  
*Default Value: 'Back to admin'*
- **logout-link**: text for the logout link  
*Default Value: 'Logout'*
- **debug-link**: text for the actual page debug link  
*Default Value: 'Debug this page'*

---------------------------------------

## Changelog

### 0.3
- Developers and authors has different sidebars

### 0.2
- Blank page when logged out bug fixed
- Debug link added

### 0.1
- First Release