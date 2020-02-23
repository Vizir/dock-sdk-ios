//
//  RegisterRemoteDataSource.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 26/09/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import UIKit
import Moya
import RxSwift

open class RegisterRemoteDataSource {

    let provider = MoyaProvider<RegisterService>()

    func checkCode(request: CheckCodeRequest) -> Single<Response> {
        return provider.rx.request(.checkCode(request: request))
    }
    
    func register(request: RegisterUserRequest) -> Single<Response> {
        return provider.rx.request(.register(request: request))
    }
    
    func setPassword(request: SetPassRequest) -> Single<Response> {
        return provider.rx.request(.setPassword(request: request))
    }
    
    func createAddress(request: RegisterAddressRequest) -> Single<Response> {
        return provider.rx.request(.createAddress(request: request))
    }
    
    func sendCode(request: RegisterSendCodeRequest) -> Single<Response> {
        return provider.rx.request(.sendCode(request: request))
    }
    
    func sendDocument(request: RegisterSendPictureRequest, image: Data?) -> Single<Response> {
        return provider.rx.request(.sendDocument(request: request, image: image))
    }
    
    func sendSelfie(image: Data?, cpf: String, personID: String) -> Single<Response> {
        return provider.rx.request(.sendSelfie(cpf: cpf, personID: personID, image: image))
    }
}
