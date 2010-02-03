<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>

	<xsl:template match="resume">
		<xsl:text>
			\documentclass{article}

			\usepackage[utf8]{inputenc}
			\usepackage[russian,english]{babel}
			\usepackage[T2A]{fontenc}

			\begin{document}
		</xsl:text>

		<xsl:apply-templates select="header"/>
		<xsl:apply-templates select="history"/>
		<xsl:apply-templates select="academics"/>

		<xsl:text>
			\end{document}
		</xsl:text>
	</xsl:template>

	<!-- BEGIN: Header -->

	<xsl:template match="header">
		<xsl:apply-templates select="name"/>
		<xsl:text>
		</xsl:text>

		<xsl:apply-templates select="address"/>
		<xsl:text>
		</xsl:text>
	</xsl:template>

	<xsl:template match="name">
		<xsl:value-of select="firstname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="surname"/>
	</xsl:template>

	<xsl:template match="address">
		<!-- TODO -->
	</xsl:template>

	<!-- END: Header -->

	<!-- BEGIN: History -->

	<xsl:template match="history">
		<xsl:apply-templates select="job"/>
		<xsl:text>

		</xsl:text>
	</xsl:template>

	<xsl:template match="job">
		<xsl:text>Должность: </xsl:text>
		<xsl:value-of select="jobtitle"/>
		<xsl:text>

		</xsl:text>

		<xsl:text>Компания: </xsl:text>
		<xsl:value-of select="employer"/>
		<xsl:text>

		</xsl:text>

		<xsl:apply-templates select="period"/>
		<xsl:text>

		</xsl:text>

		<xsl:apply-templates select="description"/>
	</xsl:template>

	<xsl:template match="period">
		<xsl:apply-templates select="from"/>
		<xsl:text> --- </xsl:text>
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
		<xsl:value-of select="month"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="year"/>
	</xsl:template>

	<xsl:template match="present">
		<xsl:text>сейчас</xsl:text>
	</xsl:template>

	<xsl:template match="description">
		<xsl:apply-templates select="para"/>
	</xsl:template>

	<xsl:template match="para">
		<xsl:value-of select="."/>
		<xsl:text>

		</xsl:text>
	</xsl:template>

	<!-- END: History -->

	<!-- BEGIN: Academics -->

	<xsl:template match="academics">
		<xsl:apply-templates select="degrees"/>
	</xsl:template>

	<xsl:template match="degrees">
		<xsl:apply-templates select="degree"/>
		<xsl:text>

		</xsl:text>
	</xsl:template>

	<xsl:template match="degree">
		<xsl:value-of select="institution"/>
		<xsl:text>

		</xsl:text>

		<xsl:apply-templates select="period"/>
		<xsl:text>

		</xsl:text>

		<xsl:apply-templates select="description"/>
	</xsl:template>

	<!-- END: Academics -->
</xsl:stylesheet>
