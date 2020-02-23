//
//  RateRepository.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 03/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

import UIKit
import RxSwift
import Moya
import EVReflection
import SwiftKeychainWrapper

open class CDTRateRepository: M2YRepository {
    
    static let remoteDataSouce = CDTRateRemoteDataSource()
    
    open static func getRate(request: RateRequest,success: @escaping (RateResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.getRate(request: request).singleSubscribe(onSuccess: { (response: RateResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }
    
}
