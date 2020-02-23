//
//  TransactionRequest.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 28/09/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

open class ExtractRequest: M2YModel {
    open var dataInicio: String?
    open var dataFim: String?
    open var id: Int?
    open var page: Int?
    open var flagCredito: Bool?
}
