<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:ns0="http://service.ultra.com.br/logistica/NotificarExpedicaoMercadoria/v1"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:tns="http://www.oracle.com/retail/integration/rib/RibMessages"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:Q3="http://canonico.ultra.com.br/infcorp/v1" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:Q2="http://service.ultra.com.br/infcorp/LogIntegration/v1"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/"
                xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/jms/AppExtrafarmaSOA/AvisoExpedicaoMercadoriaIntegracaoBPEL/etASNOutJMSReference">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/AvisoExpedicaoMercadoriaV1.wsdl"/>
        <oracle-xsl-mapper:rootElement name="NotificarExpedicaoMercadoriaRequest"
                                       namespace="http://service.ultra.com.br/logistica/NotificarExpedicaoMercadoria/v1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/etASNOutJMSReference.wsdl"/>
        <oracle-xsl-mapper:rootElement name="RibMessages"
                                       namespace="http://www.oracle.com/retail/integration/rib/RibMessages"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [THU JUL 20 14:20:34 BRT 2017].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:RibMessages/>
  </xsl:template>
</xsl:stylesheet>