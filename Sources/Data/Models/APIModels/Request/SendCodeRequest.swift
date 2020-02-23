//
//  SendCodeRequest.swift
//  Mobile2you
//
//  Created by Leonardo Sugano on 27/02/2019.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation

open class SendCodeRequest: M2YModel {
    open var phone: String?
    open var cpf: String?
    open var issuer: String?
}
