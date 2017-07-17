<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:tns="http://www.oracle.com/retail/integration/rib/RibMessages"
                xmlns:ns0="http://service.ultra.com.br/precificacao/AtualizacaoPreco/v1"
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
                xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/jms/AppExtrafarmaSOA/AtualizacaoPrecoIntegracaoBPEL/etEXFXPrcChgToRMSJMSReference"
                xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/"
                xmlns:ns2="http://www.oracle.com/retail/integration/custom/bo/ExtOfPrcChgDesc/v1"
                xmlns:ns3="http://www.oracle.com/retail/integration/base/bo/PrcChgDesc/v1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/AtualizacaoPrecoV1.wsdl"/>
        <oracle-xsl-mapper:rootElement name="AtualizacaoPrecoRequest"
                                       namespace="http://service.ultra.com.br/precificacao/AtualizacaoPreco/v1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/etEXFXPrcChgToRMSJMSReference.wsdl"/>
        <oracle-xsl-mapper:rootElement name="RibMessages"
                                       namespace="http://www.oracle.com/retail/integration/rib/RibMessages"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [THU JUL 13 14:39:28 BRT 2017].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:RibMessages>
      <tns:ribMessage>
        <tns:family>
          <xsl:value-of select='dvm:lookupValue ("oramds:/apps/Extrafarma/Retail/Comum/v1/Resource/ValoresRibMessage.dvm", "id", "021", "type", "" )'/>
        </tns:family>
        <tns:type>
          <xsl:value-of select='dvm:lookupValue ("oramds:/apps/Extrafarma/Retail/Comum/v1/Resource/ValoresRibMessage.dvm", "id", "021", "type", "" )'/>
        </tns:type>
        <tns:messageData>
          <ns3:PrcChgDesc>
            <xsl:for-each select="">
              <ns3:PrcChg>
                <ns3:location>
                  <xsl:value-of select="/ns0:AtualizacaoPrecoRequest/codigoLocalDestino"/>
                </ns3:location>
                <ns3:loc_type>
                  <xsl:value-of select="/ns0:AtualizacaoPrecoRequest/tipoLocalDestino"/>
                </ns3:loc_type>
                <ns3:item>
                  <xsl:value-of select="/ns0:AtualizacaoPrecoRequest/codigoProduto"/>
                </ns3:item>
                <ns3:change_type>
                  <xsl:value-of select="/ns0:AtualizacaoPrecoRequest/tipoMudancaPreco"/>
                </ns3:change_type>
                <xsl:for-each select="">
                  <ns3:PrcChgDtl>
                    <ns3:unit_retail>
                      <xsl:value-of select="/ns0:AtualizacaoPrecoRequest/AtualizacaoPrecoDetalheList/precoVarejo"/>
                    </ns3:unit_retail>
                    <ns3:effective_date>
                      <xsl:value-of select="/ns0:AtualizacaoPrecoRequest/AtualizacaoPrecoDetalheList/dataInicioVigenciaPreco"/>
                    </ns3:effective_date>
                    <ns3:end_date>
                      <xsl:value-of select="/ns0:AtualizacaoPrecoRequest/AtualizacaoPrecoDetalheList/dataFimVigenciaPreco"/>
                    </ns3:end_date>
                  </ns3:PrcChgDtl>
                </xsl:for-each>
              </ns3:PrcChg>
            </xsl:for-each>
          </ns3:PrcChgDesc>
        </tns:messageData>
        <tns:customFlag>
          <xsl:value-of select='dvm:lookupValue ("oramds:/apps/Extrafarma/Retail/Comum/v1/Resource/ValoresRibMessage.dvm", "id", "021", "customFlag", "" )'/>
        </tns:customFlag>
      </tns:ribMessage>
    </tns:RibMessages>
  </xsl:template>
</xsl:stylesheet>
