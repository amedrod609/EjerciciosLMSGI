<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8"/>
  <xsl:template match="/cine">
    <html>
      <head>
        <title> El hombre murciegalo contra el fuerzas</title>
        <xsl:call-template name="css"/>
      </head>
      <body>
        <h1>
          <xsl:value-of select="@nombre"/>
        </h1>
        <img src="{titulo/imagen/.}" width="500px"/>
        <h2>
          <xsl:value-of select="titulo/@nombre"/>
        </h2>
        <h3>
          Estreno:  <xsl:value-of select="/cine/titulo/@estreno"/>
        </h3>
        <table width="80%">
          <xsl:for-each select="sesiones/sesion">
            <tr>
              <td align="center">
                <xsl:call-template name="FondoColor"/>
                <xsl:call-template name="sesionHora"/>
                <table width="50%">
                  <xsl:call-template name="bucleForFila">
                    <xsl:with-param name="i">1</xsl:with-param>
                  </xsl:call-template>
                </table>
              </td>
            </tr>
            <br/>
          </xsl:for-each>
        </table>
        <br/>
        <h2>Otras películas</h2>
        <table>
          <xsl:call-template name="carteleraProxima"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="sesionHora">
    Sesión:
    <xsl:value-of select="position()"/>
    - Hora:
    <xsl:value-of select="@hora"/>
  </xsl:template>

  <xsl:template name="carteleraProxima">

    <xsl:for-each select="cartelera/pelicula">
      <xsl:variable name="peliNombre">
        <xsl:value-of select="@id"/>
      </xsl:variable>
      <tr>
        <td>
          <img src="{/cine/imagenes/imagen[@id = $peliNombre]/.}"/>
        </td>
        <td>
          <xsl:value-of select="@nombre"/>
        </td>
      </tr>
    </xsl:for-each>

  </xsl:template>

  <xsl:template name="FondoColor">
    <xsl:choose>
      <xsl:when test="position() mod 2 = 1">
        <xsl:attribute name="style">background: #5d9ede;</xsl:attribute>
      </xsl:when>
    </xsl:choose>
  </xsl:template>


  <xsl:template name="bucleForFila">
    <xsl:param name="i"/>
    <xsl:if test="$i &lt;= 4">
      <tr>
        <xsl:call-template name="bucleForColumna">
          <xsl:with-param name="i">
            <xsl:value-of select="$i"/>
          </xsl:with-param>
          <xsl:with-param name="j">1</xsl:with-param>
        </xsl:call-template>
      </tr>
      <xsl:call-template name="bucleForFila">
        <xsl:with-param name="i">
          <xsl:value-of select="$i + 1"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>


  <xsl:template name="bucleForColumna">
    <xsl:param name="i"/>
    <xsl:param name="j"/>
    <xsl:if test="$j &lt;= 4">
      <xsl:call-template name="celda">
        <xsl:with-param name="x">
          <xsl:value-of select="$j"/>
        </xsl:with-param>
        <xsl:with-param name="y">
          <xsl:value-of select="$i"/>
        </xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="bucleForColumna">
        <xsl:with-param name="i">
          <xsl:value-of select="$i"/>
        </xsl:with-param>
        <xsl:with-param name="j">
          <xsl:value-of select="$j + 1"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>


  <xsl:template name="celda">
    <xsl:param name="x"/>
    <xsl:param name="y"/>
    <td>
      <xsl:choose>
        <xsl:when test="ocupado[$x = @asiento and $y = @fila]">
          <img src="{/cine/imagenes/imagen[@id = 'ocupado']/.}"/>
        </xsl:when>
        <xsl:otherwise>
          <img src="{/cine/imagenes/imagen[@id = 'libre']/.}"/>
        </xsl:otherwise>
      </xsl:choose>
    </td>
  </xsl:template>

  <xsl:template name="css">
    <style>
      body{
      font-family: 'Open Sans', sans-serif;
      }
      table, tr, td {
      border: 1px solid black;
      }

    </style>

  </xsl:template>

</xsl:stylesheet>