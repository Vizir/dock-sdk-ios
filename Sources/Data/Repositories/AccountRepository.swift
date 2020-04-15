//
//  AccountRepository.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 26/09/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import EVReflection

open class AccountRepository: M2YRepository {
    static let remoteDataSouce = AccountRemoteDataSource()

    open static func getAbout(success: @escaping (UserResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.getAbout().singleSubscribe(onSuccess: { (response: UserResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func updateAbout(request: UpdateAboutRequest, success: @escaping (UserResponse)->(), error: @escaping (String) -> ()) -> Disposable {
        return remoteDataSouce.updateAbout(request: request).singleSubscribe(onSuccess: { (response: UserResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func getAccountsIds(success: @escaping (AccountIdsResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.getAccountIds().singleSubscribe(onSuccess: { (response: AccountIdsResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func checkPassword(request: PasswordRequest, success:@escaping()->(), error: @escaping(String)->()) -> Disposable {
        return remoteDataSouce.checkPassword(request: request).singleSubscribe(onSuccess: {
            success()
        }, onError: { (message) in
            error(message)
        })
    }

    open static func updatePassword(request: UpdatePasswordRequest, success:@escaping(UserResponse)->(), error:@escaping(String)->()) -> Disposable {
        return remoteDataSouce.updatePassword(request: request).singleSubscribe(onSuccess: { (response: UserResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func findAccount(request: IdRequest, success:@escaping(AccountResponse)->(), error:@escaping(String)->()) -> Disposable {
        return remoteDataSouce.findAccount(request: request).singleSubscribe(onSuccess: { (response: AccountResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func sendCode(request: SendTransactionCodeRequest, success:@escaping()->(), error:@escaping(String)->()) -> Disposable {
          return remoteDataSouce.sendCode(request: request).singleSubscribe(onSuccess: {
              success()
          }, onError: { (message) in
              error(message)
          })
      }
    
    open static func validateCode(request: CodeRequest, success:@escaping()->(), error:@escaping(String)->()) -> Disposable {
          return remoteDataSouce.validateCode(request: request).singleSubscribe(onSuccess: {
              success()
          }, onError: { (message) in
              error(message)
          })
      }

    open static func getTermsAndPolitics(success:@escaping(TermsAndPoliticsResponse)->(), error:@escaping(String)->()) -> Disposable {
        return remoteDataSouce.getTermsAndPolitics().singleSubscribe(onSuccess: { (response: TermsAndPoliticsResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func updatePhoto(request: UIImage, success:@escaping(UserResponse)->(), error:@escaping(String)->()) -> Disposable {
        return remoteDataSouce.updatePhoto(request: request).singleSubscribe(onSuccess: { (response: UserResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func registerToken(request: RegisterTokenRequest, success:@escaping()->(), error:@escaping(String)->()) -> Disposable {
        return remoteDataSouce.registerToken(request: request).singleSubscribe(onSuccess: {
            success()
        }, onError: { (message) in
            error(message)
        })
    }

    open static func getCards(request: IdRequest, success:@escaping(GetCardsResponse)->(), error:@escaping(String)->()) -> Disposable {
        return remoteDataSouce.getCards(request: request).singleSubscribe(onSuccess: { (response: GetCardsResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func logout(success:@escaping()->(), error:@escaping(String)->()) -> Disposable{
        return remoteDataSouce.logout().singleSubscribe(onSuccess: {
            success()
        }, onError: { (message) in
            error(message)
        })
    }

    open static func getAliasBank(success:@escaping(GetAliasBankResponse)->(), error:@escaping(String)->()) -> Disposable{
        return remoteDataSouce.getAliasBank().singleSubscribe(onSuccess: { (response: GetAliasBankResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

}
