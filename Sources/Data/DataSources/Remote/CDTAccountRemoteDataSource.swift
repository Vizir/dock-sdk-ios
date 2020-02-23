//
//  CDTAccountRemoteDataSource.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import UIKit
import Moya
import RxSwift

open class CDTAccountRemoteDataSource {

    let provider = MoyaProvider<CDTAccountService>()

    func getAccounts() -> Single<Response>{
        return provider.rx.request(.getAccounts)
    }

    func getTransactions(request: ExtractRequest) -> Single<Response>{
        return provider.rx.request(.getTransactions(request: request))
    }

    func getAvaliableMonths(request: AccountIdRequest) -> Single<Response>{
        return provider.rx.request(.getAvaliableMonths(request: request))
    }

    func createVirtualCard(request: AccountIdRequest) -> Single<Response> {
        return provider.rx.request(.createVirtualCard(request: request))
    }
}
