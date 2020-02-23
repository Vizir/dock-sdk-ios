//
//  RateResponse.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 03/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

open class RateResponse: M2YModel {
    open var carrierId: NSNumber?
    open var leftoverExemption: NSNumber?
    open var rateValue: NSNumber?
    open var operation: Operation?
    
}

open class Operation: M2YModel {
    open var operationType: NSNumber?
    open var name: String?
    open var _description: String?
    open var rateExemptionQuantity: NSNumber?
    open var exemptionPeriod: NSNumber?
}
