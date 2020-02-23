//
//  ContaResponse.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 26/09/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

open class ContaResponse: M2YModel {
    open var id: NSNumber?
    open var idPessoa: NSNumber?
    open var nome: String?
    open var idProduto: NSNumber?
    open var idOrigemComercial: NSNumber?
    open var nomeOrigemComercial: String?
    open var idFantasiaBasica: NSNumber?
    open var nomeFantasiaBasica: String?
    open var idStatusConta: NSNumber?
    open var statusConta: String?
    open var diaVencimento: NSNumber?
    open var melhorDiaCompra: NSNumber?
    open var dataStatusConta: String? //2013-02-08T12:53:00.000Z
    open var dataCadastro: String?
    open var dataUltimaAlteracaoVencimento: String?
    open var dataHoraUltimaCompra: String?
    open var numeroAgencia: NSNumber?
    open var numeroContaCorrente: NSNumber?
    open var valorRenda: NSNumber?
    open var formaEnvioFatura: String?
    open var titular: NSNumber?
    open var limiteGlobal: NSNumber?
    open var limiteSaqueGlobal: NSNumber?
    open var saldoDisponivelGlobal: NSNumber?
    open var saldoDisponivelSaque: NSNumber?
    open var diasAtraso: NSNumber?
    open var proximoVencimentoPadrao: String?
    open var idProposta: NSNumber?
    open var quantidadePagamentos: NSNumber?
    open var correspondencia: NSNumber?
    open var dataInicioAtraso: String?
    open var rotativoPagaJuros: NSNumber?
    open var totalPosProx: NSNumber?
    open var saldoAtualFinal: NSNumber?
    open var saldoExtratoAnterior: NSNumber?
}

open class TimelineResponse: M2YModel {
    open var number: NSNumber?
    open var size: NSNumber?
    open var totalPages: NSNumber?
    open var numberOfElements: NSNumber?
    open var totalElements: NSNumber?
    open var firstPage: NSNumber?
    open var hasPreviousPage: NSNumber?
    open var hasNextPage: NSNumber?
    open var hasContent: NSNumber?
    open var first: NSNumber?
    open var last: NSNumber?
    open var nextPage: NSNumber?
    open var previousPage: NSNumber?
    open var content: [TimelineContent]?
}

open class TimelineContent: M2YModel {
    open var idTipoTransacaoNaoProcessada: NSNumber?
    open var descricaoTipoTransacaoNaoProcessada: String?
    open var descricaoAbreviada: String?
    open var idConta: NSNumber?
    open var idEventoAjuste: NSNumber?
    open var cartaoMascarado: String?
    open var nomePortador: String?
    open var dataOrigem: String?
    open var dataFaturamento: String?
    open var dataVencimentoReal: String?
    open var modoEntradaTransacao: String?
    open var taxaEmbarque: NSNumber?
    open var valorEntrada: NSNumber?
    open var valorBRL: NSNumber?
    open var valorUSD: NSNumber?
    open var cotacaoUSD: NSNumber?
    open var dataCotacaoUSD: String? //2018-09-19T20:27:00.000Z
    open var formatedDate: Date? // yyyy-MM-dd
    open var codigoMoedaOrigem: String?
    open var codigoMoedaDestino: String?
    open var codigoAutorizacao: String?
    open var codigoReferencia: String?
    open var codigoTerminal: String?
    open var codigoMCC: NSNumber?
    open var grupoMCC: NSNumber?
    open var grupoDescricaoMCC: String?
    open var idEstabelecimento: NSNumber?
    open var nomeEstabelecimento: String?
    open var nomeFantasiaEstabelecimento: String?
    open var localidadeEstabelecimento: String?
    open var plano: String?
    open var parcela: NSNumber?
    open var flagCredito: NSNumber?
    open var flagFaturado: NSNumber?
    open var idTransacaoEstorno: NSNumber?
    open var status: NSNumber?
    open var idTransferencia: String?
}

open class TimelineList {
    open var date: String? // yyyy-MM-dd
    open var formatedDate: Date?
    open var timelinesContents: [TimelineContent]?
}

open class TransferTedResponse: M2YModel {
    open var idContaOrigem: NSNumber?
    open var identificador: NSNumber?
    open var valor: String?
    open var favorecido: FavorecidoResponse?
    open var date: String?
    open var transactionCode: String?
}

open class FavorecidoResponse: M2YModel {
    open var tipo: String?
    open var numeroCpfCnpj: NSNumber?
    open var nome: String?
    open var banco: NSNumber?
    open var agencia: NSNumber?
    open var digitoAgencia: String?
    open var conta: NSNumber?
    open var digitoConta: String?
}

open class TokenResponse: M2YModel {
    open var token: String?
}
