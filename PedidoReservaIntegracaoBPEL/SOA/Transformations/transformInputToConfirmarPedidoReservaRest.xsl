<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:ns0="http://www.oracle.com/retail/integration/rib/RibMessages" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:tns="http://service.ultra.com.br/logistica/ConfirmarPedidoReservaRest/v1" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:ns1="http://service.ultra.com.br/atacado/PedidoReserva/v1"
                xmlns:Q3="http://canonico.ultra.com.br/infcorp/v1"
                xmlns:Q4="http://schemas.datacontract.org/2004/07/Wsdl.Integration"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:Q2="http://service.ultra.com.br/infcorp/LogIntegration/v1"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:nxsd="http://xmlns.oracle.com/pcbpel/nxsd"
                xmlns:Q5="http://canonico.ultra.com.br/LegadoFault/v1"
                xmlns:ns2="http://canonico.ultra.com.br/LegadoOutput/v1">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="oramds:/apps/Extrafarma/Retail/PedidoReserva/v1/WSDLs/PedidoReservaV1.wsdl"/>
            <oracle-xsl-mapper:rootElement name="RibMessages" namespace="http://www.oracle.com/retail/integration/rib/RibMessages"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/ConfirmarPedidoReservaRest.xsd"/>
            <oracle-xsl-mapper:rootElement name="Root-Element" namespace="http://service.ultra.com.br/logistica/ConfirmarPedidoReservaRest/v1"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [THU JUL 06 17:35:25 BRT 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:Root-Element>
         <tns:PedidoList>
            <tns:numeroPedido>
               <xsl:value-of select="/ns0:RibMessages/ns0:ribMessage/ns0:messageData/ns3:FulfilOrdCfmDesc/ns3:customer_order_no"/>
            </tns:numeroPedido>
            <tns:numeroOrdemAtendimento>
               <xsl:value-of select="/ns0:RibMessages/ns0:ribMessage/ns0:messageData/ns3:FulfilOrdCfmDesc/ns3:fulfill_order_no"/>
            </tns:numeroOrdemAtendimento>
            <tns:tipoConfirmacao>
               <xsl:value-of select="/ns0:RibMessages/ns0:ribMessage/ns0:messageData/ns3:FulfilOrdCfmDesc/ns3:confirm_type"/>
            </tns:tipoConfirmacao>
            <tns:numeroPedidoConfirmacao>
               <xsl:value-of select="/ns0:RibMessages/ns0:ribMessage/ns0:messageData/ns3:FulfilOrdCfmDesc/ns3:confirm_no"/>
            </tns:numeroPedidoConfirmacao>
            <xsl:for-each select="/ns0:RibMessages/ns0:ribMessage/ns0:messageData/ns3:FulfilOrdCfmDesc/ns2:FulfilOrdCfmDtl">
               <tns:ItemPedidoList>
                  <tns:itemConfirmado>
                     <xsl:value-of select="ns2:item"/>
                  </tns:itemConfirmado>
                  <tns:codigoProduto>
                     <xsl:value-of select="ns2:ref_item"/>
                  </tns:codigoProduto>
                  <tns:quantidadeAtendida>
                     <xsl:value-of select="ns2:confirm_qty"/>
                  </tns:quantidadeAtendida>
                  <tns:unidadeMedida>
                     <xsl:value-of select="ns2:confirm_qty_uom"/>
                  </tns:unidadeMedida>
               </tns:ItemPedidoList>
            </xsl:for-each>
         </tns:PedidoList>
      </tns:Root-Element>
   </xsl:template>
</xsl:stylesheet>
