//
//  LoginRemoteDataSource.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 18/09/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import UIKit
import Moya
import RxSwift

open class LoginRemoteDataSource {
    
    let provider = MoyaProvider<LoginService>(plugins: [NetworkLoggerPlugin(verbose: true)])

    func signin(request: LoginRequest) -> Single<Response>{
        return provider.rx.request(.signin(request: request))
    }
    
    func register(request: RegisterRequest) -> Single<Response>{
        return provider.rx.request(.register(request: request))
    }
    
    func checkCpf(request: CheckCpfRequest) -> Single<Response>{
        return provider.rx.request(.checkCpf(request: request))
    }
    
    func forgotPassword(request: ForgotPasswordRequest) -> Single<Response>{
        return provider.rx.request(.forgotPassword(request: request))
    }
    
    func checkCode(request: CheckCodeRequest) -> Single<Response>{
        return provider.rx.request(.checkCode(request: request))
    }
    
    func sendCode(request: SendCodeRequest) -> Single<Response>{
        return provider.rx.request(.sendCode(request: request))
    }
    
    func validateAccount(request: ValidateAccountRequest) -> Single<Response> {
        return provider.rx.request(.validateAccount(request: request))
    }
    
    func resetPassword(request: ResetPasswordRequest) -> Single<Response> {
        return provider.rx.request(.resetPassword(request: request))
    }

    func sendFirstAccessToken(request: ResetPasswordRequest) -> Single<Response> {
        return provider.rx.request(.sendFirstAccessToken(request: request))
    }

    
    func checkCdtUser(request: CheckCpfRequest) -> Single<Response> {
        return provider.rx.request(.checkCdtUser(request: request))
    }
    
    func associateCard(request: AssociateCardRequest) -> Single<Response> {
        return provider.rx.request(.associateCard(request: request))
    }
    
    func createIndividual(request: AssociateCardRequest) -> Single<Response> {
        return provider.rx.request(.createIndividual(request: request))
    }
    
    func createPerson(request: CreatePersonRequest) -> Single<Response> {
        return provider.rx.request(.createPerson(request: request))
    }
}
