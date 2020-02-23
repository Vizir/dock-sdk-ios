//
//  UpdatePasswordRequest.swift
//  Mobile2you
//
//  Created by Leonardo Sugano on 27/02/2019.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation

open class UpdatePasswordRequest: M2YModel {
    open var password, password_confirmation, current_password: String?
}
