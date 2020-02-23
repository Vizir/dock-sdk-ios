//
//  RechargeSpTransModel.swift
//  Mobile2you
//
//  Created by Diego Gomes on 30/05/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import DOCKSDK


open class TransportCardNumberRequest: M2YModel {
    open var cardNumber: NSNumber?
    open var name: String?
}

open class TransportValuesResponse: M2YModel {
    open var maxValue: NSNumber?
    open var minValue: NSNumber?
    open var creditType: NSNumber?
    open var productCode: NSNumber?
    open var _description: String?
    open var unitaryValue: NSNumber?
    override open func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "_description",keyInResource: "description")]
    }
}

open class MakeTransportRechargeRequest: M2YModel {
    open var accountId: NSNumber?
    open var cardNumber: NSNumber?
    open var creditType: NSNumber?
    open var productCode: NSNumber?
    open var value: NSNumber?
    open var amount: NSNumber?
    open var cardId: NSNumber?
    open var password: String?
}

open class MakeTransportRechargeResponse: M2YModel {
    open var productCode: NSNumber?
    open var orderNumber: String?
    open var status: String?
    open var value: NSNumber?
    open var amount: NSNumber?
    open var date: String?
    open var cardNumber: NSNumber?
    open var transactionCode: String?

    public convenience init(spTransResponse: SPTransRechargeResponse) {
        self.init()
        self.productCode = spTransResponse.productCode
        self.orderNumber = spTransResponse.id?.stringValue
        self.value = spTransResponse.value
        self.amount = spTransResponse.amount
        self.date = spTransResponse.date
        self.cardNumber = spTransResponse.cardNumber
        self.transactionCode = spTransResponse.transactionCode
    }
}

open class FavoriteTransportRechargeResponse: M2YModel {
    open var id: String?
    open var name: String?
    open var cardNumber: NSNumber?
    open var color: String?
}

open class SPTransRechargeList: M2YModel {
    open var recharges: [SPTransRechargeResponse]?
}

open class SPTransRechargeResponse: M2YModel {
    open var id: NSNumber?
    open var idDablam: String?
    open var accountId: NSNumber?
    open var idIssuer: NSNumber?
    open var cardNumber: NSNumber?
    open var creditType: NSNumber?
    open var productCode: NSNumber?
    open var value: NSNumber?
    open var amount: NSNumber?
    open var transactionCode: String?
    open var date: String?
}
