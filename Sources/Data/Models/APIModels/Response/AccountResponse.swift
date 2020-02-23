//
//  AccountResponse.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation

open class AccountIdsResponse: M2YModel {
    open var content: [AccountIds]?
}

open class AccountIds : M2YModel {
    open var id: String?
    open var victorcatao: String?
}

open class AccountResponse: M2YModel {
    open var peopleId: NSNumber?
    open var saldo: String?
    open var cards: [CardResponse]?
    open var idConta: NSNumber?
    open var numeroBin: NSNumber?
    open var numeroCartao: String?
    open var cartaoVirtual: NSNumber?
    open var dataEmissao: String?
    open var idStatusCartao: NSNumber?
    open var sessionToken: String?
}

open class TermsAndPoliticsResponse: M2YModel {
    open var terms_url: String?
    open var politics_url: String?
}
