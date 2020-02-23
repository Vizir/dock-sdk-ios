//
//  RechargeRequest.swift
//  Mobile2you
//
//  Created by Lucas Soares on 14/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

open class RechargeRequest: M2YModel {
    open var accountId: Int?
    open var ddd: String?
    open var phoneNumber: String?
    open var dealerCode: String?
    open var amount: Int?
    open var amountKey: Int?
    open var orderId: String?
    open var dealerName: String?
    open var contactName: String?
}

open class FavoriteRequest: M2YModel {
    open var phone: String?
    open var ddd: String?
    open var mobile_carrier: String?
    open var nickname: String?
    open var dealer: String?
}
