//
//  TransportRechargeDataSource.swift
//  Mobile2you
//
//  Created by Diego Gomes on 30/05/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import RxSwift
import Moya
import DOCKSDK

open class TransportRechargeDataSource {
    
    let provider = MoyaProvider<TransportRechargeService>()
    
    func getProducts(request: TransportCardNumberRequest) -> Single<Response>{
        return provider.rx.request(.getProducts(request: request))
    }
    
    func recharge(request: TransferPasswordRequest) -> Single<Response>{
        return provider.rx.request(.recharge(request: request))
    }
    
    func getFavorites() -> Single<Response>{
        return provider.rx.request(.getFavorites)
    }
    
    func favoriteSpTransCard(request: TransportCardNumberRequest) -> Single<Response>{
        return provider.rx.request(.favoriteSpTransCard(request: request))
    }

    func getRecharges(request: AccountIdRequest) -> Single<Response>{
        return provider.rx.request(.getRecharges(request: request))
    }
}
