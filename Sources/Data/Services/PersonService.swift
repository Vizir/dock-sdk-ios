//
//  PersonService.swift
//  Mobile2you
//
//  Created by Lucas Soares on 21/01/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import Moya
import SwiftKeychainWrapper

enum PersonService {
    case getPerson(request: AccountIdRequest)
}

extension PersonService: TargetType {
    
    var baseURL: URL {
        return URL(string: API_URL)!
    }
    
    var path: String {
        switch self {
        case .getPerson:
            return GET_PERSON
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return "Half measures are as bad as nothing at all.".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .getPerson(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        if let userData = KeychainWrapper.standard.data(forKey: KEY_USER_OBJECT) {
            let user = UserResponse(data: userData)
            SESSION_TOKEN = user.sessionToken ?? ""
        }
        
        return ["Content-type": "application/json",
                "Application": API_TOKEN,
                "authorization": SESSION_TOKEN,
                 "product": PRODUCT_ID,
                "Oamolas": "Oamolas",
                "X-VizirBankAppBuildNumber": BUILD_NUMBER,
                "X-VizirBankAppVersion": VERSION_NUMBER,
                "X-VizirBankAppName": APP_NAME,
                "X-VizirBankAppPlatform": "ios"]

    }
}
