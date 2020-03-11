<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="html" encoding="iso-8859-1"/>

  <xsl:template match="primerDia1DAW">
    <html>
      <head>
        <title>Primer día de clase</title>
      </head>
      <body>
        <table>
          
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="horario/dia">
    <tr>
      <td></td>
      <xsl:apply-templates select="hora"/>
    </tr>
  </xsl:template>

  <xsl:template match="hora">
    <td>
      <xsl:value-of select="."/>
    </td>
  </xsl:template>
</xsl:stylesheet>