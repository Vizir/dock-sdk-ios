//
//  LoginRepository.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 18/09/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import EVReflection

open class LoginRepository: M2YRepository {

    static let remoteDataSouce = LoginRemoteDataSource()

    open static func register(request: RegisterRequest,success: @escaping (UserResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.register(request: request).singleSubscribe(onSuccess: { (response: UserResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func checkCpf(request: CheckCpfRequest,success: @escaping (CheckCpfResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.checkCpf(request: request).singleSubscribe(onSuccess: { (response: CheckCpfResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func forgotPassword(request: ForgotPasswordRequest,success: @escaping (ForgotPasswordResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.forgotPassword(request: request).singleSubscribe(onSuccess: { (response: ForgotPasswordResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func checkCode(request: CheckCodeRequest,success: @escaping ()->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.checkCode(request: request).singleSubscribe(onSuccess: {
            success()
        }, onError: { (message) in
            error(message)
        })
    }

    open static func sendCode(request: SendCodeRequest,success: @escaping ()->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.sendCode(request: request).singleSubscribe(onSuccess: {
            success()
        }, onError: { (message) in
            error(message)
        })
    }

    open static func signin(request: LoginRequest,success: @escaping (UserResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.signin(request: request).singleSubscribe(onSuccess: { (response: UserResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func validateAccount(request: ValidateAccountRequest, success:@escaping(ValidateAccountResponse)->(), error:@escaping(String)->()) -> Disposable {
        return remoteDataSouce.validateAccount(request: request).singleSubscribe(onSuccess: { (response: ValidateAccountResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func resetPassword(request: ResetPasswordRequest, success:@escaping()->(), error:@escaping(String)->()) -> Disposable {
        return remoteDataSouce.resetPassword(request: request).singleSubscribe(onSuccess: { () in
            success()
        }, onError: { (message) in
            error(message)
        })
    }

    open static func sendFirstAccessToken(request: ResetPasswordRequest, success:@escaping()->(), error:@escaping(String)->()) -> Disposable {
        return remoteDataSouce.sendFirstAccessToken(request: request).singleSubscribe(onSuccess: { () in
            success()
        }, onError: { (message) in
            error(message)
        })
    }

    
    open static func checkCdtUser(request: CheckCpfRequest,success: @escaping (CheckCdtUserResponse)->(), error: @escaping (String)->()) -> Disposable{
        return remoteDataSouce.checkCdtUser(request: request).singleSubscribe(onSuccess: { (response: CheckCdtUserResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }
    
    open static func associateCard(request: AssociateCardRequest,success: @escaping (UserResponse)->(), error: @escaping (String)->()) -> Disposable{
        return remoteDataSouce.associateCard(request: request).singleSubscribe(onSuccess: { (response: UserResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }
    
    open static func createIndividual(request: AssociateCardRequest,success: @escaping (UserResponse)->(), error: @escaping (String)->()) -> Disposable{
        return remoteDataSouce.createIndividual(request: request).singleSubscribe(onSuccess: { (response: UserResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }
    
    open static func createPerson(request: CreatePersonRequest,success: @escaping (RegisterResponse)->(), error: @escaping (String)->()) -> Disposable{
        return remoteDataSouce.createPerson(request: request).singleSubscribe(onSuccess: { (response: RegisterResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }
}
