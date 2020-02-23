//
//  ErrorResponse.swift
//  M2Y
//
//  Created by Marina Bearzi on 13/03/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

open class DetailError: M2YModel {
    open var Detail: String?
}

open class ErrorResponse: M2YModel {
    open var message: String?
    open var mensagem: String?
    open var status: NSNumber?
    open var error: String?
    open var code: NSNumber?
    open var exception: String?
    open var path: String?
    open var errors: [DetailError]?
    open var messageFromCustomAuthorizer: String?
    open var messageFromAPIGateway: String?
}

open class LoginErrorResponse: M2YModel {
    open var message: String?
    open var highlight: String?
}

open class ConductorErrorResponse: M2YModel {
    open var message: String?
    open var status: NSNumber?
    open var error: String?
}

open class ConductorBalanceError: M2YModel {
    open var motivo: String?
}

open class ConductorError: M2YModel {
    open var mensagem: String?
    open var idStatusCartao: NSNumber?
    open var statusCartao: String?
    open var quantidadeTentativas: NSNumber?
    open var quantidadeMaximaTentativas: NSNumber?
}
