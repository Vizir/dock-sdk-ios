//
//  EncryptModel.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 01/03/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation

open class EncryptModel: M2YModel {
    open var data: String?

    convenience init(encryptJson: String) {
        self.init()
        self.data = AESCrypt.encrypt(encryptJson)
    }


}
