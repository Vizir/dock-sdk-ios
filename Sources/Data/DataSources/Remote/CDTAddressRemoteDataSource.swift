//
//  CDTAddressRemoteDataSource.swift
//  Mobile2you
//
//  Created by Marina Bearzi on 19/03/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import Moya
import RxSwift

open class CDTAddressRemoteDataSource {
    
    let provider = MoyaProvider<CDTAddressService>()
    
    func checkZip(request: CepRequest) -> Single<Response> {
        return provider.rx.request(.checkZip(request: request))
    }
}
