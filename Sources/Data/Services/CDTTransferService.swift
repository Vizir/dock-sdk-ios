//
//  CDTTransferService.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import Moya
import SwiftKeychainWrapper

enum CDTTransferService {
    case getBankTransfers(request: AccountIdRequest)
    case getP2PTransfers(request: AccountIdRequest)
    case createBankTransfer(request: TransferPasswordRequest)
    case createP2PTransfer(request: TransferPasswordRequest)
    case getBankTransferDetail(request: AdjustmentIdRequest)
}

extension CDTTransferService: TargetType{
    var baseURL: URL {
        return URL(string: API_URL)!
    }
    
    var path: String {
        switch self {
        case .getBankTransfers:
            return GET_BANK_TRANSFERS
        case .getP2PTransfers:
            return GET_P2P_TRANSFERS
        case .createBankTransfer:
            return POST_CREATE_BANK_TRANSFER
        case .createP2PTransfer:
            return POST_CREATE_P2P_TRANSFER
        case .getBankTransferDetail:
            return GET_BANK_TRANSFER_DETAIL
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
        case .getBankTransfers(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
            
        case .getP2PTransfers(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
            
        case .createBankTransfer(let request), .createP2PTransfer(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
            
        case .getBankTransferDetail(let request):
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
