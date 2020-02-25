//
//  CardsService.swift
//  Mobile2you
//
//  Created by Victor Catão on 05/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation
import Moya
import SwiftKeychainWrapper

enum CardsService {
   case getCards(request: IdContaRequest)
   case validatePassword(request: PasswordCardRequest)
   case changeCardPassword(request: ValidatePasswordRequest)
   case unlockCard(request: UnlockCardRequest)
   case lockCard(request: BlockCardRequest)
   case checkCardStatus(request: IdRequest)
   case activateCard(request: ActivateCardRequest)
   case cancelCard(request: CancelCardRequest)
    case registerPassword(request: RegisterPasswordRequest)
}

extension CardsService: TargetType {

   var baseURL: URL {
       return URL(string: API_URL)!
   }

   var path: String {
       switch self {
       case .getCards:
           return FIND_ACCOUNT
       case .validatePassword:
           return VALIDATE_PASSWORD
       case .changeCardPassword:
           return CHANGE_CARD_PASSWORD
       case .unlockCard:
           return UNLOCK_CARD
       case .lockCard:
           return LOCK_CARD
       case .checkCardStatus:
           return FIND_CARDS_DATA
       case .activateCard:
           return POST_ACTIVE_CARD
       case .cancelCard:
            return CANCEL_CARD
       case .registerPassword:
            return REGISTER_PASSWORD
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
       case .getCards(let request):
           return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
       case .lockCard(let request):
           return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
       case .validatePassword(let request):
           return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
       case .unlockCard(let request):
           return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
       case .checkCardStatus:
           return .requestPlain
       case .changeCardPassword(let request):
           return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
       case .activateCard(let request):
           return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
       case .cancelCard(let request):
        return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
       case .registerPassword(let request):
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
            "X-VizirBankAppPlatform": "ios"
            "X-VizirBankCorrelationId": UUID().uuidString]

   }
}
