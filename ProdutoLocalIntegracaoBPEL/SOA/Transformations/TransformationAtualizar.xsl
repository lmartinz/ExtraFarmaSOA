<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:ns0="http://www.oracle.com/retail/integration/rib/RibMessages" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:tns="http://TargetNamespace.com/nxsdschema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:Q3="http://canonico.ultra.com.br/LegadoFault/v1" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:Q2="http://service.ultra.com.br/infcorp/LogIntegration/v1"
                xmlns:ns1="http://service.ultra.com.br/dadosFundacao/ProdutoLocal/v1"
                xmlns:Q4="http://canonico.ultra.com.br/LegadoOutput/v1"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:nxsd="http://xmlns.oracle.com/pcbpel/nxsd"
                xmlns:ns2="http://www.oracle.com/retail/integration/base/bo/ItemLocDesc/v1">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="oramds:/apps/Extrafarma/Retail/CadastroProduto/v1/WSDLs/CadastroProdutoV1.wsdl"/>
            <oracle-xsl-mapper:rootElement name="RibMessages" namespace="http://www.oracle.com/retail/integration/rib/RibMessages"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/produto.xsd"/>
            <oracle-xsl-mapper:rootElement name="Root-Element" namespace="http://TargetNamespace.com/nxsdschema"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [SAT JUL 29 21:42:49 BRT 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:Root-Element>
         <tns:codigoProduto>
            <xsl:value-of select="/ns0:RibMessages/ns0:ribMessage/ns0:messageData/ns2:ItemLocDesc/ns2:item"/>
         </tns:codigoProduto>
         <xsl:for-each select="/ns0:RibMessages/ns0:ribMessage/ns0:messageData/ns2:ItemLocDesc/ns2:ItemLocPhys">
            <tns:LocalList>
               <tns:codigoFilial>
                  <xsl:value-of select="ns2:physical_loc"/>
               </tns:codigoFilial>
               <tns:tipoLocal>
                  <xsl:value-of select="ns2:loc_type"/>
               </tns:tipoLocal>
               <tns:atualizaEstoque>
                  <xsl:value-of select="ns2:stockholding_ind"/>
               </tns:atualizaEstoque>
               <tns:permiteVolucao>
                  <xsl:value-of select="ns2:returnable_ind"/>
               </tns:permiteVolucao>
               <xsl:for-each select="ns2:ItemLocVirt">
                  <tns:ItemLocalVirtualList>
                     <tns:codigoFilial>
                        <xsl:value-of select="ns2:loc"/>
                     </tns:codigoFilial>
                     <tns:tipoLocal>
                        <xsl:value-of select="ns2:loc_type"/>
                     </tns:tipoLocal>
                     <tns:descricaoitemLocal>
                        <xsl:value-of select="ns2:local_item_desc"/>
                     </tns:descricaoitemLocal>
                     <tns:statusProduto>
                        <xsl:value-of select="ns2:status"/>
                     </tns:statusProduto>
                     <tns:indicadorTaxavel>
                        <xsl:value-of select="ns2:taxable_ind"/>
                     </tns:indicadorTaxavel>
                  </tns:ItemLocalVirtualList>
               </xsl:for-each>
               <xsl:for-each select="ns2:ItemLocVirtRepl">
                  <tns:ItemLocalVirtualReposicaoList>
                     <tns:codigoFilial>
                        <xsl:value-of select="ns2:loc"/>
                     </tns:codigoFilial>
                     <tns:tipoLocal>
                        <xsl:value-of select="ns2:loc_type"/>
                     </tns:tipoLocal>
                     <tns:multiploReabastecimento>
                        <xsl:value-of select="ns2:multiple_runs_per_day_ind"/>
                     </tns:multiploReabastecimento>
                  </tns:ItemLocalVirtualReposicaoList>
               </xsl:for-each>
            </tns:LocalList>
         </xsl:for-each>
      </tns:Root-Element>
   </xsl:template>
</xsl:stylesheet>
