//
//  RechargeResponse.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 13/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

open class RechargeReceiptResponse: M2YModel {
    open var number: NSNumber?
    open var totalPages: NSNumber?
    open var numberOfElements: NSNumber?
    open var totalElements: NSNumber?
    open var hasPreviousPage: NSNumber?
    open var hasNextPage: NSNumber?
    open var hasContent: NSNumber?
    open var first: NSNumber?
    open var last: NSNumber?
    open var nextPage: NSNumber?
    open var previousPage: NSNumber?
    open var content: [RechargeContent]?
}

open class RechargeContent: M2YModel {
    open var orderid: String?
    open var nit: String?
    open var ddd: String?
    open var phoneNumber: String?
    open var dealerCode: String?
    open var amount: NSNumber?
    open var amountkey: NSNumber?
    open var createDate: String?
    open var esitefstatus: String?
    open var merchantusn: String?
    open var esitefusn: String?
    open var authorizationconfirmationdata: String?
    open var authorizationauthorizerdate: String?
    open var authorizationauthorizertime: String?
    open var authorizationsitefusn: String?
    open var merchantreceipt: String?
}

open class RechargeAdjustmentResponse: M2YModel {
    open var accountId: NSNumber?
    open var amount: NSNumber?
    open var nickname: String?
    open var amountKey: NSNumber?
    open var ddd: String?
    open var dealerCode: String?
    open var dealerName: String?
    open var id: NSNumber?
    open var idAdjustment: NSNumber?
    open var orderId: String?
    open var phoneNumber: String?
    open var rechargeDate: String?
    open var transactionCode: String?

    public convenience init(rechargeRequest: RechargeRequest) {
        self.init()
        self.orderId = rechargeRequest.orderId
        self.ddd = rechargeRequest.ddd
        self.phoneNumber = rechargeRequest.phoneNumber
        self.dealerCode = rechargeRequest.dealerCode
        self.dealerName = rechargeRequest.dealerName
        self.amountKey = rechargeRequest.amountKey as NSNumber?
        self.amount = rechargeRequest.amount as NSNumber?
        self.transactionCode = rechargeRequest.orderId
    }
}

open class FixedAmounts: M2YModel {
    open var message: String?
    open var amount_key: String?
    open var bonus_in_percentage: String?
    open var bonus: String?
    open var payment_amount: String?
    open var bonus_category: String?
    open var expiry_date: String?
    open var bonus_expiry_date: String?
    open var amount: String?
}

open class PostRechargeOptions: M2YModel {
    open var code: String?
    open var _description: String?
    open var amount_ranges: [String]?
    open var fixed_amounts: [FixedAmounts]?

    override open func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "_description",keyInResource: "description")]
    }
}

open class RechargeResponse: M2YModel {
    open var orderId: String?
    open var options: [PostRechargeOptions]?
}

open class ConfirmRechargeResponse: M2YModel {
    open var message: String?
    open var customerReceipt: String?
    open var merchantReceipt: String?
}

open class FavoriteNumbersResponse: M2YModel {
    open var id: String?
    open var ddd: String?
    open var phone: String?
    open var mobile_carrier: String?
    open var nickname: String?
    open var dealer: String?
    open var color: String?
}
