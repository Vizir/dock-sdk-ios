//
//  Receipt.swift
//  Mobile2you
//
//  Created by Leonardo Tomioka on 28/09/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation
import EVReflection

open class ReceiptModel: M2YModel {
    open var origemNome: String?
    open var origemCpf: String?
    open var data: String?
    open var destinoNome: String?
    open var destinoCpf: String?
    open var valor: NSNumber?
    open var authNumero: String?
    open var desc: String?
    
    convenience init(response: ReceiptResponse) {
        self.init()
        self.data = response.date
        self.authNumero = response.transactionCode
        self.valor = response.amount
        self.desc = response._description
        self.data = response.transactionDate
    }
}

open class ReceiptResponse: M2YModel {
    open var id: NSNumber?
    open var transactionCode: String?
    open var originalAccount: NSNumber?
    open var destinationAccount: NSNumber?
    open var amount: NSNumber?
    open var date: String?
    open var transactionDate: String?
    open var _description: String?
    
    override open func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "_description",keyInResource: "description")]
    }
}
