//
//  PaymentRequest.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 11/10/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

open class PaymentCodeRequest: M2YModel {
    open var barcode: String?
}

open class PaymentRequest: M2YModel {
    open var accountId: Int?
    open var _description: String?
    open var barCodeNumber: String?
    open var dueDate: String?
    open var assignor: String?
    open var discount: NSNumber?
    open var taxValue: NSNumber?
    open var value: String?
    
    
    override open func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "_description",keyInResource: "description")]
    }
    
}
