//
//  CDTPaymentService.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import Moya
import SwiftKeychainWrapper

enum CDTPaymentService {
    case pay(request: TransferPasswordRequest)
    case validate(request: ValidateBarcodeRequest)
    case getPaymentList(request: AccountIdRequest)
    case getPaymentAdjustment(request: IdRequest)
    case getNewPaymentList(request: AccountIdRequest)
}

extension CDTPaymentService: TargetType {
    
    var baseURL: URL {
        return URL(string: API_URL)!
    }
    
    var path: String {
        switch self {
        case .pay:
            return POST_PAYMENT
        case .validate:
            return GET_VALIDATE
        case .getPaymentList:
            return GET_PAYMENT_LIST
        case .getPaymentAdjustment:
            return GET_PAYMENT_ADJUSTMENT
        case .getNewPaymentList:
            return GET_NEW_PAYMENT_LIST
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
        case .pay(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .validate(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .getPaymentList(let request), .getNewPaymentList(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .getPaymentAdjustment(let request):
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
