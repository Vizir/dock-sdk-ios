//
//  CDTBilletRemoteDataSource.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import UIKit
import Moya
import RxSwift

open class CDTBilletRemoteDataSource {

    let provider = MoyaProvider<CDTBilletService>()
    
    func getTickets(request: AccountIdRequest) -> Single<Response>{
       return provider.rx.request(.getTickets(request: request))
    }

    func generateTicket(request: BilletRequest) -> Single<Response>{
        return provider.rx.request(.generateTicket(request: request))
    }
}
