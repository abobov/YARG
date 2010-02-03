<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE resume [

<!ENTITY Experience "Experience">
<!ENTITY Cell "Cell">
<!ENTITY Email "Email">
<!ENTITY Education "Education">
<!ENTITY Skills "Skills">

<!ENTITY Today "today">

<!ENTITY header1Marker "==">
<!ENTITY header2Marker "===">
<!ENTITY header3Marker "====">
<!ENTITY boldStart "{\b ">
<!ENTITY boldEnd "}">
<!ENTITY emStart "{\i">
<!ENTITY emEnd "}">
<!ENTITY listMarker "o">
<!ENTITY nl "\line ">
]>
<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>

	<xsl:template match="resume">
		<xsl:text>{\rtf\ansi{
			{\stylesheet{\fs24
				{\s1 \i\fs32 HEADER1}
			}}</xsl:text>

		<xsl:apply-templates select="header"/>
		<xsl:apply-templates select="academics"/>
		<xsl:apply-templates select="skills"/>
		<xsl:apply-templates select="history"/>
		<xsl:apply-templates select="stuffs"/>
		<xsl:text>}}</xsl:text>
	</xsl:template>

	<!-- {{{BEGIN: Header -->

	<xsl:template match="header">
		<xsl:call-template name="header-1">
			<xsl:with-param name="title">
				<xsl:apply-templates select="name"/>
			</xsl:with-param>
		</xsl:call-template>

		<xsl:apply-templates select="cell"/>
		<xsl:text>&nl;</xsl:text>
		<xsl:apply-templates select="email"/>
		<xsl:text>&nl;</xsl:text>
		<xsl:apply-templates select="address"/>
		<xsl:text>\para </xsl:text>
	</xsl:template>

	<xsl:template match="name">
		<xsl:value-of select="firstname"/>
		<xsl:if test="firstname and surname">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:value-of select="surname"/>
	</xsl:template>

	<xsl:template match="address">
	</xsl:template>

	<xsl:template match="cell">
		<xsl:text>&Cell;: </xsl:text>
		<xsl:value-of select="."/>
	</xsl:template>

	<xsl:template match="email">
		<xsl:text>&Email;: </xsl:text>
		<xsl:value-of select="."/>
	</xsl:template>

	<xsl:template match="objective">
		<xsl:apply-templates/>
	</xsl:template>

	<!-- END: Header}}} -->

	<!-- {{{BEGIN: Academics -->

	<xsl:template match="academics">
		<xsl:call-template name="header-2">
			<xsl:with-param name="title">
				<xsl:text>&Education;</xsl:text>
			</xsl:with-param>
		</xsl:call-template>

		<xsl:apply-templates select="degrees"/>
	</xsl:template>

	<xsl:template match="degrees">
		<xsl:apply-templates select="degree"/>
		<xsl:text>\par</xsl:text>
	</xsl:template>

	<xsl:template match="degree">
		<xsl:call-template name="header-3">
			<xsl:with-param name="title">
				<xsl:value-of select="institution"/>
				<xsl:if test="institution and period">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:apply-templates select="period"/>
			</xsl:with-param>
		</xsl:call-template>

		<xsl:apply-templates select="description"/>
	</xsl:template>

	<!-- END: Academics}}} -->

	<!-- {{{BEGIN: Skills -->

	<xsl:template match="skills">
		<xsl:call-template name="header-2">
			<xsl:with-param name="title">
				<xsl:text>&Skills;</xsl:text>
			</xsl:with-param>
		</xsl:call-template>

		<xsl:apply-templates select="skill"/>
	</xsl:template>

	<xsl:template match="skill">
		<xsl:call-template name="header-3">
			<xsl:with-param name="title" select="title"/>
		</xsl:call-template>

		<xsl:apply-templates select="description"/>
	</xsl:template>

	<!-- END: Skills}}} -->

	<!-- {{{BEGIN: History -->

	<xsl:template match="history">
		<xsl:call-template name="header-2">
			<xsl:with-param name="title">
				<xsl:text>&Experience;</xsl:text>
			</xsl:with-param>
		</xsl:call-template>

		<xsl:apply-templates select="job"/>
	</xsl:template>

	<xsl:template match="job">
		<xsl:call-template name="header-3">
			<xsl:with-param name="title" select="employer"/>
		</xsl:call-template>

		<xsl:value-of select="jobtitle"/>
		<xsl:text>, </xsl:text>
		
		<xsl:apply-templates select="period"/>
		<xsl:text>\par</xsl:text>

		<xsl:apply-templates select="description"/>
	</xsl:template>

	<!-- END: History}}} -->

	<!-- {{{BEGIN: Stuffs -->

	<xsl:template match="stuffs">
		<xsl:apply-templates select="stuff"/>
	</xsl:template>

	<xsl:template match="stuff">
		<xsl:call-template name="header-2">
			<xsl:with-param name="title" select="title"/>
		</xsl:call-template>

		<xsl:apply-templates select="description"/>
	</xsl:template>

	<!-- END: Stuffs}}} -->

	<xsl:template match="description">
		<xsl:apply-templates select="para"/>
		<xsl:apply-templates select="ul"/>
		<xsl:apply-templates select="ol"/>
	</xsl:template>

	<xsl:template match="para">
		<xsl:apply-templates/>
		<xsl:text>\par </xsl:text>
	</xsl:template>

	<xsl:template match="strong">
		<xsl:text>&boldStart;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text>&boldEnd;</xsl:text>
	</xsl:template>

	<xsl:template match="em">
		<xsl:text>&emStart;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text>&emEnd;</xsl:text>
	</xsl:template>

	<xsl:template match="ol">
		<xsl:apply-templates select="item"/>
		<xsl:text>&nl;</xsl:text>
	</xsl:template>

	<xsl:template match="ul">
		<xsl:apply-templates select="item"/>
		<xsl:text>&nl;</xsl:text>
	</xsl:template>

	<xsl:template match="item">
		<xsl:text>&listMarker; </xsl:text>
		<xsl:apply-templates/>
		<xsl:text>&nl;</xsl:text>
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

	<!-- {{{BEGIN: Header 1-3 -->

	<xsl:template name="header">
		<xsl:param name="style"/>
		<xsl:param name="title"/>

		<xsl:text>{</xsl:text>
		<xsl:value-of select="$style"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="$title"/>
		<xsl:text>\par}</xsl:text>
	</xsl:template>

	<xsl:template name="header-1">
		<xsl:param name="title"/>

		<xsl:call-template name="header">
			<xsl:with-param name="style">
				<xsl:text>\s1</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="title" select="$title"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="header-2">
		<xsl:param name="title"/>

		<xsl:call-template name="header">
			<xsl:with-param name="style">
				<xsl:text>\s2</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="title" select="$title"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="header-3">
		<xsl:param name="title"/>

		<xsl:call-template name="header">
			<xsl:with-param name="style">
				<xsl:text>\s3</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="title" select="$title"/>
		</xsl:call-template>
	</xsl:template>

	<!-- END: Header 1-3}}} -->

</xsl:stylesheet>
<!-- vim: foldmethod=marker 
-->
