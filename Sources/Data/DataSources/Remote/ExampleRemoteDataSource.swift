//
//  ExampleRemoteDataSource.swift
//  Mobile2you
//
//  Created by Mobile2you on 5/11/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import UIKit
import Moya
import RxSwift

open class ExampleRemoteDataSource {
    
    let provider = MoyaProvider<ExampleService>()
    
    func zen() -> Single<Response>{
        return provider.rx.request(.zen)
    }
}
