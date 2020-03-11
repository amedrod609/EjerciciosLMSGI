<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>

	<xsl:template match="/navidad">
   		<html>
      		<head>
        		<title>Comida de Navidad</title>
      		</head>
      		<body>
            <xsl:apply-templates select="almuerzo"/>
      		</body>
    	</html>
	</xsl:template>

  <xsl:template match="almuerzo">
    <ul>
      <li>
       Primer plato: <xsl:value-of select="primerPlato"/>
      </li>
      <li>
        Segundo plato:<xsl:value-of select="segundoPlato"/>
      </li>
      <li>
        Postre: <xsl:value-of select="postre"/>
      </li>
      <li>
        Bebida: <xsl:value-of select="bebida"/>
      </li>
      <xsl:apply-templates select="sobremesa"/>
    </ul>
  </xsl:template>

  <xsl:template match="sobremesa">
    <ol>
      <li>
        <xsl:value-of select="primeraCopa"/>
      </li>
      <li>
        <xsl:value-of select="segundaCopa"/>
      </li>
      <li>
        <xsl:value-of select="terceraCopa"/>
      </li>
    </ol>
  </xsl:template>

	
</xsl:stylesheet>
