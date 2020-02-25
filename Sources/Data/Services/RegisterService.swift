//
//  RegisterService.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 25/09/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//
import Foundation
import Moya
import SwiftKeychainWrapper

enum RegisterService {
    case checkCode(request: CheckCodeRequest)
    case register(request: RegisterUserRequest)
    case setPassword(request: SetPassRequest)
    case createAddress(request: RegisterAddressRequest)
    case sendCode(request: RegisterSendCodeRequest)
    case sendDocument(request: RegisterSendPictureRequest, image: Data?)
    case sendSelfie(cpf: String, personID: String, image: Data?)
}

extension RegisterService: TargetType {

    var baseURL: URL {
        return URL(string: API_URL)!
    }

    var path: String {
        switch self {
        case .checkCode:
            return CHECK_CODE
        case .register:
            return REGISTRER
        case .setPassword:
            return SET_PASSWORD
        case .createAddress:
            return CREATE_ADDRESS
        case .sendCode:
            return SEND_CODE
        case .sendDocument:
            return SEND_DOCUMENT
        case .sendSelfie:
            return SEND_SELFIE
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
        case .checkCode(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .register(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .setPassword(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .createAddress(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .sendCode(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .sendDocument(let request, let image):
            let base64Str = image?.base64EncodedString() ?? ""
            request.image = base64Str
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .sendSelfie(let cpf, let personID, let image):
            let base64Str = image?.base64EncodedString() ?? ""
            var request = RegisterSendPictureRequest()
            request.image = base64Str
            request.cpf = cpf
            request.personID = personID
            request.type = "selfie"
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
