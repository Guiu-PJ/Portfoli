<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="parc/@nom"/>
                </title>
                <link rel="stylesheet" type="text/css" href="horariParc.css"/>
            </head>
            <body>
                <header class="capcalera">
                    <span>
                        <img alt="logoParc" width="50" height="50">
                            <xsl:attribute name="src">
                                <xsl:value-of select="parc/@logo"/>
                            </xsl:attribute>
                        </img>
                    </span>
                    <span class="nom">
                        <xsl:value-of select="parc/@nom"/>
                    </span>
                </header>
                <header class="dades">
                    Obrim del <xsl:value-of select="parc/dates/dataObertura"/> al <xsl:value-of select="parc/dates/dataTancament"/>
                </header>
                <header class="mes">
                    <xsl:value-of select="parc/horaris/mes[@nom='Novembre']/@nom"/>
                </header>
                <section>
                    <table>
                        <tr>
                            <xsl:for-each select="parc/horaris/mes[@nom='Juliol']/periode/diaSetmana">
                                <th>
                                    <xsl:value-of select="text()"/>   
                                </th>
                            </xsl:for-each>
                        </tr>
                        <xsl:for-each select="parc/horaris/mes[@nom='Novembre']/periode"> 
                            <tr>
                                <xsl:for-each select="diaSetmana">
                                    <td>
                                        <xsl:if test="@diaMes">
                                            <div class="dia">
                                                <xsl:value-of select="@diaMes"/>
                                            </div>
                                            <div>
                                                <xsl:choose>
                                                    <xsl:when test="@horaObertura">
                                                        <xsl:value-of select="@horaObertura"/> - <xsl:value-of select="@horaTancament"/>
                                                    </xsl:when>
                                                    <xsl:otherwise> TANCAT </xsl:otherwise>
                                                </xsl:choose>
                                            </div>
                                        </xsl:if>
                                    </td>
                                </xsl:for-each>
                            </tr>
                        </xsl:for-each>
                    </table>
                </section>
                <footer class="dades">
                    <div>
                        <xsl:value-of select="parc/adreca"/>
                    </div>
                    <div>
                        <xsl:value-of select="parc/ciutat"/> - <xsl:value-of select="parc/pais"/>
                    </div>
                    <div>
                        web: 
                        <a href="http://www.coperaventura.com">
                            <xsl:value-of select="parc/paginaWeb"/>
                        </a>
                    </div>
                </footer>  
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
