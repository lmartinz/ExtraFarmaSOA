<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:tns="http://www.oracle.com/retail/integration/rib/RibMessages" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://service.ultra.com.br/logistica/TransferenciaMercadoriaLoja/v1" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:Q3="http://canonico.ultra.com.br/infcorp/v1" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:Q2="http://service.ultra.com.br/infcorp/LogIntegration/v1"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/"
                xmlns:ns2="http://www.oracle.com/retail/integration/base/bo/XTsfRef/v1"
                xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/jms/AppExtrafarmaSOA/TransferenciaMercadoriaLojaIntegracaoBPEL/etXTsfJMSCancelarReference">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/TransferenciaMercadoriaLojaV1.wsdl"/>
            <oracle-xsl-mapper:rootElement name="CancelarTransferenciaMercadoriaLojaRequest" namespace="http://service.ultra.com.br/logistica/TransferenciaMercadoriaLoja/v1"/>
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
            <oracle-xsl-mapper:schema location="../WSDLs/etXTsfJMSReference.wsdl"/>
            <oracle-xsl-mapper:rootElement name="RibMessages" namespace="http://www.oracle.com/retail/integration/rib/RibMessages"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [MON JUN 26 17:53:23 BRT 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="MetaInformacaoVariable.parameters"/>
   <xsl:template match="/">
      <tns:RibMessages>
         <tns:ribMessage>
            <tns:family>
              <xsl:value-of select='dvm:lookupValue ("oramds:/apps/Extrafarma/Retail/Comum/v1/Resource/ValoresRibMessageDVM.dvm", "id", "032CANCELAR", "family", "xtsf" )'/>
            </tns:family>
            <tns:type>
              <xsl:value-of select='dvm:lookupValue ("oramds:/apps/Extrafarma/Retail/Comum/v1/Resource/ValoresRibMessageDVM.dvm", "id", "032CANCELAR", "type", "xtsfdtldel" )'/>
            </tns:type>
            <tns:id>
               <xsl:value-of select="/ns0:CancelarTransferenciaMercadoriaLojaRequest/codigoTransferencia"/>
            </tns:id>
            <tns:ribmessageID>
               <xsl:value-of select="concat ('ERPImifarma_xtsf_sub_1|', xp20:current-dateTime(),'|' , $MetaInformacaoVariable.parameters/Q2:MetaInformacao/Q2:idControle)"/>
            </tns:ribmessageID>
            <tns:publishTime>
               <xsl:value-of select="xp20:current-dateTime ( )"/>
            </tns:publishTime>
            <tns:messageData>
               <ns2:XTsfRef>
                  <ns2:tsf_no>
                     <xsl:value-of select="/ns0:CancelarTransferenciaMercadoriaLojaRequest/codigoTransferencia"/>
                  </ns2:tsf_no>
                  <xsl:for-each select="/ns0:CancelarTransferenciaMercadoriaLojaRequest/TransferenciaDetalheList">
                     <ns2:XTsfDtlRef>
                        <ns2:item>
                           <xsl:value-of select="string(codigoProduto)"/>
                        </ns2:item>
                     </ns2:XTsfDtlRef>
                  </xsl:for-each>
               </ns2:XTsfRef>
            </tns:messageData>
            <tns:customFlag>
               <xsl:value-of select='dvm:lookupValue ("oramds:/apps/Extrafarma/Retail/Comum/v1/Resource/ValoresRibMessageDVM.dvm", "id", "032CANCELAR", "customFlag", "F" )'/>
            </tns:customFlag>
         </tns:ribMessage>
      </tns:RibMessages>
   </xsl:template>
</xsl:stylesheet>
