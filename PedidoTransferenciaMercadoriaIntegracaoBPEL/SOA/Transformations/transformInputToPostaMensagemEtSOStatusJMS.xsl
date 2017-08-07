<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:tns="http://www.oracle.com/retail/integration/rib/RibMessages" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ns0="http://service.ultra.com.br/logistica/PedidoTransferenciaMercadoria/v1" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl" xml:id="id_1" oraxsl:ignorexmlids="true"
                xmlns:Q3="http://canonico.ultra.com.br/infcorp/v1" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:Q2="http://service.ultra.com.br/infcorp/LogIntegration/v1"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/jms/AppExtrafarmaSOA/PedidoTransferenciaMercadoriaIntegracaoBPEL/etSOStatusReference"
                xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/"
                xmlns:ns2="http://www.oracle.com/retail/integration/base/bo/SOStatusDesc/v1"
                xmlns:ns3="http://www.oracle.com/retail/integration/base/bo/EXFNFInfoDesc/v1"
                xmlns:ns5="http://www.oracle.com/retail/integration/base/bo/EXFItemDesc/v1"
                xmlns:ns4="http://www.oracle.com/retail/integration/base/bo/ASNOutDesc/v1"
                xmlns:ns6="http://www.oracle.com/retail/integration/custom/bo/ExtOfASNOutDesc/v1">
   <oracle-xsl-mapper:schema xml:id="id_2">
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources xml:id="id_3">
         <oracle-xsl-mapper:source type="WSDL" xml:id="id_4">
            <oracle-xsl-mapper:schema location="../WSDLs/PedidoTransferenciaMercadoriaV1.wsdl" xml:id="id_5"/>
            <oracle-xsl-mapper:rootElement name="PedidoTransferenciaMercadoriaRequest" namespace="http://service.ultra.com.br/logistica/PedidoTransferenciaMercadoria/v1" xml:id="id_6"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL" xml:id="id_48">
            <oracle-xsl-mapper:schema location="oramds:/apps/Extrafarma/Retail/Comum/v1/Schemas/MetaInformacao.xsd"
                                      xml:id="id_49"/>
            <oracle-xsl-mapper:rootElement name="MetaInformacao"
                                           namespace="http://service.ultra.com.br/infcorp/LogIntegration/v1"
                                           xml:id="id_50"/>
            <oracle-xsl-mapper:param name="MetaInformacaoVariable.parameters" xml:id="id_51"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets xml:id="id_7">
         <oracle-xsl-mapper:target type="WSDL" xml:id="id_8">
            <oracle-xsl-mapper:schema location="../WSDLs/etSOStatusJMSReference.wsdl" xml:id="id_9"/>
            <oracle-xsl-mapper:rootElement name="RibMessages" namespace="http://www.oracle.com/retail/integration/rib/RibMessages" xml:id="id_10"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [FRI JUL 07 13:38:07 BRT 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="MetaInformacaoVariable.parameters" xml:id="id_52"/>
   <xsl:template match="/" xml:id="id_11">
      <tns:RibMessages xml:id="id_12">
         <tns:ribMessage xml:id="id_13">
            <tns:family>
              <xsl:value-of select='dvm:lookupValue ("oramds:/apps/Extrafarma/Retail/Comum/v1/Resource/ValoresRibMessageDVM.dvm", "id", "067", "family", "sostatus" )'/>
            </tns:family>
            <tns:type>
              <xsl:value-of select='dvm:lookupValue ("oramds:/apps/Extrafarma/Retail/Comum/v1/Resource/ValoresRibMessageDVM.dvm", "id", "067", "type", "sostatuscre" )'/>
            </tns:type>
            <tns:id xml:id="id_53">
               <xsl:value-of select="/ns0:PedidoTransferenciaMercadoriaRequest/numeroPedido" xml:id="id_54"/>
            </tns:id>
            <tns:ribmessageID xml:id="id_55">
               <xsl:value-of select="concat ('ERPImifarma_sostatus_sub_1|', xp20:current-dateTime(),'|', $MetaInformacaoVariable.parameters/Q2:MetaInformacao/Q2:idControle)"/>
            </tns:ribmessageID>
            <tns:publishTime xml:id="id_56">
               <xsl:value-of select="xp20:current-dateTime ( )" xml:id="id_57"/>
            </tns:publishTime>
            <tns:messageData xml:id="id_16">
               <ns2:SOStatusDesc xml:id="id_17">
                  <ns2:dc_dest_id xml:id="id_18">
                     <xsl:value-of select="string(/ns0:PedidoTransferenciaMercadoriaRequest/codigoLocalOrigem)" xml:id="id_19"/>
                  </ns2:dc_dest_id>
                  <ns2:loc_type xml:id="id_20">
                     <xsl:value-of select="/ns0:PedidoTransferenciaMercadoriaRequest/tipoLocal" xml:id="id_21"/>
                  </ns2:loc_type>
                  <ns2:store_type xml:id="id_22">
                     <xsl:value-of select="/ns0:PedidoTransferenciaMercadoriaRequest/tipoLoja" xml:id="id_23"/>
                  </ns2:store_type>
                  <ns2:distro_nbr xml:id="id_24">
                     <xsl:value-of select="/ns0:PedidoTransferenciaMercadoriaRequest/numeroPedido" xml:id="id_25"/>
                  </ns2:distro_nbr>
                  <ns2:distro_document_type xml:id="id_26">
                     <xsl:value-of select="/ns0:PedidoTransferenciaMercadoriaRequest/statusOrdemEstoque"
                                   xml:id="id_27"/>
                  </ns2:distro_document_type>
                  <xsl:for-each xml:id="id_28"
                                select="/ns0:PedidoTransferenciaMercadoriaRequest/PedidoTransferenciaMercadoriaDetalhe">
                     <ns2:SOStatusDtl xml:id="id_29">
                        <ns2:dest_id xml:id="id_30">
                           <xsl:value-of select="string(codigoLocalRecebimento)" xml:id="id_31"/>
                        </ns2:dest_id>
                        <ns2:loc_type xml:id="id_32">
                           <xsl:value-of select="tipoLocal" xml:id="id_33"/>
                        </ns2:loc_type>
                        <ns2:store_type xml:id="id_34">
                           <xsl:value-of select="tipoLoja" xml:id="id_35"/>
                        </ns2:store_type>
                        <ns2:item_id xml:id="id_36">
                           <xsl:value-of select="string(codigoItem)" xml:id="id_37"/>
                        </ns2:item_id>
                        <ns2:order_line_nbr xml:id="id_38">
                           <xsl:value-of select="numeroLinha" xml:id="id_39"/>
                        </ns2:order_line_nbr>
                        <ns2:unit_qty xml:id="id_40">
                           <xsl:value-of select="format-number(quantidadeItem,'############.0000')" xml:id="id_41"/>
                        </ns2:unit_qty>
                        <ns2:status xml:id="id_42">
                           <xsl:value-of select="statusEstoque" xml:id="id_43"/>
                        </ns2:status>
                     </ns2:SOStatusDtl>
                  </xsl:for-each>
               </ns2:SOStatusDesc>
            </tns:messageData>
            <tns:customFlag>
               <xsl:value-of select='dvm:lookupValue ("oramds:/apps/Extrafarma/Retail/Comum/v1/Resource/ValoresRibMessageDVM.dvm", "id", "067", "customFlag", "F" )'/>
            </tns:customFlag>
         </tns:ribMessage>
      </tns:RibMessages>
   </xsl:template>
</xsl:stylesheet>
