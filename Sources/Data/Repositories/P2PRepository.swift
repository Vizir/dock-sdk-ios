//
//  P2PRepository.swift
//  Mobile2you
//
//  Created by Victor Catão on 26/02/19.
//  Copyright (c) 2019 Mobile2You. All rights reserved.
//

import Foundation
import RxSwift
import Moya

open class P2PRepository: M2YRepository {
    
    static let remoteDataSouce = P2PRemoteDataSource()
    
    open static func getP2p(success: @escaping ([FavoriteP2PModel])->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.getP2p().singleSubscribe(onSuccess: { (response) in
            success(response)
        }, onError: { (msg) in
            error(msg)
        })
    }
    
    open static func favoriteP2p(request: P2pFavoriteRequest, success: @escaping ([FavoriteP2PModel])->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.favoriteP2p(request: request).singleSubscribe(onSuccess: { (response) in
            success(response)
        }, onError: { (msg) in
            error(msg)
        })
    }
    
    open static func getP2PAdjustment(request: IdRequest, success: @escaping (PersonResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.getP2PAdjustment(request: request).singleSubscribe(onSuccess: { (response: PersonResponse) in
            success(response)
        }, onError: { (msg) in
            error(msg)
        })
    }

}

