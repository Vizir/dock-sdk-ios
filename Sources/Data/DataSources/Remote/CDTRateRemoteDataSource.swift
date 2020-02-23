//
//  RateRemoteDataSource.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 03/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation
import Moya
import RxSwift

open class CDTRateRemoteDataSource {
    
    let provider = MoyaProvider<CDTRateService>()
    
    func getRate(request: RateRequest) -> Single<Response>{
        return provider.rx.request(.getRate(request: request))
    }
}
