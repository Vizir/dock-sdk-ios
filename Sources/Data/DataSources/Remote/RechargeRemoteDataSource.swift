//
//  RechargeRemoteDataSource.swift
//  Mobile2you
//
//  Created by Lucas Soares on 14/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation
import Moya
import RxSwift

open class RechargeRemoteDataSource {
    
    let provider = MoyaProvider<RechargeService>()
    
    func getFavoriteNumbers() -> Single<Response> {
        return provider.rx.request(.getFavoriteNumbers)
    }
    
    func addFavorite(request: FavoriteRequest) -> Single<Response> {
        return provider.rx.request(.addFavorite(request: request))
    }
    
    func confirmRecharge(request: TransferPasswordRequest) -> Single<Response> {
        return provider.rx.request(.confirmRecharge(request: request))
    }
}
