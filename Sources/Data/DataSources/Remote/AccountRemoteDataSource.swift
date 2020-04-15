//
//  AccountRemoteDataSource.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 26/09/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import UIKit
import Moya
import RxSwift

open class AccountRemoteDataSource {

    let provider = MoyaProvider<AccountService>()

    func getAbout() -> Single<Response>{
        return provider.rx.request(.getAbout)
    }

    func getAccountIds() -> Single<Response>{
        return provider.rx.request(.getAccountIds)
    }

    func updateAbout(request: UpdateAboutRequest) -> Single<Response> {
        return provider.rx.request(.updateAbout(request: request))
    }

    func checkPassword(request: PasswordRequest) -> Single<Response> {
        return provider.rx.request(.checkPassword(request: request))
    }

    func updatePassword(request: UpdatePasswordRequest) -> Single<Response> {
        return provider.rx.request(.updatePassword(request: request))
    }

    func findAccount(request: IdRequest) -> Single<Response> {
        return provider.rx.request(.findAccount(request: request))
    }

    func sendCode(request: SendTransactionCodeRequest) -> Single<Response> {
        return provider.rx.request(.sendCode(request: request))
    }

    func validateCode(request: CodeRequest) -> Single<Response> {
          return provider.rx.request(.validateCode(request: request))
    }

    func getTermsAndPolitics() -> Single<Response> {
        return provider.rx.request(.getTermsAndPolitics)
    }

    func updatePhoto(request: UIImage) -> Single<Response> {
        return provider.rx.request(.updatePhoto(image: request))
    }

    func registerToken(request: RegisterTokenRequest) -> Single<Response> {
        return provider.rx.request(.registerToken(request: request))
    }

    func getCards(request: IdRequest) -> Single<Response> {
        return provider.rx.request(.getCards(request: request))
    }

    func logout() -> Single<Response> {
        return provider.rx.request(.logout)
    }

    func getAliasBank() -> Single<Response> {
        return provider.rx.request(.getAliasBank)
    }
}
