//
//  CDTRechargeRemoteDataSource.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import Moya
import RxSwift

open class CDTRechargeRemoteDataSource {
    
    let provider = MoyaProvider<CDTRechargeService>()
    
    func getRecharges(request: AccountIdRequest) -> Single<Response>{
        return provider.rx.request(.getRecharges(request: request))
    }
    
    func getDealers() -> Single<Response> {
        return provider.rx.request(.getDealers)
    }
    
    func postRecharge(request: RechargeRequest) -> Single<Response> {
        return provider.rx.request(.postRecharge(request: request))
    }
    
    func postConfirmRecharge(request: RechargeRequest) -> Single<Response> {
        return provider.rx.request(.postConfirmRecharge(request: request))
    }
    
    func createRecharge(request: RechargeRequest) -> Single<Response> {
        return provider.rx.request(.createRecharge(request: request))
    }
    
    func getRechargeDetail(request: IdRequest) -> Single<Response> {
        return provider.rx.request(.getRechargeDetail(request: request))
    }
}
