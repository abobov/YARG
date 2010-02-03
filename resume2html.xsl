<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE resume [

<!ENTITY Experience "Experience">
<!ENTITY Cell "Cell">
<!ENTITY Email "Email">
<!ENTITY Education "Education">
<!ENTITY Skills "Skills">

<!ENTITY Today "today">
]>
<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"/>

	<xsl:template match="resume">
		<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
			<title>
                <xsl:text>Resume: </xsl:text>
                <xsl:value-of select="header/name/firstname"/>
                <xsl:if test="header/name/firstname and header/name/surname"><xsl:text> </xsl:text></xsl:if>
                <xsl:value-of select="header/name/surname"/>
            </title>
			<style type="text/css">
			<xsl:text>
				* { margin: 0; padding: 0; }
				body { font: 16px Helvetica, Sans-Serif; line-height: 24px; background: url(images/noise.jpg); }
				.clear { clear: both; }
				#page-wrap { width: 800px; margin: 40px auto 60px; }
				#pic { float: right; margin: -30px 0 0 0; }
				h1 { margin: 0 0 16px 0; padding: 0 0 16px 0; font-size: 42px; font-weight: bold; letter-spacing: -2px; border-bottom: 1px solid #999; }
				h2 { font-size: 20px; margin: 0 0 6px 0; position: relative; }
				h2 span { position: absolute; bottom: 0; right: 0; font-style: italic; font-family: Georgia, Serif; font-size: 16px; color: #999; font-weight: normal; }
				p { margin: 0 0 16px 0; }
				a { color: #999; text-decoration: none; border-bottom: 1px dotted #999; }
				a:hover { border-bottom-style: solid; color: black; }
				ul { margin: 0 0 32px 17px; }
				#objective { width: 500px; float: left; }
				#objective p { font-family: Georgia, Serif; font-style: italic; color: #666; }
				dt { font-style: italic; font-weight: bold; font-size: 18px; text-align: right; padding: 0 26px 0 0; width: 150px; float: left; height: 100px; border-right: 1px solid #999; }
				dd { width: 600px; float: right; }
				dd.clear { float: none; margin: 0; height: 15px; }
			</xsl:text>
			</style>
		</head>
		<body>
			<div id="page-wrap">
				<xsl:apply-templates select="header"/>
				<dl>
					<dd class="clear"></dd>
					<xsl:apply-templates select="academics"/>
					<xsl:apply-templates select="skills"/>
					<xsl:apply-templates select="history"/>
					<xsl:apply-templates select="stuffs"/>
				</dl>
			</div>
		</body>
		</html>
	</xsl:template>

	<!-- {{{BEGIN: Header -->

	<xsl:template match="header">
		<div id="contact-info" class="vcard">
			<xsl:apply-templates select="name"/>
			<xsl:apply-templates select="address"/>
			<p>
				<xsl:apply-templates select="cell"/>
				<xsl:if test="cell and email">
					<br/>
				</xsl:if>
				<xsl:apply-templates select="email"/>
			</p>
		</div>
		<div id="objective">
			<xsl:apply-templates select="objective"/>
		</div>
		<div class="clear"></div>
	</xsl:template>

	<xsl:template match="name">
		<h1 class="fn">
			<xsl:value-of select="firstname"/>
			<xsl:if test="firstname and surname">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:value-of select="surname"/>
		</h1>
	</xsl:template>

	<xsl:template match="address">
	</xsl:template>

	<xsl:template match="cell">
		<xsl:text>&Cell;: </xsl:text>
		<span class="tel"><xsl:value-of select="."/></span>
	</xsl:template>

	<xsl:template match="email">
		<xsl:text>&Email;: </xsl:text>
		<a class="email"><xsl:value-of select="."/></a>
	</xsl:template>

	<xsl:template match="objective">
		<xsl:apply-templates/>
	</xsl:template>

	<!-- END: Header}}} -->

	<!-- {{{BEGIN: Academics -->

	<xsl:template match="academics">
		<dt>&Education;</dt>
		<dd>
			<xsl:apply-templates select="degrees"/>
		</dd>
		<dd class="clear"></dd>
	</xsl:template>

	<xsl:template match="degrees">
		<xsl:apply-templates select="degree"/>
	</xsl:template>

	<xsl:template match="degree">
		<h2>
			<xsl:value-of select="institution"/>
		</h2>

		<p>
			<xsl:apply-templates select="period"/>
		</p>

		<div>
			<xsl:apply-templates select="description"/>
		</div>
	</xsl:template>

	<!-- END: Academics}}} -->

	<!-- {{{BEGIN: Skills -->

	<xsl:template match="skills">
		<dt>&Skills;</dt>
		<dd>
			<xsl:apply-templates select="skill"/>
		</dd>
		<dd class="clear"></dd>
	</xsl:template>

	<xsl:template match="skill">
		<h2><xsl:value-of select="title"/></h2>
		<xsl:apply-templates select="description"/>
	</xsl:template>

	<!-- END: Skills}}} -->

	<!-- {{{BEGIN: History -->

	<xsl:template match="history">
		<dt>&Experience;</dt>
		<dd>
			<xsl:apply-templates select="job"/>
		</dd>
		<dd class="clear"></dd>
	</xsl:template>

	<xsl:template match="job">
		<h2>
			<xsl:value-of select="employer"/>
			<span>
				<xsl:value-of select="jobtitle"/>
				<xsl:text> - </xsl:text>
				<xsl:apply-templates select="period"/>
			</span>
		</h2>

		<div>
			<xsl:apply-templates select="description"/>
		</div>
	</xsl:template>

	<!-- END: History}}} -->

	<!-- {{{BEGIN: Stuffs -->

	<xsl:template match="stuffs">
		<xsl:apply-templates select="stuff"/>
	</xsl:template>

	<xsl:template match="stuff">
		<dt><xsl:value-of select="title"/></dt>
		<dd>
			<xsl:apply-templates select="description"/>
		</dd>
		<dd class="clear"></dd>
	</xsl:template>

	<!-- END: Stuffs}}} -->

	<xsl:template match="description">
		<xsl:apply-templates select="para"/>
		<xsl:apply-templates select="ul"/>
		<xsl:apply-templates select="ol"/>
	</xsl:template>

	<xsl:template match="para">
		<p>
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<xsl:template match="strong">
		<strong>
			<xsl:apply-templates/>
		</strong>
	</xsl:template>

	<xsl:template match="em">
		<em>
			<xsl:apply-templates/>
		</em>
	</xsl:template>

	<xsl:template match="ol">
		<ol>
			<xsl:apply-templates select="item"/>
		</ol>
	</xsl:template>

	<xsl:template match="ul">
		<ul>
			<xsl:apply-templates select="item"/>
		</ul>
	</xsl:template>

	<xsl:template match="item">
		<li>
			<xsl:value-of select="."/>
		</li>
	</xsl:template>

	<xsl:template match="period">
		<xsl:apply-templates select="from"/>
		<xsl:if test="from and to">
			<xsl:text>-</xsl:text>
		</xsl:if>
		<xsl:apply-templates select="to"/>
	</xsl:template>

	<xsl:template match="from">
		<xsl:apply-templates select="date"/>
	</xsl:template>

	<xsl:template match="to">
		<xsl:apply-templates select="date"/>
		<xsl:apply-templates select="present"/>
	</xsl:template>

	<xsl:template match="date">
		<xsl:if test="month">
			<xsl:value-of select="month"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:value-of select="year"/>
	</xsl:template>

	<xsl:template match="present">
		<xsl:text>&Today;</xsl:text>
	</xsl:template>
</xsl:stylesheet>
<!-- vim: foldmethod=marker 
-->
