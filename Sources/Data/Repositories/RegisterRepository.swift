//
//  RegisterRepository.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 26/09/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import EVReflection

open class RegisterRepository: M2YRepository {
    static let remoteDataSouce = RegisterRemoteDataSource()

    open static func checkCode(request: CheckCodeRequest, success: @escaping ()->(), error: @escaping (String) -> ()) -> Disposable {
        return remoteDataSouce.checkCode(request: request).singleSubscribe(onSuccess: {
            success()
        }, onError: { (message) in
            error(message)
        })
    }
    
    open static func register(request: RegisterUserRequest, success: @escaping (RegisterResponse)->(), error: @escaping (String) -> ()) -> Disposable {
        return remoteDataSouce.register(request: request).singleSubscribe(onSuccess: { (response: RegisterResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }
    
    open static func setPassword(request: SetPassRequest, success: @escaping (RegisterResponse)->(), error: @escaping (String) -> ()) -> Disposable {
        return remoteDataSouce.setPassword(request: request).singleSubscribe(onSuccess: { (response: RegisterResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }
    
    open static func createAddress(request: RegisterAddressRequest, success: @escaping (RegisterResponse)->(), error: @escaping (String) -> ()) -> Disposable {
        return remoteDataSouce.createAddress(request: request).singleSubscribe(onSuccess: { (response: RegisterResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }
    
    open static func sendCode(request: RegisterSendCodeRequest, success: @escaping (RegisterResponse)->(), error: @escaping (String) -> ()) -> Disposable {
        return remoteDataSouce.sendCode(request: request).singleSubscribe(onSuccess: { (response: RegisterResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }
    
    open static func sendDocument(request: RegisterSendPictureRequest, image: Data?, success: @escaping (RegisterResponse)->(), error: @escaping (String) -> ()) -> Disposable {
        return remoteDataSouce.sendDocument(request: request, image: image).singleSubscribe(onSuccess: { (response: RegisterResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }
    
    open static func sendSelfie(image: Data?, cpf: String, personID: String, success: @escaping (RegisterResponse)->(), error: @escaping (String) -> ()) -> Disposable {
        return remoteDataSouce.sendSelfie(image: image, cpf: cpf, personID: personID).singleSubscribe(onSuccess: { (response: RegisterResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }
}
