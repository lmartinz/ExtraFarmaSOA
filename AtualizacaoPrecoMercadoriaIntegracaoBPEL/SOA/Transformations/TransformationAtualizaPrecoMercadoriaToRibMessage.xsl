<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:tns="http://www.oracle.com/retail/integration/rib/RibMessages" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://service.ultra.com.br/precificacao/AtualizacaoPrecoMercadoria/v1" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:ns1="http://www.oracle.com/retail/integration/custom/bo/ExtOfPrcChgDesc/v1"
                xmlns:prc="http://www.oracle.com/retail/integration/base/bo/PrcChgDesc/v1"
                xmlns:tns1="http://service.ultra.com.br/precificacao/InformacoesAdicionais/v1">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/AtualizacaoPrecoMercadoriaEBMV1.xsd"/>
            <oracle-xsl-mapper:rootElement name="AtualizacaoPrecoMercadoriaRequest" namespace="http://service.ultra.com.br/precificacao/AtualizacaoPrecoMercadoria/v1"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/RibMessages.xsd"/>
            <oracle-xsl-mapper:rootElement name="RibMessages" namespace="http://www.oracle.com/retail/integration/rib/RibMessages"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.1.0(XSLT Build 160608.1900.0023) AT [THU JUN 22 09:53:32 BRT 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:RibMessages>
         <tns:ribMessage>
            <tns:messageData>
               <prc:PrcChgDesc>
                  <prc:PrcChg>
                     <prc:location>
                        <xsl:value-of select="/ns0:AtualizacaoPrecoMercadoriaRequest/codigoLocalDestino"/>
                     </prc:location>
                     <prc:loc_type>S</prc:loc_type>
                     <prc:item>
                        <xsl:value-of select="string (/ns0:AtualizacaoPrecoMercadoriaRequest/codigoProduto )"/>
                     </prc:item>
                     <prc:change_type>2</prc:change_type>
                     <xsl:for-each select="/ns0:AtualizacaoPrecoMercadoriaRequest/AtualizacaoPrecoMercadoriaDetalheList">
                        <prc:PrcChgDtl>
                           <prc:unit_retail>
                              <xsl:value-of select="number (precoVarejoMercadoria )"/>
                           </prc:unit_retail>
                           <prc:effective_date>
                              <xsl:value-of select="dataInicioVigenciaPrecoMercadoria"/>
                           </prc:effective_date>
                           <prc:end_date>
                              <xsl:value-of select="dataFimVigenciaPrecoMercadoria"/>
                           </prc:end_date>
                           <xsl:for-each select="InformacoesAdicionaisList">
                              <ns1:ExtOfPrcChgDtl>
                                 <ns1:pmc_id>
                                    <xsl:value-of select="codigoCustomizadoUDA"/>
                                 </ns1:pmc_id>
                                 <ns1:pmc_value>
                                    <xsl:value-of select="valorCustomizadoUDA"/>
                                 </ns1:pmc_value>
                              </ns1:ExtOfPrcChgDtl>
                           </xsl:for-each>
                        </prc:PrcChgDtl>
                     </xsl:for-each>
                  </prc:PrcChg>
               </prc:PrcChgDesc>
            </tns:messageData>
            <tns:customData>
               <xsl:value-of select="/ns0:AtualizacaoPrecoMercadoriaRequest/InformacoesAdicionaisList/codigoCustomizadoUDA"/>
            </tns:customData>
            <tns:customFlag>
               <xsl:value-of select="/ns0:AtualizacaoPrecoMercadoriaRequest/InformacoesAdicionaisList/valorCustomizadoUDA"/>
            </tns:customFlag>
         </tns:ribMessage>
      </tns:RibMessages>
   </xsl:template>
</xsl:stylesheet>
