//
//  ReceiptService.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 12/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation
import Moya
import SwiftKeychainWrapper

enum RechargeService {
    case getFavoriteNumbers
    case addFavorite(request: FavoriteRequest)
    case confirmRecharge(request: TransferPasswordRequest)
    
}

extension RechargeService: TargetType {
    
    var baseURL: URL {
        return URL(string: API_URL)!
    }
    
    var path: String {
        switch self {
        case .getFavoriteNumbers:
            return GET_FAVORITES
        case .addFavorite:
            return ADD_FAVORITE_RECHARGE
        case .confirmRecharge:
            return POST_CONFIRM_RECHARGE
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
        case .getFavoriteNumbers:
            return .requestPlain
        case .addFavorite(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .confirmRecharge(let request):
            return .requestParameters(parameters: request.toEncryptedBody() , encoding: JSONEncoding.default)
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
