//
//  PersonRepository.swift
//  Mobile2you
//
//  Created by Lucas Soares on 21/01/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import RxSwift
import Moya

open class PersonRepository: M2YRepository {

    static let remoteDataSource = PersonRemoteDataSource()

    open static func getPerson(request: AccountIdRequest, success: @escaping (PersonResponse) -> (), error: @escaping (String) -> ()) -> Disposable {
        return remoteDataSource.getPerson(request: request).singleSubscribe(onSuccess: { (response: PersonResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

}
