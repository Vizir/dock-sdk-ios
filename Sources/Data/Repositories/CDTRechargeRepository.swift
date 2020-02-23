//
//  CDTRechargeRepository.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import EVReflection

open class CDTRechargeRepository: M2YRepository {
    static let remoteDataSource = CDTRechargeRemoteDataSource()

    open static func getRecharges(request: AccountIdRequest, success: @escaping ([RechargeAdjustmentResponse])->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSource.getRecharges(request: request).singleSubscribe(onSuccess: { (response: [RechargeAdjustmentResponse]) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func getDealers(success: @escaping (DealersResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSource.getDealers().singleSubscribe(onSuccess: { (response: DealersResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func postRecharge(request: RechargeRequest, success: @escaping (RechargeResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSource.postRecharge(request: request).singleSubscribe(onSuccess: { (response: RechargeResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func postConfirmRecharge(request: RechargeRequest, success: @escaping (ConfirmRechargeResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSource.postConfirmRecharge(request: request).singleSubscribe(onSuccess: { (response: ConfirmRechargeResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func createRecharge(request: RechargeRequest, success: @escaping(RechargeResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSource.createRecharge(request: request).singleSubscribe(onSuccess: { (response: RechargeResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func getRechargeDetail(request: IdRequest, success: @escaping(RechargeAdjustmentResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSource.getRechargeDetail(request: request).singleSubscribe(onSuccess: { (response: RechargeAdjustmentResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }
}
