xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.oracle.com/retail/integration/rib/RibMessages";
(:: import schema at "oramds:/apps/Extrafarma/Retail/PedidoCompraFornecedor/v1/Schemas/RibMessages.xsd" ::)
declare namespace ns2="http://TargetNamespace.com/envioPedidoFornecedor";
(:: import schema at "../Schemas/enviarPedidoFornecedor.xsd" ::)

import module namespace cf = "http://extrafarma.br/xq" at "CustomFunctions.xqy";

declare variable $envioPedido as element() (:: schema-element(ns1:RibMessages) ::) external;

declare function local:func($envioPedido as element() (:: schema-element(ns1:RibMessages) ::)) 
                            as element() (:: schema-element(ns2:Root-Element) ::) {
    <ns2:Root-Element>
        <Prepedido>
            <Linha00>
               <TipoRegistro>{xs:string('00')}</TipoRegistro>
               <IdentificacacaoArquivo>{fn:concat(fn:day-from-dateTime(fn:current-dateTime()), fn:month-from-dateTime(fn:current-dateTime()), $envioPedido/ns1:ribMessage/ns1:messageData/*:PODesc/*:order_no)}</IdentificacacaoArquivo>
               <IdentificacaoCxPostalRem></IdentificacaoCxPostalRem>
               <IdentificacaoCxPostalDes>{string($envioPedido/ns1:ribMessage/ns1:messageData/*:PODesc/*:supplier)}</IdentificacaoCxPostalDes>
               <Filter></Filter>
               <Filler2></Filler2>
            </Linha00>
            <Linha01>
               <TipoRegistro>{xs:string('01')}</TipoRegistro>
               <NumPedidoCompra>{$envioPedido/ns1:ribMessage/ns1:messageData/*:PODesc/*:order_no}</NumPedidoCompra>
               <DataEntrega>{$envioPedido/ns1:ribMessage/ns1:messageData/*:PODesc/*:earliest_ship_date}</DataEntrega>
               <DataEntregaTarde>{$envioPedido/ns1:ribMessage/ns1:messageData/*:PODesc/*:not_after_date}</DataEntregaTarde>
               <DataEntregaCedo>{$envioPedido/ns1:ribMessage/ns1:messageData/*:PODesc/*:not_before_date}</DataEntregaCedo>
               <DataEmissao>{$envioPedido/ns1:ribMessage/ns1:messageData/*:PODesc/*:close_date}</DataEmissao>
               <TipoPedido> </TipoPedido>
               <NumeroListaPrecos> </NumeroListaPrecos>
               <EanCliente></EanCliente>
               <NumeroEanLocalEntrega>{$envioPedido/ns1:ribMessage/ns1:messageData/*:PODesc/*:PODtl/*:POVirtualDtl/*:location}</NumeroEanLocalEntrega>
               <RazaoSocialLocalEntrega>{$envioPedido/ns1:ribMessage/ns1:messageData/*:PODesc/*:fob_trans_res_desc}</RazaoSocialLocalEntrega>
               <LogradouroLocalEntrega></LogradouroLocalEntrega>
               <BairroDistritoLocal>{cf:padValuesLeft(' ', 33, ' ')}</BairroDistritoLocal>
               <MunicipioLocalEntrega></MunicipioLocalEntrega>
               <UfLocalEntrega>{cf:padValuesLeft(' ', 13, ' ')}</UfLocalEntrega>
             <!--  <CepLocalEntrega>{dvmtr:lookup('../DVM/CNPJFornecedor.dvm','CHAVE','CNPJ','001112222000144','ERROR')} </CepLocalEntrega>
               <CnpjLocalEntrega>{dvmtr:lookup('../DVM/CNPJFornecedor.dvm','CHAVE','CNPJ','001112222000144','ERROR')} </CnpjLocalEntrega> -->
               <InscricaoEstadualEntrega>{cf:padValuesLeft('0', 28, '0')}</InscricaoEstadualEntrega>
               <EanFaturamento>{xs:string('001')}</EanFaturamento>
               <CnpjDestinatatrio>{cf:padValuesLeft(' ', 25, ' ')}</CnpjDestinatatrio>
               <CnpjFornecedor>{xs:string('220')}</CnpjFornecedor>
               <CondicaoEntrega>{$envioPedido/ns1:ribMessage/ns1:messageData/*:PODesc/*:purchase_type}</CondicaoEntrega>
               
               
               <QtdeDesconto></QtdeDesconto>
               <ValorEncargos></ValorEncargos>
               <TipoUsoMercadoria></TipoUsoMercadoria>
               <NumeroContrato></NumeroContrato>
               <TipoPedido></TipoPedido>
               <Filter3></Filter3>
               <Filter4></Filter4>
           
               
            </Linha01>

            <Linha02>
                <TipoRegistro>{xs:string('02')}</TipoRegistro>
                <NumParcelas>{xs:string('015')}</NumParcelas>
                <EventoReferencia>{cf:padValuesLeft(' ', 7, ' ')}</EventoReferencia>
                <ReferenciaTempo>{cf:padValuesLeft('0', 13, '0')}</ReferenciaTempo>
                <NumeroDias>{cf:padValuesLeft(' ', 427, ' ')}</NumeroDias>
                <PercPagamentoFat>{cf:padValuesLeft(' ', 427, ' ')}</PercPagamentoFat>                
                
            </Linha02>

            {
                for $Itens in $envioPedido/ns1:ribMessage/ns1:messageData/*:PODesc/*:PODtl
                return 
                <Linha03>
                   <TipoRegistro>{xs:string('03')}</TipoRegistro>
                   <NumeroLinhaItem></NumeroLinhaItem>
                   <CodigoBarraItem>{$Itens/*:item}</CodigoBarraItem>
                   <TipoCodigoItem>{xs:string('EN')}</TipoCodigoItem>
                   <QuantidadeItem>{$Itens/*:POVirtualDtl/*:qty_ordered}</QuantidadeItem>
                   <UnidadeMedida>{xs:string('UN')}</UnidadeMedida>
                   <TipoPedidoItem></TipoPedidoItem>
                   <PrecoUnitario>{$Itens/*:unit_cost}</PrecoUnitario>
                   <BasePreco>{cf:padValuesLeft(' ', 3, ' ')}</BasePreco>
                   <UnidadeMedida></UnidadeMedida>
                   <Desconto>{cf:padValuesLeft(' ', 3, ' ')}</Desconto>
                   <TipoUsoMercadoria></TipoUsoMercadoria>
                   <Filter></Filter>
                   
                   
                   
                </Linha03>
            }          
        </Prepedido>
    </ns2:Root-Element>
};

local:func($envioPedido)