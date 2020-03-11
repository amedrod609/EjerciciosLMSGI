<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>

	<xsl:template match="/biblioteca">
   		<html>
      		<head>
        		<title>Comida de Navidad</title>
            <xsl:call-template name="css"/>
      		</head>
      		<body>
            <xsl:apply-templates select="libro"/>
      		</body>
    	</html>
	</xsl:template>

  <xsl:template match="libro">
    <table>
      <tr class="tituloTabla">
        <td>
          <xsl:value-of select="titulo"/>
        </td>
        <td>
          <xsl:value-of select="autor"/>
        </td>
        <td>
          <xsl:value-of select="autor/@fechaNacimiento"/>
        </td>
        <td>
          <xsl:value-of select="fechaPublicacion/@año"/>
        </td>
      </tr>
    </table>
    <br/>
  </xsl:template>

  <xsl:template name="css">
    <style type="text/css">
      body {
      margin: 50px;
      padding: 0px;
      background: #2372DE;
      font-family: 'Open Sans', sans-serif;
      font-size: 11pt;
      color: #FFFFFF;
      text-align:center;
      }

      .tituloTabla {
      font-weight: bold;
      text-align: center;
      }
      
      table, th, td {
      border: 1px solid white;
      }
    </style>
  </xsl:template>


</xsl:stylesheet>
 