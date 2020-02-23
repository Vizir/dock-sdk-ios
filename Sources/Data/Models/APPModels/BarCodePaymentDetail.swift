//
//  BarCodePaymentDetail.swift
//  Mobile2you
//
//  Created by Victor Catão on 27/11/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import UIKit

open class BarCodePaymentDetail: M2YModel {
    open var barCode: String?
    open var bank: String?
    open var name: String?
    open var socialReason: String?
    open var cpfOrCNPJ: String?
    open var discount: NSNumber?
    open var interest: NSNumber?
    open var fine: NSNumber?
    open var charges: NSNumber?
    open var expiration: String?
    open var amount: String?
    open var paymentDate: String?
}
