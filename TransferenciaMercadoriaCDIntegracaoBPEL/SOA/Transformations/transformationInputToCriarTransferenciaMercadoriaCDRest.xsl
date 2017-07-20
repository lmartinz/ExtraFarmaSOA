<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:ns0="http://www.oracle.com/retail/integration/rib/RibMessages" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:tns="http://service.ultra.com.br/logistica/CriarTransferenciaMercadoriaCDRest/v1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:Q3="http://canonico.ultra.com.br/LegadoFault/v1" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:Q2="http://service.ultra.com.br/infcorp/LogIntegration/v1"
                xmlns:Q4="http://canonico.ultra.com.br/LegadoOutput/v1"
                xmlns:ns1="http://service.ultra.com.br/logistica/CriarTransferenciaMercadoriaCD/v1"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:nxsd="http://xmlns.oracle.com/pcbpel/nxsd"
                xmlns:ns4="ns4" xmlns:ns2=".." xmlns:ns3=",">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="oramds:/apps/Extrafarma/Retail/TransferenciaMercadoriaCD/v1/WSDLs/CriarTransferenciaMercadoriaCDV1.wsdl"/>
            <oracle-xsl-mapper:rootElement name="RibMessages" namespace="http://www.oracle.com/retail/integration/rib/RibMessages"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/CriarTransferenciaMercadoriaCDRest.xsd"/>
            <oracle-xsl-mapper:rootElement name="Root-Element" namespace="http://service.ultra.com.br/logistica/CriarTransferenciaMercadoriaCDRest/v1"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [THU JUL 20 11:12:43 BRT 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:Root-Element>
         <tns:numeroAgendamento>
            <xsl:value-of select="/ns0:RibMessages/ns0:ribMessage/ns0:messageData/ns4:POScheduleDesc/ns4:schedule_nbr"/>
         </tns:numeroAgendamento>
         <tns:codigoDeposito>
            <xsl:value-of select="number (/ns0:RibMessages/ns0:ribMessage/ns0:messageData/ns4:POScheduleDesc/ns4:physical_wh )"/>
         </tns:codigoDeposito>
         <xsl:for-each select="/ns0:RibMessages/ns0:ribMessage/ns0:messageData/ns4:POScheduleDesc/ns4:POSchedule">
            <tns:PlanejamentoPedidoCompraList>
               <tns:numeroPedidoCompra>
                  <xsl:value-of select="number (ns4:requisition_nbr )"/>
               </tns:numeroPedidoCompra>
               <xsl:for-each select="">
                  <tns:PlanejamentoDetalheList>
                     <tns:codigoItem>
                        <xsl:value-of select="number (number (ns2:item ) )"/>
                     </tns:codigoItem>
                     <tns:quantidadeConsolidadaPedidoCompra>
                        <xsl:value-of select="ns3:consolidate_qty"/>
                     </tns:quantidadeConsolidadaPedidoCompra>
                  </tns:PlanejamentoDetalheList>
               </xsl:for-each>
            </tns:PlanejamentoPedidoCompraList>
         </xsl:for-each>
      </tns:Root-Element>
   </xsl:template>
</xsl:stylesheet>
