//
//  CDTBilletRequest.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation

open class BilletRequest: M2YModel {
    open var accountId: Int?
    open var value: String?
    open var expirationDate: String?
    open var cardId: Int?
    open var password: String?
    open var tipoBoleto: Int?
    open var type: Int?
    open var name: String?
    open var cpf: String?
}
