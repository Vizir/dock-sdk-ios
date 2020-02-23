//
//  RegisterTokenRequest.swift
//  Mobile2you
//
//  Created by Bruno Carlos on 09/11/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

open class RegisterTokenRequest: M2YModel {
    open var token: String?
    open var os: String?
    open var device: String?
    open var version: String?
    open var build: String?
}
