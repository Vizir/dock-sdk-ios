//
//  CDTAddressRepository.swift
//  Mobile2you
//
//  Created by Marina Bearzi on 19/03/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import Moya
import EVReflection

open class CDTAddressRepository: M2YRepository {
    
    static let remoteDataSouce = CDTAddressRemoteDataSource()
    
    open static func checkZip(request: CepRequest, success: @escaping (CepResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.checkZip(request: request).singleSubscribe(onSuccess: { (response: CepResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }
}
