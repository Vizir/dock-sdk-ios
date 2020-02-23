//
//  CDTRechargeResponse.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation

open class CreateRechargeResponse: M2YModel {
    open var orderId: String?
    open var options: [OptionRechageResponse]?
}

open class OptionRechageResponse: M2YModel {
    open var code: String?
    open var _description: String?
    open var ammount_ranges: [Int]?
    open var fixed_amounts: [FixedAmmountResponse]?
    
    override open func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "_description",keyInResource: "description")]
    }
}

open class FixedAmmountResponse: M2YModel {
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
