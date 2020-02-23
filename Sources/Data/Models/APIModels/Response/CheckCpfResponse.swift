//
//  CheckCpfResponse.swift
//  Mobile2you
//
//  Created by Leonardo Sugano on 27/02/2019.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation

open class CheckCpfResponse: M2YModel {
    open var email: String?
    open var phone: PhoneResponse?
    open var first_access: NSNumber?
    open var birth_date: String?
    open var name: String?
    open var nome: String?
    open var account_ids: [AccountIds]?
}
