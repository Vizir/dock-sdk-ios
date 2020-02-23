//
//  TransferResponse.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation

open class TransferFavoriteResponse: M2YModel {
    open var id: String?
    open var bank: BankResponse?
    open var agency: String?
    open var bankCode: String?
    open var account: String?
    open var digit: String?
    open var name: String?
    open var cpf: String?
    open var nickname: String?
    open var accountType: String?
    open var color: String?
}
