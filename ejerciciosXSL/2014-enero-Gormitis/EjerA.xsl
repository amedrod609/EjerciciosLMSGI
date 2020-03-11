<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8"/>
  <xsl:template match="/gormitis">
    <html>
      <head>
        <title>Gormiti sheet</title>
        <xsl:call-template name="css"/>
      </head>
      <body>
        <table>
          <thead>
            <tr>
              <td></td>
              <td>Gormiti</td>
              <td>Tribu</td>
            </tr>
          </thead>
          <xsl:apply-templates select="gormiti"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="gormiti">
    <tr>
      <xsl:if test="position() mod 2 != 1">
        <xsl:attribute name="class">fondoAzul</xsl:attribute>
      </xsl:if>
      <td>
        <xsl:value-of select="position()"/>
      </td>
      <td>
        <img src="{.}"/>
      </td>
      <td>
        <xsl:value-of select="@tribu"/>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="css">
    <style>
      table, tr, td {
      border: 1px solid #73bdf5;
      width: 80%
      }
      img {
      width: 80px;
      }
      thead tr td {
      background-color: #206de8;
      color: white;
      }
      .fondoAzul{
      background-color: #73bdf5;
      color: white;
      }
    </style>
  </xsl:template>
</xsl:stylesheet>
