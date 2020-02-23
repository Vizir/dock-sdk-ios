//
//  CDTAccountResponse.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation

open class ExtractResponse: M2YModel {
    open var content: [ExtractItemResponse]?
}

open class ExtractItemResponse: M2YModel {
    open var date: String?
    open var hour: String?
    open var value: NSNumber?
    open var _description: String?
    open var codigoMCC: NSNumber?
    open var nomeEstabelecimento: String?
    open var timelineContents: [ExtractItemResponse]?
    open var idTransferencia: String?
    open var refund_status: String?
    open var flagCredito: NSNumber?

    override open func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "_description",keyInResource: "description")]
    }
}

open class MonthsResponse: M2YModel {
   open var months: [String]?
}
