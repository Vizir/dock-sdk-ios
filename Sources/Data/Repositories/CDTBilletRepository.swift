//
//  CDTBilletRepository.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import EVReflection

open class CDTBilletRepository: M2YRepository {

    static let remoteDataSouce = CDTBilletRemoteDataSource()

    open static func getTickets(request: AccountIdRequest, success: @escaping ([BilletResponse])->(), error: @escaping (String)->()) -> Disposable {
       return remoteDataSouce.getTickets(request: request).singleSubscribe(onSuccess: { (response: [BilletResponse]) in
           success(response)
       }, onError: { (message) in
           error(message)
       })
    }

    open static func generateTicket(request: BilletRequest,success: @escaping (CreateReceiptResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.generateTicket(request: request).singleSubscribe(onSuccess: { (response: CreateReceiptResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }
}
