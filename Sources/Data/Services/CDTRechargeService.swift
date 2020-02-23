//
//  CDTRechargeService.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import Moya
import SwiftKeychainWrapper

enum CDTRechargeService {
    case getRecharges(request: AccountIdRequest)
    case getDealers
    case postRecharge(request: RechargeRequest)
    case postConfirmRecharge(request: RechargeRequest)
    case createRecharge(request: RechargeRequest)
    case getRechargeDetail(request: IdRequest)
}

extension CDTRechargeService: TargetType {

    var baseURL: URL {
        return URL(string: API_URL)!
    }

    var path: String {
        switch self {
        case .getRecharges:
            return GET_RECHARGES
        case .getDealers:
            return GET_DEALERS_CDT
        case .postRecharge:
            return RECHARGES_CDT
        case .postConfirmRecharge:
            return CONFIRM_RECHARGE_CDT
        case .createRecharge:
            return PUT_CREATE_RECHARGE_CDT
        case .getRechargeDetail:
            return GET_RECHARGE_DETAIL_CDT
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
        case .getRecharges(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .getDealers:
            return .requestPlain
        case .postRecharge(let request), .postConfirmRecharge(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .createRecharge(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .getRechargeDetail(let request):
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
