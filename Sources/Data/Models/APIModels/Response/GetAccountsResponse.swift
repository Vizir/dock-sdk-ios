//
//  GetAccountsResponse.swift
//  Mobile2you
//
//  Created by Victor Catão on 05/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

open class GetAccountResponse: M2YModel {
    open var content: [ContaResponse]?
}

open class GetPhonesResponse: M2YModel {
    open var number: NSNumber?
    open var size: NSNumber?
    open var totalPages: NSNumber?
    open var numberOfElements: NSNumber?
    open var totalElements: NSNumber?
    open var firstPage: NSNumber?
    open var hasPreviousPage: NSNumber?
    open var hasNextPage: NSNumber?
    open var content: [PhoneResponse]?
}

open class PhoneResponse: M2YModel {
    open var id: NSNumber?
    open var idTipoTelefone: NSNumber?
    open var idPessoa: NSNumber?
    open var ddd: String?
    open var telefone: String?
    open var ramal: String?
    open var status: NSNumber?
}
