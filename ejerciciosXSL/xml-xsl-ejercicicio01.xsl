<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>

  <xsl:template match="/superheroe">
    <html>
      <head>
        <title>Superheroes de Marvel</title>
      </head>
      <body>
        <h1>
          <xsl:value-of select="nombre"/>
        </h1>
      </body>
    </html>
  </xsl:template>
<!--
  <xsl:template name="nombre">
    <h1>Superheroe: 
      <xsl:value-of select="."/>
    </h1>
  </xsl:template>
--> 

</xsl:stylesheet>
