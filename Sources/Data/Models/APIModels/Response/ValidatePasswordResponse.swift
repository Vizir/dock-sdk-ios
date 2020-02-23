//
//  ValidatePasswordResponse.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 06/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

open class ValidatePasswordResponse: M2YModel {
    open var mensagem: String?
    open var idStatusCartao: NSNumber?
    open var statusCartao: String?
    open var quantidadeTentativas: NSNumber?
    open var quantidadeMaximaTentativas: NSNumber?
}
