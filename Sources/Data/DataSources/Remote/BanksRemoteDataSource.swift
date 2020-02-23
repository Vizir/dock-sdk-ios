//
//  BanksRemoteDataSource.swift
//  Mobile2you
//
//  Created by Victor Catão on 06/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation
import Moya
import RxSwift

open class BanksRemoteDataSource {
    
    let provider = MoyaProvider<BanksService>()
    
    func getBanks() -> Single<Response>{
        return provider.rx.request(.getBanks)
    }
    
}
