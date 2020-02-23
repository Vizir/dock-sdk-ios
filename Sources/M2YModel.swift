//
//  M2YModel.swift
//  Mobile2you
//
//  Created by Mobile2You on 02/05/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation
import EVReflection

open class M2YModel: EVNetworkingObject {

    override open func skipPropertyValue(_ value: Any, key: String) -> Bool {
        if let value = value as? String, value.count == 0 || value == "null" {
            return true
        } else if let value = value as? NSArray, value.count == 0 {
            return true
        } else if value is NSNull {
            return true
        }
        return false
    }

    open func toEncryptedBody() -> [String: Any] {
        let encryptedString = EncryptModel(encryptJson: self.toJsonString())
        return encryptedString.toDictionary() as! [String : Any]
    }

}
