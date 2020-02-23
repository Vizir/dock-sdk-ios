//
//  CDTAccountRepository.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import EVReflection

open class CDTAccountRepository: M2YRepository {

    static let remoteDataSouce = CDTAccountRemoteDataSource()

    open static func getTransactions(request: ExtractRequest,success: @escaping (ExtractResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.getTransactions(request: request).singleSubscribe(onSuccess: { (response: ExtractResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func getAvaliableMonths(request: AccountIdRequest,success: @escaping (MonthsResponse)->(), error: @escaping (String)->()) -> Disposable {
      return remoteDataSouce.getAvaliableMonths(request: request).singleSubscribe(onSuccess: { (response: MonthsResponse) in
        success(response)
      }, onError: { (message) in
        error(message)
      })
    }

    open static func createVirtualCard(request: AccountIdRequest, success: @escaping(CardResponse)->(), error:@escaping(String)->()) -> Disposable {
      return remoteDataSouce.createVirtualCard(request: request).singleSubscribe(onSuccess: { (response: CardResponse) in
          success(response)
      }, onError: { (message) in
          error(message)
      })
    }

}
