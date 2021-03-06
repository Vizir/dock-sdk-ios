//
//  CDTBankSlipRemoteDataSource.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import UIKit
import Moya
import RxSwift

open class CDTBankSlipRemoteDataSource {
    
    let provider = MoyaProvider<CDTBankSlipService>()
    
    func getPDF(request: IdRequest) -> Single<Response>{
        return provider.rx.request(.getPDF(request: request))
    }
    
}
