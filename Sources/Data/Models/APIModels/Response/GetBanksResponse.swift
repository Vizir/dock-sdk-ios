//
//  GetBanksResponse.swift
//  Mobile2you
//
//  Created by Victor Catão on 06/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

open class GetBanksResponse: M2YModel {
    open var favorites: [BankResponse]?
    open var general: [BankResponse]?
}

open class BankResponse: M2YModel {
    open var id: String?
    open var code: String?
    open var name: String?
    open var color: String?
}
