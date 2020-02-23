//
//  CardsRepository.swift
//  Mobile2you
//
//  Created by Victor Catão on 05/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation
import RxSwift
import Moya

open class CardsRepository: M2YRepository {

    static let remoteDataSouce = CardsRemoteDataSource()

    open static func getCards(request: IdContaRequest, success: @escaping (AccountResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.getCards(request: request).singleSubscribe(onSuccess: { (response: AccountResponse) in
            success(response)
        }) { (message) in
            error(message)
        }
    }

    open static func activateCard(request: ActivateCardRequest, success: @escaping ()->(), error: @escaping (String)->()) -> Disposable {
      return remoteDataSouce.activateCard(request: request).singleSubscribe(onSuccess: {
         success()
      }) { (message) in
         error(message)
      }
    }

    open static func validatePassword(request: PasswordCardRequest,success: @escaping ()->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.validatePassword(request: request).singleSubscribe(onSuccess: {
            success()
        }) { (message) in
            error(message)
        }
    }

    open static func registerPassword(request: RegisterPasswordRequest, success: @escaping ()->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.registerPassword(request: request).singleSubscribe(onSuccess: {
            success()
        }) { (message) in
            error(message)
        }
    }

    open static func changeCardPassword(request: ValidatePasswordRequest,success: @escaping ()->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.changeCardPassword(request: request).singleSubscribe(onSuccess: {
            success()
        }, onError: { (message) in
            error(message)
        })
    }

    open static func unlockCard(request: UnlockCardRequest,success: @escaping (CardResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.unlockCard(request: request).singleSubscribe(onSuccess: { (response: CardResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func lockCard(request: BlockCardRequest, success: @escaping (CardResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.lockCard(request: request).singleSubscribe(onSuccess: { (response: CardResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func cancelCard(request: CancelCardRequest, success: @escaping ()->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.cancelCard(request: request).singleSubscribe(onSuccess: {
            success()
        }, onError: { (message) in
            error(message)
        })
    }
}
