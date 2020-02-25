//
//  AccountService.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 25/09/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//
import Foundation
import Moya
import SwiftKeychainWrapper

enum AccountService {
    case getAbout
    case checkPassword(request: PasswordRequest)
    case updatePassword(request: UpdatePasswordRequest)
    case getAccountIds
    case sendCode(request: SendTransactionCodeRequest)
    case validateCode(request: CodeRequest)
    case findAccount(request: IdRequest)
    case updateAbout(request: UpdateAboutRequest)
    case getTermsAndPolitics
    case updatePhoto(image: UIImage)
    case registerToken(request: RegisterTokenRequest)
    case getCards(request: IdRequest)
    case logout
}

extension AccountService: TargetType {

    var baseURL: URL {
        return URL(string: API_URL)!
    }

    var path: String {
        switch self {
        case .getAbout:
            return GET_ABOUT
        case .checkPassword:
            return GET_CHECK_PASSWORD
        case .updateAbout:
            return UPDATE_ABOUT
        case .updatePassword:
            return UPDATE_PASSWORD
        case .getAccountIds:
            return GET_ACCOUNT_IDS
        case .findAccount:
            return FIND_ACCOUNT
        case .sendCode:
            return GET_ACCOUNT_SEND_CODE
        case .validateCode:
            return GET_ACCOUNT_VALIDATE_CODE
        case .getTermsAndPolitics:
            return GET_TERMS_AND_POLITICS
        case .updatePhoto:
            return UPDATE_PHOTO
        case .registerToken:
            return REGISTER_TOKEN
        case .getCards:
            return GET_ALL_CARDS
        case .logout:
            return LOGOUT
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
        case .getAbout, .getAccountIds, .getTermsAndPolitics:
            return .requestPlain
        case .sendCode(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)

        case .validateCode(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
         
        case .checkPassword(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)

        case .updatePassword(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)

        case .findAccount(let request), .getCards(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)

        case .updateAbout(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .updatePhoto(let request):
            let imgData = request.jpegData(compressionQuality: 0.5)!
            let multipartFormData: [MultipartFormData] = [MultipartFormData(provider: .data(imgData), name: "picture", fileName: "file.jpg", mimeType: "image/jpg")]
            return .uploadMultipart(multipartFormData)
        case .registerToken(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .logout:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        if let userData = KeychainWrapper.standard.data(forKey: KEY_USER_OBJECT) {
            let user = UserResponse(data: userData)
            SESSION_TOKEN = user.sessionToken ?? ""
        }
        
        switch self {
        case .updatePhoto:
            return ["Content-Type": "multipart/form-data",
                    "authorization": SESSION_TOKEN,
                     "product": PRODUCT_ID,
                    "Application": API_TOKEN,
                    "Oamolas": "Oamolas",
                    "X-VizirBankAppBuildNumber": BUILD_NUMBER,
                    "X-VizirBankAppVersion": VERSION_NUMBER,
                    "X-VizirBankAppName": APP_NAME,
                    "X-VizirBankAppPlatform": "ios",
                    "X-VizirBankCorrelationId": UUID().uuidString]
        default:
            return ["Content-type": "application/json",
                    "Application": API_TOKEN,
                     "product": PRODUCT_ID,
                    "authorization": SESSION_TOKEN,
                    "Oamolas": "Oamolas",
                    "X-VizirBankAppBuildNumber": BUILD_NUMBER,
                    "X-VizirBankAppVersion": VERSION_NUMBER,
                    "X-VizirBankAppName": APP_NAME,
                    "X-VizirBankAppPlatform": "ios",
                    "X-VizirBankCorrelationId": UUID().uuidString]
        }
    }
}
