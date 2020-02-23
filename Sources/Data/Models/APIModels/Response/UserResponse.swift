//
//  UserResponse.swift
//  Mobile2you
//
//  Created by Mobile2You on 18/12/2017.
//  Copyright © 2017 Mobile2You. All rights reserved.
//

import UIKit

open class UserResponse: M2YModel {
    open var id: String?
    open var created_at: String?
    open var picture: String?
    open var name: String?
    open var cpf: String?
    open var temp_pass: NSNumber?
    open var account_id: String?
    open var saudation: String?
    open var person_id: String?
    open var card_id: String?
    open var email: String?
    open var document: String?
    open var phone: String?
    open var address: AddressResponse?
    open var mailing_address: AddressResponse?
    open var birth_date: String?
    open var activated: NSNumber?
    open var step: String?
    open var re: String?
    open var urls: URLResponse?
    open var token: String?
    open var userId: String?
    open var sessionToken: String?
    open var sessionExp: NSNumber?
    open var persons: [CaradhrasPerson]?
    open var accounts: [AccountItem]?
    open var mother_name: String?
    //    open var blocked: NSNumber?
}

open class AccountItem: M2YModel {
    open var id: NSNumber?
    open var idProduto: NSNumber?
    open var idOrigemComercial: NSNumber?
    open var idPessoa: NSNumber?
    open var idStatusConta: NSNumber?
    open var diaVencimento: NSNumber?
    open var melhorDiaCompra: NSNumber?
    open var dataStatusConta: String?
    open var dataCadastro: String?
    open var dataUltimaAlteracaoVencimento: String?
    open var valorRenda: NSNumber?
    open var idProposta: NSNumber?
    open var funcaoAtiva: String?
}

open class CaradhrasPerson: M2YModel {
    open var id: NSNumber?
    open var nome: String?
    open var tipo: String?
    open var cpf: String?
    open var cnpj: String?
    open var dataNascimento: String?
    open var sexo: String?
    open var numeroIdentidade: String?
    open var orgaoExpedidorIdentidade: String?
    open var unidadeFederativaIdentidade: String?
    open var dataEmissaoIdentidade: String?    
}

open class AddressResponse: M2YModel {
    open var id: String?
    open var address_id: String?
    open var street: String?
    open var neighborhood: String?
    open var number: String?
    open var zip: String?
    open var city: String?
    open var state: String?
    open var country: String?
    open var ref: String?
    open var complement: String?
    open var is_mailing: NSNumber?
}

open class CepResponse: M2YModel {
    open var cep: String?
    open var endereco: String?
    open var bairro: String?
    open var cidade: String?
    open var uf: String?
}

open class CheckAccountResponse: M2YModel {
    
}

open class URLResponse: M2YModel {
    open var about: String?
    open var terms: String?
    open var policy: String?
}

open class CheckCdtUserResponse: M2YModel {
    open var hasPersonId: NSNumber?
    open var hasAccountId: NSNumber?
    open var hasCardId: NSNumber?
    open var hasPendingCards: NSNumber?
    open var cpfResponse: CheckCpfResponse?
    open var session: String?
}

open class AssociateCardResponse: M2YModel {
    open var id: String?
    open var name: String?
    open var picture: String?
    open var email: String?
    open var cpf: String?
    open var phone: String?
    open var cardId: String?
}
