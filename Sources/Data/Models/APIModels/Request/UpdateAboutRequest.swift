//
//  UpdateAboutRequest.swift
//  Mobile2you
//
//  Created by Mobile2You on 20/12/2017.
//  Copyright © 2017 Mobile2You. All rights reserved.
//

import UIKit
import EVReflection

open class UpdateAboutRequest: M2YModel {
    
    open var id: String?
    open var name: String?
    open var email: String?
    open var birthday: String?
    open var phone: String?
    open var gender: NSNumber?
    open var acceptNews: NSNumber?
    open var picture: String?
    open var hotel: String?
    open var hotelAddress: String?
    open var checkin: String?
    open var checkout: String?
    open var language: String?
    
}

open class EmailRequest: M2YModel {
    open var email: String?
}

open class PhoneRequest: M2YModel {
    open var phone: String?
}

open class SendTransactionCodeRequest: M2YModel {
    open var phone: String?
    open var userID: String?
    open var personID: String?
}

open class CodeRequest: M2YModel {
    open var code: String?
}

open class AddressRequest: M2YModel {
    open var address_id: String?
    open var street: String?
    open var neighborhood: String?
    open var number: String?
    open var zip: String?
    open var city: String?
    open var state: String?
    open var country: String?
    open var complement: String?
    open var is_mailing: Bool?
    open var ref: String?
}

open class CepRequest: M2YModel {
    open var CEP: String?
}



