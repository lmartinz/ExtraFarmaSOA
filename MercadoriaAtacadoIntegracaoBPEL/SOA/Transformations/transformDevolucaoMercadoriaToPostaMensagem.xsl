<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:tns="http://www.oracle.com/retail/integration/rib/RibMessages" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:ns0="http://service.ultra.com.br/atacado/MercadoriaAtacado/v1" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:Q3="http://canonico.ultra.com.br/infcorp/v1" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:Q2="http://service.ultra.com.br/infcorp/LogIntegration/v1"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:ns2="http://www.oracle.com/retail/integration/base/bo/EXFItemDesc/v1"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:ns3="http://www.oracle.com/retail/integration/base/bo/EXFXNFDocDesc/v1"
                xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/"
                xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/jms/AppExtrafarmaSOA/MercadoriaAtacadoIntegracaoBPEL/etEXFXNFDocJMSReference">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/MercadoriaAtacadoV1.wsdl"/>
            <oracle-xsl-mapper:rootElement name="DevolucaoMercadoriaAtacadoRequest" namespace="http://service.ultra.com.br/atacado/MercadoriaAtacado/v1"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/etEXFXNFDocJMSReference.wsdl"/>
            <oracle-xsl-mapper:rootElement name="RibMessages" namespace="http://www.oracle.com/retail/integration/rib/RibMessages"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [SAT JUL 29 16:40:50 BRT 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:RibMessages>
         <tns:ribMessage>
            <tns:family>exfxnfdoc</tns:family>
            <tns:type>exfxnfdoccre</tns:type>
            <tns:id>
               <xsl:value-of select="/ns0:DevolucaoMercadoriaAtacadoRequest/RmaList/chaveNotaOrigem"/>
            </tns:id>
            <tns:ribmessageID>
               <xsl:value-of select="concat('ERPImifarma_exfxnfdoc_sub_1|', xp20:current-dateTime(),'|')"/>
            </tns:ribmessageID>
            <tns:publishTime>
               <xsl:value-of select="xp20:current-dateTime()"/>
            </tns:publishTime>
            <tns:messageData>
               <ns3:EXFXNFDocDesc>
                  <ns3:loc>
                     <xsl:value-of select="string(/ns0:DevolucaoMercadoriaAtacadoRequest/codigoFilial)"/>
                  </ns3:loc>
                  <ns3:loc_type>
                     <xsl:value-of select="/ns0:DevolucaoMercadoriaAtacadoRequest/tipoLocalizacao"/>
                  </ns3:loc_type>
                  <ns3:nf_type>
                     <xsl:value-of select="/ns0:DevolucaoMercadoriaAtacadoRequest/tipoNotaFiscal"/>
                  </ns3:nf_type>
                  <ns3:comments>
                     <xsl:value-of select="/ns0:DevolucaoMercadoriaAtacadoRequest/comentario"/>
                  </ns3:comments>
                  <ns3:create_user>
                     <xsl:value-of select="string(/ns0:DevolucaoMercadoriaAtacadoRequest/codigoUsuarioEmissorNota)"/>
                  </ns3:create_user>
                  <ns3:EXFNFDocCustomer>
                     <ns3:customer_id>
                        <xsl:value-of select="/ns0:DevolucaoMercadoriaAtacadoRequest/Cliente/codigoCliente"/>
                     </ns3:customer_id>
                     <ns3:customer_name>
                        <xsl:value-of select="/ns0:DevolucaoMercadoriaAtacadoRequest/Cliente/nome"/>
                     </ns3:customer_name>
                     <ns3:customer_cpf>
                        <xsl:value-of select="/ns0:DevolucaoMercadoriaAtacadoRequest/Cliente/cpfCnpj"/>
                     </ns3:customer_cpf>
                     <ns3:customer_add1>
                        <xsl:value-of select="/ns0:DevolucaoMercadoriaAtacadoRequest/Cliente/endereco"/>
                     </ns3:customer_add1>
                     <ns3:customer_add2>
                        <xsl:value-of select="/ns0:DevolucaoMercadoriaAtacadoRequest/Cliente/numeroEndereco"/>
                     </ns3:customer_add2>
                     <ns3:customer_add3>
                        <xsl:value-of select="/ns0:DevolucaoMercadoriaAtacadoRequest/Cliente/complemento"/>
                     </ns3:customer_add3>
                     <ns3:customer_add4>
                        <xsl:value-of select="/ns0:DevolucaoMercadoriaAtacadoRequest/Cliente/bairro"/>
                     </ns3:customer_add4>
                     <ns3:customer_add5>
                        <xsl:value-of select="/ns0:DevolucaoMercadoriaAtacadoRequest/Cliente/cep"/>
                     </ns3:customer_add5>
                     <ns3:customer_city>
                        <xsl:value-of select="/ns0:DevolucaoMercadoriaAtacadoRequest/Cliente/cidade"/>
                     </ns3:customer_city>
                     <ns3:city_inscription_id>
                        <xsl:value-of select="number(/ns0:DevolucaoMercadoriaAtacadoRequest/Cliente/codigoIbgeCidade)"/>
                     </ns3:city_inscription_id>
                     <ns3:customer_state>
                        <xsl:value-of select="/ns0:DevolucaoMercadoriaAtacadoRequest/Cliente/estado"/>
                     </ns3:customer_state>
                  </ns3:EXFNFDocCustomer>
                  <xsl:for-each select="/ns0:DevolucaoMercadoriaAtacadoRequest/ItemCupomList">
                     <ns3:EXFXNFDocItem>
                        <ns3:item_id>
                           <xsl:value-of select="string(codigoItem)"/>
                        </ns3:item_id>
                        <ns3:unit_qty>
                           <xsl:value-of select="quantidade"/>
                        </ns3:unit_qty>
                        <ns3:unit_price>
                           <xsl:value-of select="precoUnitario"/>
                        </ns3:unit_price>
                        <ns3:unit_percent_discount>
                           <xsl:value-of select="percentualDesconto"/>
                        </ns3:unit_percent_discount>
                        <ns3:unit_discount>
                           <xsl:value-of select="valorDesconto"/>
                        </ns3:unit_discount>
                        <ns2:EXFItemDesc>
                           <xsl:for-each select="ItemDetalheList">
                              <ns2:EXFItemDtl>
                                 <ns2:volume>
                                    <xsl:value-of select="volume"/>
                                 </ns2:volume>
                                 <xsl:for-each select="LoteItemList">
                                    <ns2:EXFLotInfoDesc>
                                       <ns2:lot_id>
                                          <xsl:value-of select="identificacaoLote"/>
                                       </ns2:lot_id>
                                       <ns2:manufacture_date>
                                          <xsl:value-of select="dataFabricacao"/>
                                       </ns2:manufacture_date>
                                       <ns2:expiration_date>
                                          <xsl:value-of select="dataValidade"/>
                                       </ns2:expiration_date>
                                       <ns2:lot_qty>
                                          <xsl:value-of select="quantidadeLote"/>
                                       </ns2:lot_qty>
                                    </ns2:EXFLotInfoDesc>
                                 </xsl:for-each>
                                 <xsl:for-each select="ImeiItemList">
                                    <ns2:EXFImei>
                                       <ns2:imei>
                                          <xsl:value-of select="imeiItem"/>
                                       </ns2:imei>
                                    </ns2:EXFImei>
                                 </xsl:for-each>
                              </ns2:EXFItemDtl>
                           </xsl:for-each>
                        </ns2:EXFItemDesc>
                     </ns3:EXFXNFDocItem>
                  </xsl:for-each>
                  <xsl:for-each select="/ns0:DevolucaoMercadoriaAtacadoRequest/RmaList">
                     <ns3:EXFRMADesc>
                        <ns3:rma_origin_nfe_accesskey>
                           <xsl:value-of select="chaveNotaOrigem"/>
                        </ns3:rma_origin_nfe_accesskey>
                        <ns3:rma_issue_date>
                           <xsl:value-of select="dataEmissaoRma"/>
                        </ns3:rma_issue_date>
                     </ns3:EXFRMADesc>
                  </xsl:for-each>
               </ns3:EXFXNFDocDesc>
            </tns:messageData>
            <tns:customFlag>F</tns:customFlag>
         </tns:ribMessage>
      </tns:RibMessages>
   </xsl:template>
</xsl:stylesheet>
