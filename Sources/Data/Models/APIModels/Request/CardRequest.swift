//
//  CardRequest.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation

open class UnlockCardRequest: M2YModel {
    open var cardId: String?
}

open class BlockCardRequest: M2YModel {
    open var cardId: NSNumber?
//    open var statusId: NSNumber?
//    open var note: String?
}

open class PasswordCardRequest: M2YModel {
    open var cardId: String?
    open var password: String?
}

open class ActivateCardRequest: M2YModel {
   open var cardId: NSNumber?
   open var cardNumber: String?
   open var cpf: String?
   open var password: String?
}

open class CancelCardRequest: M2YModel {
    open var cardId: String?
}
