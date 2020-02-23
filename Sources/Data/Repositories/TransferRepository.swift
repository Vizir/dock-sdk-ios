//
//  TransferRepository.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import RxSwift
import Moya

open class TransferRepository: M2YRepository {

    static let remoteDataSouce = TransferRemoteDataSource()

    open static func getTransfers(success: @escaping ([TransferFavoriteResponse])->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.getTransfers().singleSubscribe(onSuccess: { (response: [TransferFavoriteResponse]) in
            success(response)
        }, onError: { (msg) in
            error(msg)
        })
    }

    open static func favoriteTransfer(request: TransferPasswordRequest, success:@escaping()->(), error:@escaping(String)->()) -> Disposable {
        return remoteDataSouce.favoriteTransfer(request: request).singleSubscribe(onSuccess: {
            success()
        }, onError: { (message) in
            error(message)
        })
    }

}
