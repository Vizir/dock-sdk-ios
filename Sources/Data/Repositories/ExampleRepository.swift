//
//  ExampleRepository.swift
//  Mobile2you
//
//  Created by Mobile2you on 5/21/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import EVReflection

open class ExampleRepository: M2YRepository {

    open static func zen(success: @escaping ()->(), error: @escaping (String)->()) -> Disposable {
        return ExampleRemoteDataSource().zen().subscribe(onSuccess: { (response) in
            response.parse(success: { (response) in
                //converter para a response aqui. ex: UserResponse(data: response.data)
                success()
            }, error: { (statusCode, message) in
                error(message)
            })
            success()
        }, onError: { (subscribeError) in
            self.errorBlock(subscribeError: subscribeError, error: { (message) in
                error(message)
            })
        })
    }

}
