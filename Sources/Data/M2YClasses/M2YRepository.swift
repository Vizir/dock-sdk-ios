//
//  M2YRepository.swift
//  Mobile2you
//
//  Created by Mobile2you on 5/15/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import UIKit
import Moya
import Alamofire
import RxSwift

open class M2YRepository {

    open class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }

    static func errorBlock(subscribeError: Error, error: @escaping (String)->()) {
        if !isConnectedToInternet {
            error("unavailable_network".localized)
        } else {
            var errorMessage = "unknown_error".localized
            if let moyaError = subscribeError as? MoyaError, let response = moyaError.response {
                if let statusCode = response.response?.statusCode {
                    if statusCode == 401 {
                        error("session_error".localized)
                    } else if let optionalDic = try? JSONSerialization.jsonObject(with: response.data, options: []) as? NSDictionary, let responseDictionary = optionalDic {
                        let errorJson = ErrorResponse(json: responseDictionary.toJsonString())
                        if let message = errorJson.message { errorMessage = message }
                    }
                }
            }
            error(errorMessage)
        }
    }

}

extension PrimitiveSequenceType where Self.TraitType == RxSwift.SingleTrait{

    public func singleSubscribe(onSuccess: @escaping () -> (), onError: @escaping (String) -> ()) -> Disposable {
        return self.subscribe(onSuccess: { (response) in
            if let response = response as? Response {
                response.parse(success: { (successResponse) in
                    onSuccess()
                }, error: { (statusCode, message) in
                    onError(message)
                })
            }
        }, onError: { (error) in
            M2YRepository.errorBlock(subscribeError: error, error: { (errorString) in
                onError(errorString)
            })
        })
    }

    public func singleSubscribe<T: M2YModel>(onSuccess: @escaping (T) -> (), onError: @escaping (String) -> ()) -> Disposable {
        return self.subscribe(onSuccess: { (response) in
            if let response = response as? Response {
                response.parse(success: { (successResponse) in
                    let str = String(decoding: successResponse.data, as: UTF8.self)
                    print(str)
                    let decryptModel = EncryptModel(data: successResponse.data)
                    if(M2YCDTEnvironment.shared.isDebug){
                      print(decryptModel)
                    }
                    if let decryptData = decryptModel.data {
                        let json = AESCrypt.decrypt(decryptData)
                        if(M2YCDTEnvironment.shared.isDebug){
                          print(json)
                        }
                        onSuccess(T(json: json as! String))
                    } else {
                        onSuccess(T(data: successResponse.data))
                    }

                }, error: { (statusCode, message) in
                    onError(message)
                })
            }
        }, onError: { (error) in
            M2YRepository.errorBlock(subscribeError: error, error: { (errorString) in
                onError(errorString)
            })
        })
    }

    public func singleSubscribe<T: M2YModel>(onSuccess: @escaping ([T]) -> (), onError: @escaping (String) -> ()) -> Disposable {
        return self.subscribe(onSuccess: { (response) in
            if let response = response as? Response {
                response.parse(success: { (successResponse) in
                    let decryptModel = EncryptModel(data: successResponse.data)
                    if(M2YCDTEnvironment.shared.isDebug){
                      print(decryptModel)
                    }

                    if let decryptData = decryptModel.data {
                        let json = AESCrypt.decrypt(decryptData)
                        if(M2YCDTEnvironment.shared.isDebug){
                          print(json)
                        }
                        onSuccess([T](json: String(json ?? "")))
                    } else {
                        onSuccess([T](data: successResponse.data))
                    }
                }, error: { (statusCode, message) in
                    onError(message)
                })
            }
        }, onError: { (error) in
            M2YRepository.errorBlock(subscribeError: error, error: { (errorString) in
                onError(errorString)
            })
        })
    }
}
