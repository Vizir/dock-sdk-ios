//
//  DealersResponse.swift
//  Mobile2you
//
//  Created by Lucas Soares on 14/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

open class Dealers: M2YModel {
    open var name: String?
    open var code: String?
}

open class DealersResponse: M2YModel {
    open var dealers: [Dealers]?
}
