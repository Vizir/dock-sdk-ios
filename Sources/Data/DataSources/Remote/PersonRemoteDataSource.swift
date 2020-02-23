//
//  PersonRemoteDataSource.swift
//  Mobile2you
//
//  Created by Lucas Soares on 21/01/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import UIKit
import Moya
import RxSwift

open class PersonRemoteDataSource {
    
    let provider = MoyaProvider<PersonService>()
    
    func getPerson(request: AccountIdRequest) -> Single<Response>{
        return provider.rx.request(.getPerson(request: request))
    }
    
}

