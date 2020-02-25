//
//  LoginService.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 18/09/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation
import Moya
import SwiftKeychainWrapper

enum LoginService {
    case signin(request: LoginRequest)
    case register(request: RegisterRequest)
    case checkCpf(request: CheckCpfRequest)
    case forgotPassword(request: ForgotPasswordRequest)
    case checkCode(request: CheckCodeRequest)
    case sendCode(request: SendCodeRequest)
    case updatePhoto(image: UIImage)
    case validateAccount(request: ValidateAccountRequest)
    case resetPassword(request: ResetPasswordRequest)
    case checkCdtUser(request: CheckCpfRequest)
    case associateCard(request: AssociateCardRequest)
    case createIndividual(request: AssociateCardRequest)
    case createPerson(request: CreatePersonRequest)
    case sendFirstAccessToken(request: ResetPasswordRequest)
}

extension LoginService: TargetType {
    
    var baseURL: URL {
        return URL(string: API_URL)!
    }

    var path: String {
        switch self {
        case .signin:
            return POST_SIGNIN
        case .register:
            return POST_REGISTER
        case .checkCpf:
            return GET_CHECK_CPF
        case .forgotPassword:
            return POST_FORGOT_PASS
        case .checkCode:
            return GET_CHECK_CODE
        case .sendCode:
            return GET_SEND_CODE
        case .updatePhoto:
            return UPDATE_PHOTO
        case .validateAccount:
            return VALIDATE_ACCOUNT
        case .createIndividual:
            return CREATE_INDIVIDUAL
        case .resetPassword:
            return RESET_PASSWORD
        case .checkCdtUser:
            return CHECK_CDT_USER
        case .associateCard:
            return ASSOCIATE_CARD
        case .sendFirstAccessToken:
            return SEND_FIRST_ACCESS_TOKEN
        case .createPerson:
            return CREATE_PERSON
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
        case .signin(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .register(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .forgotPassword(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .checkCpf(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .checkCode(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .sendCode(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .updatePhoto(let image):
            let imgData = image.jpegData(compressionQuality: 0.5)!
            let multipartFormData: [MultipartFormData] = [MultipartFormData(provider: .data(imgData), name: "picture", fileName: "file.jpg", mimeType: "image/jpg")]
            return .uploadMultipart(multipartFormData)
        case .validateAccount(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .resetPassword(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .sendFirstAccessToken(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .checkCdtUser(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .associateCard(let request):
             return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .createIndividual(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        case .createPerson(let request):
            return .requestParameters(parameters: request.toEncryptedBody(), encoding: JSONEncoding.default)
        }
    }
    
    //   var multipartBody: [MultipartFormData]? {
    //      switch self {
    //      case .updatePhoto(let image):
    //         guard let data = UIImageJPEGRepresentation(image, 1.0) else { return nil }
    //         return [MultipartFormData(provider: .data(data), name: "picture", fileName: "picture", mimeType: "picture")]
    //      default:
    //         return []
    //      }
    //   }
    
    var headers: [String : String]? {
        if let sessionToken = KeychainWrapper.standard.string(forKey: KEY_USER_SESSION) {
            SESSION_TOKEN = sessionToken
        }

        switch self {
        case .updatePhoto:
            return [
                "Content-Type": "multipart/form-data",
                "Application": API_TOKEN,
                "Oamolas": "Oamolas",
                "authorization": SESSION_TOKEN,
                "product": PRODUCT_ID,
                "X-VizirBankAppBuildNumber": BUILD_NUMBER,
                "X-VizirBankAppVersion": VERSION_NUMBER,
                "X-VizirBankAppName": APP_NAME,
                "X-VizirBankAppPlatform": "ios",
                "X-VizirBankCorrelationId": UUID().uuidString]
        default:
            return [
                "Content-type": "application/json",
                "Application": API_TOKEN,
                "Oamolas": "Oamolas",
                "authorization": SESSION_TOKEN,
                "product": PRODUCT_ID,
                "X-VizirBankAppBuildNumber": BUILD_NUMBER,
                "X-VizirBankAppVersion": VERSION_NUMBER,
                "X-VizirBankAppName": APP_NAME,
                "X-VizirBankAppPlatform": "ios",
                "X-VizirBankCorrelationId": UUID().uuidString]
        }
    }   
}

