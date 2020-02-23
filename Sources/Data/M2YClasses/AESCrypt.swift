//
//  AESCrypt.swift
//  Mobile2you
//
//  Created by Victor Catão on 27/03/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import CryptoSwift

class AESCrypt {
    static func encrypt(_ message: String) -> String? {
        return message
//        do {
//            guard let data = message.data(using: String.Encoding.utf8) else { return nil }
//            let enc = try AES(key: ENCRYPTION_KEY, iv: ENCRYPTION_IV, padding: .pkcs7).encrypt(data.bytes)
//            let encData = Data(bytes: enc, count: enc.count)
//            let base64String: String = encData.base64EncodedString()
//            let result = String(base64String)
//            return result
//        } catch {
//            return nil
//        }
    }

    static func decrypt(_ base64EncodedString: String) -> String? {
        return base64EncodedString
//        do {
//            guard let data = Data(base64Encoded: base64EncodedString, options: NSData.Base64DecodingOptions(rawValue: 0)) else { return nil }
//            let dec = try AES(key: ENCRYPTION_KEY, iv: ENCRYPTION_IV, padding: .pkcs7).decrypt(data.bytes)
//            let decData = Data(bytes: dec, count: dec.count)
//            guard let result = NSString(data: decData, encoding: String.Encoding.utf8.rawValue) else { return nil }
//            return String(result)
//        } catch {
//           return nil
//        }
    }

}
