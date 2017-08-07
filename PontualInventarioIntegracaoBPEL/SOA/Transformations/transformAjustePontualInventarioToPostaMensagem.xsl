<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:ns0="http://service.ultra.com.br/estoque/PontualInventario/v1" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:tns="http://www.oracle.com/retail/integration/rib/RibMessages" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:Q3="http://canonico.ultra.com.br/infcorp/v1" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:Q2="http://service.ultra.com.br/infcorp/LogIntegration/v1"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:ns2="http://www.oracle.com/retail/integration/base/bo/EXFItemDesc/v1"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/jms/AppExtrafarmaSOA/PontualInventarioIntegracaoBPEL/etInvAdjustJMSReference"
                xmlns:ns4="http://www.oracle.com/retail/integration/custom/bo/ExtOfInvAdjustDesc/v1"
                xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/"
                xmlns:ns3="http://www.oracle.com/retail/integration/base/bo/InvAdjustDesc/v1"
                xmlns:ns5="http://www.oracle.com/retail/integration/base/bo/PrcChgDesc/v1">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/PontualInventarioV1.wsdl"/>
            <oracle-xsl-mapper:rootElement name="AjustePontualInventarioRequest" namespace="http://service.ultra.com.br/estoque/PontualInventario/v1"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="oramds:/apps/Extrafarma/Retail/Comum/v1/Schemas/MetaInformacao.xsd"/>
            <oracle-xsl-mapper:rootElement name="MetaInformacao"
                                           namespace="http://service.ultra.com.br/infcorp/LogIntegration/v1"/>
            <oracle-xsl-mapper:param name="MetaInformacaoVariable.parameters"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/etInvAdjustJMSReference.wsdl"/>
            <oracle-xsl-mapper:rootElement name="RibMessages" namespace="http://www.oracle.com/retail/integration/rib/RibMessages"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [WED JUN 28 17:07:09 BRT 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="MetaInformacaoVariable.parameters"/>
   <xsl:template match="/">
      <tns:RibMessages>
         <tns:ribMessage>
            <tns:family>
              <xsl:value-of select='dvm:lookupValue ("oramds:/apps/Extrafarma/Retail/Comum/v1/Resource/ValoresRibMessageDVM.dvm", "id", "059", "family", "invadjust" )'/>
            </tns:family>
            <tns:type>
              <xsl:value-of select='dvm:lookupValue ("oramds:/apps/Extrafarma/Retail/Comum/v1/Resource/ValoresRibMessageDVM.dvm", "id", "059", "type", "invadjustcre" )'/>
            </tns:type>
            <tns:ribmessageID>
               <xsl:value-of select="concat (&quot;ERPImifarma_invadjust_sub_1|&quot;, xp20:current-dateTime(), &quot;|&quot;, $MetaInformacaoVariable.parameters/Q2:MetaInformacao/Q2:idControle )"/>
            </tns:ribmessageID>
            <tns:publishTime>
               <xsl:value-of select="xp20:current-dateTime ( )"/>
            </tns:publishTime>
            <tns:messageData>
               <ns3:InvAdjustDesc>
                  <ns3:dc_dest_id>
                     <xsl:value-of select="string(/ns0:AjustePontualInventarioRequest/codigoFilial)"/>
                  </ns3:dc_dest_id>
                  <xsl:for-each select="/ns0:AjustePontualInventarioRequest/AjusteDetalheList">
                     <ns3:InvAdjustDtl>
                        <ns3:item_id>
                           <xsl:value-of select="string(codigoProduto)"/>
                        </ns3:item_id>
                        <ns3:adjustment_reason_code>
                           <xsl:value-of select="codigoMotivoAjuste"/>
                        </ns3:adjustment_reason_code>
                        <ns3:unit_qty>
                           <xsl:value-of select="quantidadeAjuste"/>
                        </ns3:unit_qty>
                        <ns3:from_disposition>
                           <xsl:value-of select="statusDeInventario"/>
                        </ns3:from_disposition>
                        <ns3:to_disposition>
                           <xsl:value-of select="statusParaInventario"/>
                        </ns3:to_disposition>
                        <ns3:user_id>
                           <xsl:value-of select="codigoUsuario"/>
                        </ns3:user_id>
                        <ns3:create_date>
                           <xsl:value-of select="dataAjuste"/>
                        </ns3:create_date>
                        <ns3:aux_reason_code>
                           <xsl:value-of select="codigoRazaoAuxiliar"/>
                        </ns3:aux_reason_code>
                        <ns3:weight_uom>
                           <xsl:value-of select="unidadeMedida"/>
                        </ns3:weight_uom>
                        <xsl:for-each select="ItemList">
                           <ns4:ExtOfInvAdjustDtl>
                              <xsl:for-each select="LoteItemList">
                                 <ns2:EXFItemDtl>
                                    <xsl:for-each select="LoteItemDetalheList">
                                       <ns2:EXFLotInfoDesc>
                                          <ns2:lot_id>
                                             <xsl:value-of select="codigoLote"/>
                                          </ns2:lot_id>
                                          <ns2:expiration_date>
                                             <xsl:value-of select="dataValidade"/>
                                          </ns2:expiration_date>
                                          <ns2:lot_qty>
                                             <xsl:value-of select="format-number(quantidadeLote,'############.0000')"/>
                                          </ns2:lot_qty>
                                       </ns2:EXFLotInfoDesc>
                                    </xsl:for-each>
                                 </ns2:EXFItemDtl>
                              </xsl:for-each>
                           </ns4:ExtOfInvAdjustDtl>
                        </xsl:for-each>
                     </ns3:InvAdjustDtl>
                  </xsl:for-each>
               </ns3:InvAdjustDesc>
            </tns:messageData>
            <tns:customFlag>
               <xsl:value-of select='dvm:lookupValue ("oramds:/apps/Extrafarma/Retail/Comum/v1/Resource/ValoresRibMessageDVM.dvm", "id", "059", "customFlag", "F" )'/>
            </tns:customFlag>
         </tns:ribMessage>
      </tns:RibMessages>
   </xsl:template>
</xsl:stylesheet>
