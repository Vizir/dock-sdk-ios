//
//  CDTPaymentRemoteDataSource.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import UIKit
import Moya
import RxSwift

open class CDTPaymentRemoteDataSource {
    
    let provider = MoyaProvider<CDTPaymentService>()
    
    func pay(request: TransferPasswordRequest) -> Single<Response>{
        return provider.rx.request(.pay(request: request))
    }
    
    func validate(request: ValidateBarcodeRequest) -> Single<Response>{
        return provider.rx.request(.validate(request: request))
    }
    
    func getPaymentList(request: AccountIdRequest) -> Single<Response>{
        return provider.rx.request(.getPaymentList(request: request))
    }
    
    func getPaymentAdjustment(request: IdRequest) -> Single<Response>{
        return provider.rx.request(.getPaymentAdjustment(request: request))
    }

    func getNewPaymentList(request: AccountIdRequest) -> Single<Response>{
        return provider.rx.request(.getNewPaymentList(request: request))
    }
}
