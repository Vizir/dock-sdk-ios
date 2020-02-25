//
//  TransportRechargeService.swift
//  Mobile2you
//
//  Created by Diego Gomes on 30/05/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import DOCKSDK
import Moya
import SwiftKeychainWrapper

enum TransportRechargeService {
    case getProducts(request: TransportCardNumberRequest)
    case recharge(request: TransferPasswordRequest)
    case getFavorites
    case favoriteSpTransCard(request: TransportCardNumberRequest)
    case getRecharges(request: AccountIdRequest)
}

extension TransportRechargeService: TargetType {
    var baseURL: URL {
        return URL(string: API_URL)!
    }
    
    var path: String {
        switch self {
        case .getProducts:
            return GET_PRODUCTS
        case .recharge:
            return RECHARGE_SPTRANS
        case .getFavorites:
            return GET_SPTRANS_FAVORITES
        case .favoriteSpTransCard:
            return FAVORITE_SPTRANS
        case .getRecharges:
            return GET_SPTRANS_RECHARGES
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getProducts, .recharge, .getFavorites, .favoriteSpTransCard, .getRecharges:
            return .post
        }
    }
    
    var sampleData: Data {
        return "Half measures are as bad as nothing at all.".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .getFavorites:
            return .requestPlain
        case .getProducts(let request):
            return .requestParameters(parameters: request.toDictionary() as! [String : Any], encoding: JSONEncoding.default)
        case .recharge(let request):
            return .requestParameters(parameters: request.toDictionary() as! [String : Any], encoding: JSONEncoding.default)
        case .favoriteSpTransCard(let request):
            return .requestParameters(parameters: request.toDictionary() as! [String : Any], encoding: JSONEncoding.default)
        case .getRecharges(let request):
            return .requestParameters(parameters: request.toDictionary() as! [String : Any], encoding: JSONEncoding.default)
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

