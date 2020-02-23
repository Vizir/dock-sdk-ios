//
//  CardResponse.swift
//  Mobile2you
//
//  Created by Victor Catão on 05/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

open class GetCardsResponse: M2YModel {
    open var cards: [CardResponse]?
}

open class CardResponse: M2YModel {
    open var id: NSNumber?
    open var isFirstAccess: NSNumber?
    open var flagTitular: NSNumber?
    open var idPessoa: NSNumber?
    open var idConta: NSNumber?
    open var numeroBin: NSNumber?
    open var numeroCartao: String?
    open var cartaoVirtual: NSNumber?
    open var dataEmissao: String?
    open var numberCard: String?
    open var flagVirtual: NSNumber?
    open var idCartao: NSNumber?
    open var idBandeira: NSNumber? //1-visa 2-Mastercard
    open var idTipoCartao: NSNumber?
    open var dataGeracao: String?
    open var dataValidade: String?
    open var nomeOrigemComercial: String?
    open var cpf: String?
    open var expirationDate: String?
    open var cvv: String?
    open var idStatus: NSNumber? // 1 = normal , 2 ou + = bloqueado (pode ser bloqueado, cancelado, cancelado perda, roubo, etc... mas isso nao importa pro app)
}

open class UnlockCardResponse: M2YModel {
    open var id: NSNumber?
    open var flagTitular: NSNumber?
    open var idPessoa: NSNumber?
    open var sequencialCartao: NSNumber?
    open var idConta: NSNumber?
    open var idStatus: NSNumber?
    open var dataStatus: String?
    open var idEstagio: NSNumber?
    open var dataEstagio: String?
    open var numeroBin: NSNumber?
    open var numeroCartao: String?
    open var numeroCartaoHash: NSNumber?
    open var numeroCartaoCriptografado: String?
    open var dataEmissao: String?
    open var dataValidade: String?
    open var cartaoVirtual: NSNumber?
    open var impressaoAvulsa: NSNumber?
    open var dataImpressao: String?
    open var nomeArquivoImpressao: NSNumber?
    open var idProduto: NSNumber?
    open var nomeImpresso: NSNumber?
    open var codigoDesbloqueio: NSNumber?
}

open class ValidateAccountResponse: M2YModel {
    open var card: NSNumber?
}
