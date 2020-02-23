//
//  P2PTransferResponse.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 12/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

open class P2PTransferResponse: M2YModel {
    open var id: NSNumber?
    open var transactionCode: String?
    open var originalAccount: NSNumber?
    open var destinationAccount: NSNumber?
    open var amount: NSNumber?
    open var date: String?
    open var _description: String?
    open var idAdjustment: NSNumber?
    open var idIssuer: NSNumber?
    open var tpAdjustment: String?
    open var transactionTariffCode: String?
    
    override open func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "_description",keyInResource: "description")]
    }
}
