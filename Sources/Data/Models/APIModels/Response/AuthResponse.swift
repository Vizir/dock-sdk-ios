//
//  AuthResponse.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 25/09/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

open class AuthResponse: M2YModel {
    open var access_token: String?
    open var expires_in: NSNumber?
    open var token_type: String?
}
