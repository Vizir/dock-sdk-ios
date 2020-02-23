//
//  LoginRequest.swift
//  Mobile2you
//
//  Created by Mobile2You on 18/12/2017.
//  Copyright © 2017 Mobile2You. All rights reserved.
//

import UIKit
import EVReflection

open class LoginRequest: M2YModel {
    open var cpf: String?
    open var password: String?
    open var issuer: String?
}

open class UpdatePassRequest: M2YModel {
    open var password: String?
    open var password_confirmation: String?
}

open class CheckCpfRequest: M2YModel {
    open var cpf: String?
    open var issuer: String?
}

open class CheckAppPasswordRequest: M2YModel {
    open var password: String?
}

open class RegisterRequest: M2YModel {
    open var name: String?
    open var phone: String?
    open var email: String?
    open var cpf: String?
    open var person_id: String?
    open var password: String?
    open var cardId: String?
    open var cardPwd: String?
    open var issuer: String?
    open var mother_name: String?
}

open class SendSMSRequest: M2YModel {
    open var phone: String?
    open var env: String?
}

open class CheckCodeRequest: M2YModel {
    open var phone: String?
    open var code: String?
    open var cpf: String?
}

open class ResetPasswordRequest: M2YModel {
    open var email: String?
    open var cpf: String?
}

open class AssociateCardRequest: M2YModel {
    open var cpf: String?
    open var cardNumber: String?
    open var cardId: String?
    open var phoneNumber: String?
    open var email: String?
    open var cardPwd: String?
}

open class CreatePersonRequest: M2YModel {
   open var cpf: String?
   open var birth_date: String?
   open var name: String?
   open var street: String?
   open var neighborhood: String?
   open var number: String?
   open var zip: String?
   open var city: String?
   open var state: String?
   open var complement: String?
   open var country: String?
   open var ref: String?
    open var motherName: String?
}
