<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns="http://www.w3.org/1999/xhtml" >
    
    
    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/">
        
        <html>
        
            <head>
                <link rel="stylesheet" type="text/css" href="LL1-3.css" media="screen" /> 
                <title><xsl:value-of select="//tei:titleStmt/tei:title"/></title>            
            </head>
            <body>
                
                <div class="dropdown">
                    <button class="dropbtn">Informazioni generali
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <xsl:apply-templates select="//tei:titleStmt" />
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">Edizione digitale
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <xsl:apply-templates select="//tei:editionStmt" />
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">Pubblicazione 
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <xsl:apply-templates select="//tei:publicationStmt" />
                    </div>
                </div>

                <div class="dropdown">
                    <button class="dropbtn">Dettagli manoscritto 
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <xsl:apply-templates select="//tei:sourceDesc" />
                    </div>
                </div>

                <div id="immagini_lettera" class="edizioneDigitale">
                    <xsl:apply-templates select="//tei:facsimile"/>
                    <xsl:apply-templates select="//tei:facsimile/tei:surface/tei:graphic"/> 
                </div>
                <div>
                    <a id="box_info"></a>
                
                </div>
                <div><xsl:apply-templates select="//tei:front" /></div>
                <div><xsl:apply-templates select="//tei:body" /></div>
            
            
            </body>
            
        </html>
    </xsl:template>


    
    

    <xsl:template match="//tei:front">
        <h2>Fronte verso</h2>
        <p>
            Sulla busta è indicato il destinatario della lettera, che è 
            <xsl:value-of select="tei:div/tei:div[@type='destination']/*/tei:addrLine[1]"/> di 
            <xsl:value-of select="tei:div/tei:div[@type='destination']/*/tei:addrLine[2]"/>.
        </p>
    </xsl:template>

    <xsl:template match="//tei:body">
        <h2>Corpo della lettera</h2>
        <div>
            <p><xsl:value-of select="//tei:opener/tei:dateline"/></p>
        </div>
        <div>
            <p>
                <xsl:call-template name="accapo"> </xsl:call-template>             
            </p>
        </div>
    </xsl:template>
    
    <xsl:template name="accapo" match="//tei:lb">
        <br /><a id="ancora"></a><xsl:apply-templates/>    
    </xsl:template>


    <xsl:template match="//tei:respStmt">
        <h3><xsl:value-of select="tei:resp"/></h3>
        <ul>
            <xsl:for-each select="tei:name">
                <li><xsl:value-of select="."/></li>     
            </xsl:for-each>
        </ul>
    </xsl:template>

    <!-- attributo ref
    <xsl:template name="ref" match="*[@ref]">
        <xsl:attribute name="ref">
            <xsl:value-of select="@ref"/>
        </xsl:attribute>
    </xsl:template>
    -->

    <xsl:template match="//tei:titleStmt">
        <h2><xsl:value-of select="tei:title"/></h2>
        <h3><xsl:value-of select="tei:author"/></h3>
        <div><xsl:apply-templates select="tei:respStmt" /></div>
        
    </xsl:template>

    <xsl:template match="//tei:editionStmt">
        <h2><xsl:value-of select="tei:edition"/></h2>
        <h3><xsl:value-of select="tei:edition/date"/></h3>
        <div><xsl:apply-templates select="tei:respStmt" /></div>
        
    </xsl:template>

    <xsl:template match="//tei:publicationStmt">
        <h2><xsl:value-of select="tei:publisher"/></h2>
        Licenza: <a href="https://creativecommons.org/licenses/by/4.0/"><xsl:value-of select="tei:availability/tei:licence"/></a>
    </xsl:template>

    <xsl:template match="//tei:sourceDesc">
        <div>
            <h2>Collocazione</h2>
            <p>
               <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:country"/>, <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:settlement"/>; <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:altIdentifier/tei:idno"/>.
               <xsl:value-of select="//tei:adminInfo/tei:note"/>
            </p>
            <h2>Descrizione manoscritto</h2>
            <div>
                <xsl:apply-templates select="//tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support"/>
            </div>
            
        </div>
    </xsl:template>

    <xsl:template match="//tei:support">
        <ul>
            <li> Materiale: <xsl:value-of select="tei:material"/> </li>
            <li> Filigrana: <xsl:value-of select="tei:watermark"/> </li>
            <li> Sigilli e timbri: <xsl:value-of select="tei:stamp"/> </li>
            <li> Condizioni: <xsl:value-of select="tei:support/tei:p[1]"/> </li>
            <li> Segni particolari: <xsl:value-of select="tei:support/tei:p[2]"/> </li>
            <li> Dimensioni: <xsl:value-of select="//tei:extent/tei:dimensions/tei:height"/> x <xsl:value-of select="//tei:extent/tei:dimensions/tei:width"/> </li>
            <li> Piegatura: <xsl:value-of select="//tei:foliation"/> </li>
            <li> Annotazioni: <xsl:value-of select="//tei:handNote/tei:p"/></li>
                    
        </ul>
    </xsl:template>


    <xsl:template match="//tei:facsimile">
        <xsl:for-each select="tei:surface/tei:graphic"> 
            <xsl:variable name="position" select="position()"/>
            <xsl:element name="img">
                <xsl:attribute name="usemap">
                    <xsl:value-of select="concat('#map',$position)"/>
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="concat('imglettera' , $position) "/>
                </xsl:attribute> 
                <xsl:attribute name="width">
                    <xsl:value-of select="concat('20%' ,'') "/>
                </xsl:attribute>
                <xsl:attribute name="src">
                    <xsl:value-of select="current()/@url "/>
                </xsl:attribute>
                <xsl:element name="map">
                    <xsl:attribute name="name">
                        <xsl:value-of select="concat('map',$position)"/>
                    </xsl:attribute>
                    <xsl:for-each select="following-sibling::grapich">
                        <xsl:apply-templates select="tei:zone"/>
                    </xsl:for-each>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    
    <xsl:template match="//tei:zone">
    <xsl:element name="area">       
        <xsl:attribute name="id">
            <xsl:value-of select="@xml:id"/>       
        </xsl:attribute>
        <xsl:attribute name="shape">
            <xsl:value-of select="concat('rect','')"/>
        </xsl:attribute>
        <xsl:attribute name="coords">
            <xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/>
        </xsl:attribute>
        <xsl:attribute name="href">
            <xsl:value-of select="concat('#box_info','')"/>
        </xsl:attribute>
    </xsl:element>
    </xsl:template>
</xsl:stylesheet>




