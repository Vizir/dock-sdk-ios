//
//  P2PService.swift
//  Mobile2you
//
//  Created by Victor Catão on 26/02/19.
//  Copyright (c) 2019 Mobile2You. All rights reserved.
//

import Foundation
import Moya
import SwiftKeychainWrapper

enum P2PService {
    case getP2p()
    case favoriteP2p(request: P2pFavoriteRequest)
    case getP2PAdjustment(request: IdRequest)
}

extension P2PService: TargetType {
    
    var baseURL: URL {
        return URL(string: API_URL)!
    }
    
    var path: String {
        switch self {
        case .getP2p:
            return GET_P2P
        case .getP2PAdjustment:
            return GET_P2P_DETAIL
        case .favoriteP2p:
            return POST_FAVORITE_P2P
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getP2p, .favoriteP2p, .getP2PAdjustment:
            return .post
        }
    }
    
    var sampleData: Data {
        return "Half measures are as bad as nothing at all.".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .getP2p:
            return .requestPlain
        case .getP2PAdjustment(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .favoriteP2p(let request):
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
