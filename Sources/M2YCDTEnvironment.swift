//
//  M2YCDTEnvironment.swift
//  Mobile2you
//
//  Created by Mobile2You on 02/05/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation
import EVReflection

open class M2YCDTEnvironment {

    public static let shared = M2YCDTEnvironment()
    public var isDebug = false
    public var loginViewController: UIViewController?

    private init(){
    }

    open func config(apiURL: String,
                     apiToken: String,
                     encryptationKey: String,
                     encryptationIV: String,
                     loginViewController: UIViewController,
                     isDebug: Bool,
                     bundleIdentifier: String,
                     productID: String,
                     buildNumber: String,
                     versionNumber: String,
                     appName: String) {
        
        API_URL = apiURL
        API_TOKEN = apiToken
        ENCRYPTION_KEY = encryptationKey
        ENCRYPTION_IV = encryptationIV
        PRODUCT_ID = productID
        BUILD_NUMBER = buildNumber
        APP_NAME = appName
        VERSION_NUMBER = versionNumber
        
        self.loginViewController = loginViewController
        self.isDebug = isDebug
        EVReflection.setBundleIdentifiers(["DOCKSDK", bundleIdentifier])
    }

}
