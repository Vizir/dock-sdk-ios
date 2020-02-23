//
//  BanksRepository.swift
//  Mobile2you
//
//  Created by Victor Catão on 06/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import EVReflection

open class BanksRepository: M2YRepository {

    static let remoteDataSouce = BanksRemoteDataSource()

    open static func getBanks(success:  @escaping ([BankResponse])->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.getBanks().singleSubscribe(onSuccess: { (response: [BankResponse]) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

}
