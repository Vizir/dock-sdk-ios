//
//  TransferRemoteDataSource.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import UIKit
import Moya
import RxSwift

open class TransferRemoteDataSource {
    
    let provider = MoyaProvider<TransferService>()
    
    func getTransfers() -> Single<Response>{
        return provider.rx.request(.getTransfers())
    }
    
    func favoriteTransfer(request: TransferPasswordRequest) -> Single<Response> {
        return provider.rx.request(.favoriteTransfer(request: request))
    }
    
}
