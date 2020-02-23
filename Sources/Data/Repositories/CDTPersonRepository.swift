//
//  CDTPersonRepository.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import RxSwift
import Moya

open class CDTPersonRepository: M2YRepository {

    static let remoteDataSource = CDTPersonRemoteDataSource()

    open static func findPerson(request: IdRequest, success: @escaping (PersonResponse) -> (), error: @escaping (String) -> ()) -> Disposable {
        return remoteDataSource.findPerson(request: request).singleSubscribe(onSuccess: { (response: PersonResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

}
