//
//  TransportRechargeRepository.swift
//  Mobile2you
//
//  Created by Diego Gomes on 30/05/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import RxSwift
import DOCKSDK

open class TransportRechargeRepository: M2YRepository {
    
    static let remoteDataSouce = TransportRechargeDataSource()
    
    open static func getProducts(request: TransportCardNumberRequest, success: @escaping ([TransportValuesResponse])->(), error: @escaping (String)->()) -> Disposable {
        
        return remoteDataSouce.getProducts(request: request).singleSubscribe(onSuccess: { (response: [TransportValuesResponse]) in
            success(response)
        }, onError: { (msg) in
            error(msg)
        })
    }
    
    open static func recharge(request: TransferPasswordRequest, success: @escaping (MakeTransportRechargeResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.recharge(request: request).singleSubscribe(onSuccess: { (response: MakeTransportRechargeResponse) in
            success(response)
        }, onError: { (msg) in
            error(msg)
        })
    }
    
    open static func getFavorites(success: @escaping ([FavoriteTransportRechargeResponse])->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.getFavorites().singleSubscribe(onSuccess: { (response: [FavoriteTransportRechargeResponse]) in
            success(response)
        }, onError: { (msg) in
            error(msg)
        })
    }
    
    open static func favoriteSpTransCard(request: TransportCardNumberRequest, success: @escaping (FavoriteTransportRechargeResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.favoriteSpTransCard(request: request).singleSubscribe(onSuccess: { (response: FavoriteTransportRechargeResponse) in
            success(response)
        }, onError: { (msg) in
            error(msg)
        })
    }

    open static func getRecharges(request: AccountIdRequest, success: @escaping (SPTransRechargeList)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.getRecharges(request: request).singleSubscribe(onSuccess: { (response: SPTransRechargeList) in
            success(response)
        }, onError: { (msg) in
            error(msg)
        })
    }
}

