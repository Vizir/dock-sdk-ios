//
//  RechargeRepository.swift
//  Mobile2you
//
//  Created by Lucas Soares on 14/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation
import RxSwift
import Moya

open class RechargeRepository: M2YRepository {

    static let remoteDataSource = RechargeRemoteDataSource()

    open static func getFavoriteNumbers(success: @escaping ([FavoriteNumbersResponse])->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSource.getFavoriteNumbers().singleSubscribe(onSuccess: { (response: [FavoriteNumbersResponse]) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func postAddfavorite(request: FavoriteRequest, success: @escaping ()->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSource.addFavorite(request: request).singleSubscribe(onSuccess: {
            success()
        }, onError: { (message) in
            error(message)
        })
    }

    open static func postConfirmRecharge(request: TransferPasswordRequest, success:@escaping(ConfirmRechargeResponse)->(), error:@escaping(String)->()) -> Disposable {
        return remoteDataSource.confirmRecharge(request: request).singleSubscribe(onSuccess: { (response: ConfirmRechargeResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }
}
