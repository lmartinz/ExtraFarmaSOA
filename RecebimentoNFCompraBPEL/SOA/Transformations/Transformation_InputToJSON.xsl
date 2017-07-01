<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:ns0="http://www.oracle.com/retail/integration/rib/RibMessages" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:tns="http://TargetNamespace.com/nxsdschema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:Q3="http://canonico.ultra.com.br/infcorp/v1"
                xmlns:ns2="http://www.oracle.com/retail/integration/base/bo/EXFNFInfoDesc/v1"
                xmlns:ns1="http://service.ultra.com.br/logistica/RecebimentoNFCompra/v1"
                xmlns:ns3="http://www.oracle.com/retail/integration/base/bo/EXFItemDesc/v1"
                xmlns:Q4="http://schemas.datacontract.org/2004/07/Wsdl.Integration"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:Q2="http://service.ultra.com.br/infcorp/LogIntegration/v1"
                xmlns:ns5="http://www.oracle.com/retail/integration/custom/bo/ExtOfPOScheduleDesc/v1"
                xmlns:ns4="http://www.oracle.com/retail/integration/base/bo/POScheduleDesc/v1"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:bpws="http://docs.oasis-open.org/wsbpel/2.0/process/executable">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/RecebimentoNFCompraV1.wsdl"/>
            <oracle-xsl-mapper:rootElement name="RibMessages" namespace="http://www.oracle.com/retail/integration/rib/RibMessages"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/RecebimentoNFCompraV1Wrapper.wsdl"/>
            <oracle-xsl-mapper:rootElement name="Root-Element" namespace="http://TargetNamespace.com/nxsdschema"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [SAT JUL 01 11:48:41 BRT 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:Root-Element>
         <tns:codigoAgendamento>
            <xsl:value-of select="/ns0:RibMessages/ns0:ribMessage/ns0:messageData/ns4:POScheduleDesc/ns4:schedule_nbr"/>
         </tns:codigoAgendamento>
         <tns:codigoFilial>
            <xsl:value-of select="/ns0:RibMessages/ns0:ribMessage/ns0:messageData/ns4:POScheduleDesc/ns4:physical_wh"/>
         </tns:codigoFilial>
         <xsl:for-each select="/ns0:RibMessages/ns0:ribMessage/ns0:messageData/ns4:POScheduleDesc/ns4:POSchedule">
            <tns:AgendamentoList>
               <tns:codigoPedido>
                  <xsl:value-of select="ns4:requisition_nbr"/>
               </tns:codigoPedido>
               <tns:tipoRequisicao>
                  <xsl:value-of select="ns4:requisition_type"/>
               </tns:tipoRequisicao>
               <xsl:for-each select="ns4:POScheduleDtl">
                  <tns:AgendamentoDetalhe>
                     <tns:codigoProduto>
                        <xsl:value-of select="ns4:item_id"/>
                     </tns:codigoProduto>
                     <tns:QuantidadeProduto>
                        <xsl:value-of select="ns4:consolidate_qty"/>
                     </tns:QuantidadeProduto>
                  </tns:AgendamentoDetalhe>
               </xsl:for-each>
            </tns:AgendamentoList>
         </xsl:for-each>
         <tns:DetalheNotaFiscal>
            <tns:NotaFiscalList>
               <tns:numeroNotaFiscal>
                  <xsl:value-of select="/ns0:RibMessages/ns0:ribMessage/ns0:messageData/ns4:POScheduleDesc/ns5:ExtOfPOScheduleDesc/ns2:EXFNFInfoDesc/ns2:fiscal_doc_no"/>
               </tns:numeroNotaFiscal>
               <tns:numeroSerieNotaFiscal>
                  <xsl:value-of select="/ns0:RibMessages/ns0:ribMessage/ns0:messageData/ns4:POScheduleDesc/ns5:ExtOfPOScheduleDesc/ns2:EXFNFInfoDesc/ns2:series_no"/>
               </tns:numeroSerieNotaFiscal>
               <tns:cnpjFornecedor>
                  <xsl:value-of select="/ns0:RibMessages/ns0:ribMessage/ns0:messageData/ns4:POScheduleDesc/ns5:ExtOfPOScheduleDesc/ns2:EXFNFInfoDesc/ns2:issue_cnpj"/>
               </tns:cnpjFornecedor>
               <tns:dataEmissaoNota>
                  <xsl:value-of select="/ns0:RibMessages/ns0:ribMessage/ns0:messageData/ns4:POScheduleDesc/ns5:ExtOfPOScheduleDesc/ns2:EXFNFInfoDesc/ns2:issue_date"/>
               </tns:dataEmissaoNota>
               <tns:chaveNotaFiscal>
                  <xsl:value-of select="/ns0:RibMessages/ns0:ribMessage/ns0:messageData/ns4:POScheduleDesc/ns5:ExtOfPOScheduleDesc/ns2:EXFNFInfoDesc/ns2:nfe_access_key"/>
               </tns:chaveNotaFiscal>
               <xsl:for-each select="/ns0:RibMessages/ns0:ribMessage/ns0:messageData/ns4:POScheduleDesc/ns5:ExtOfPOScheduleDesc/ns2:EXFNFInfoDesc/ns2:EXFNFInfoDtl">
                  <tns:ProdutoList>
                     <tns:codigoProduto>
                        <xsl:value-of select="ns2:item"/>
                     </tns:codigoProduto>
                     <tns:QuantidadeNotaFiscal>
                        <xsl:value-of select="ns2:quantity"/>
                     </tns:QuantidadeNotaFiscal>
                     <xsl:for-each select="ns3:EXFLotInfoDesc">
                        <tns:LoteList>
                           <tns:loteProduto>
                              <xsl:value-of select="ns3:lot_id"/>
                           </tns:loteProduto>
                           <tns:dataFabricacao>
                              <xsl:value-of select="ns3:manufacture_date"/>
                           </tns:dataFabricacao>
                           <tns:dataValidade>
                              <xsl:value-of select="ns3:expiration_date"/>
                           </tns:dataValidade>
                           <tns:quantidadeLote>
                              <xsl:value-of select="ns3:lot_qty"/>
                           </tns:quantidadeLote>
                        </tns:LoteList>
                     </xsl:for-each>
                  </tns:ProdutoList>
               </xsl:for-each>
            </tns:NotaFiscalList>
         </tns:DetalheNotaFiscal>
      </tns:Root-Element>
   </xsl:template>
</xsl:stylesheet>
