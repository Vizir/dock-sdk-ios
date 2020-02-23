//
//  CDTBankSlipRepository.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import RxSwift
import Moya

open class CDTBankSlipRepository: M2YRepository {

    static let remoteDataSource = CDTBankSlipRemoteDataSource()

    open static func getPDF(request: IdRequest, success: @escaping () -> (), error: @escaping (String) -> ()) -> Disposable {
        return remoteDataSource.getPDF(request: request).singleSubscribe(onSuccess: { () in
            success()
        }, onError: { (message) in
            error(message)
        })
    }

}
