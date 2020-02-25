//
//  CDTAccountService.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import Moya
import SwiftKeychainWrapper

enum CDTAccountService {
   case getAccounts
   case getTransactions(request: ExtractRequest)
   case getAvaliableMonths(request: AccountIdRequest)
   case createVirtualCard(request: AccountIdRequest)
}

extension CDTAccountService: TargetType {
   var baseURL: URL {
       return URL(string: API_URL)!
   }

   var path: String {
       switch self {
       case .getAccounts:
           return GET_CDT_ACCOUNTS
       case .getTransactions:
           return GET_CDT_TRANSACTIONS
       case .getAvaliableMonths:
           return ACCOUNT_GET_MONTHS
       case .createVirtualCard:
           return CREATE_CDT_VIRTUAL_CARD
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
       case .getTransactions(let request):
           return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
       case .getAvaliableMonths(let request):
           return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
       case .getAccounts:
           return .requestPlain
       case .createVirtualCard(let request):
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
            "X-VizirBankAppPlatform": "ios",
            "X-VizirBankCorrelationId": UUID().uuidString]

   }
}
