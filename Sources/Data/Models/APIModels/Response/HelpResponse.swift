//
//  HelpResponse.swift
//  Mobile2you
//
//  Created by Bruno Carlos on 17/10/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

open class HelpResponse: M2YModel {
    open var phone: String?
    open var email: String?
    open var questions: [HelpInformations]?
}

open class HelpInformations: M2YModel {
    open var id: String?
    open var title: String?
    open var message: String?
    open var open: Bool? = false
}
