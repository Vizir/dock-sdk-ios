//
//  BaseService.swift
//  Mobile2you
//
//  Created by Mobile2you on 5/11/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation
import Moya
import SwiftKeychainWrapper

enum ExampleService {
    case zen
}

extension ExampleService: TargetType {
    
    /*
     Base da URL.
     **/
    var baseURL: URL {
        return URL(string: "http://exemplo.herokuapp.com/webservices/")!
    }
    
    /*
     Qual o path da URL.
     No exemplo de baixo temos http://exemplo.herokuapp.com/webservices/zen
     **/
    var path: String {
        switch self {
        case .zen:
            return "zen"
        }
    }
    
    /*
     Qual o método REST da requisição.
     **/
    var method: Moya.Method {
        switch self {
        case .zen:
            return .get
        }
    }
    /*
     Isso é o que vai ser retornado como padrão, não serve para nada num caso real.
     **/
    var sampleData: Data {
        switch self {
        case .zen:
            return "Half measures are as bad as nothing at all.".data(using: .utf8)!
        }
    }
    
    /*
     Qual o tipo de request a ser feita.
     Sem parametros = .requestPlain
     Body = .requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
     Multipart = .uploadMultipart([MultipartFormData])
     Multipart + Body = .uploadCompositeMultipart([MultipartFormData], urlParameters: [String: Any])
     
     Encoding pode ser URLEncoding ou JSONEncoding. Para um caso genérico usar o JSONEncoding funciona,
     mas se tiver somente um parametro no seu Body, tem de usar o URLEncoding.
     **/
    var task: Task {
        switch self {
        case .zen:
            return .requestPlain
        }
    }
    
    
    /*
     Headers da requisição
     **/
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
