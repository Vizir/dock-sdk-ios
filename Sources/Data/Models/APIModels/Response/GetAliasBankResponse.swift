//
//  CardResponse.swift
//  Mobile2you
//
//  Created by Victor Catão on 05/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

open class GetAliasBankResponse: M2YModel {
    open var bankAccountType: String?
    open var bankAccountNumber: String?
    open var bankBranchNumber: String?
    open var createdDate: String?
    open var closedDate: String?
    open var bankAccountStatus: String?
    open var bankAccountDigit: String?
    open var bankBranchDigit: String?
    open var bankNumber: String?
    open var idAccount: NSNumber?
    open var lastUnlockedDate: NSNumber?
}