<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8"/>

  <xsl:template match="/juegoTanques">
    <html>
      <head>
        <title>Juego de tanques</title>
        <xsl:call-template name="css"/>
      </head>
      <body>
        <table>
          <thead>
            <td>Jugada</td>
            <td>Tanque</td>
            <td>Imagen</td>
            <td>Jugada</td>
          </thead>
          <xsl:apply-templates select="jugadasDescritas"/>
        </table>
      </body>
    </html>

  </xsl:template>

  <xsl:template match="jugadasDescritas">
    <xsl:for-each select="jugada">
      <xsl:choose>
        <xsl:when test="position() mod 2 = 1">
          <xsl:call-template name="fila">
            <xsl:with-param name="color">#2dad4f</xsl:with-param>
            <xsl:with-param name="numJugador"><xsl:value-of select="@jugador"/></xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="fila">
            <xsl:with-param name="color">#ffffff</xsl:with-param>
            <xsl:with-param name="numJugador"><xsl:value-of select="@jugador"/></xsl:with-param>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
     </xsl:template>

  <xsl:template name="fila">
    <xsl:param name="color"/>
    <xsl:param name="numJugador"/>

    <tr style="background: {$color}">
      <td>
        <xsl:value-of select="position()"/>
      </td>
      <td>
        <xsl:value-of select="@jugador"/>
      </td>
      <td>
        <img src="{/juegoTanques/tanques/imagenTanque[@jugador=$numJugador]}"/>
      </td>
      <td>
        <xsl:value-of select="@desc"/>
      </td>
    </tr>

  </xsl:template>

  <xsl:template name="css">
    <style>
      table{
      border-collapse: collapse;
      }
      table, tr, td{
      border: 1px solid blue;
      }
      thead {
      background: #2d7cad;
      }
      img{
      width: 80px;
      }
    </style>
  </xsl:template>
</xsl:stylesheet>