//
//  CardsRemoteDataSource.swift
//  Mobile2you
//
//  Created by Victor Catão on 05/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import UIKit
import Moya
import RxSwift

open class CardsRemoteDataSource {

    let provider = MoyaProvider<CardsService>()

    func getCards(request: IdContaRequest) -> Single<Response>{
        return provider.rx.request(.getCards(request: request))
    }

    func validatePassword(request: PasswordCardRequest) -> Single<Response>{
        return provider.rx.request(.validatePassword(request: request))
    }

    func registerPassword(request: RegisterPasswordRequest) -> Single<Response>{
        return provider.rx.request(.registerPassword(request: request))
    }
    
    func changeCardPassword(request: ValidatePasswordRequest) -> Single<Response>{
        return provider.rx.request(.changeCardPassword(request: request))
    }

    func unlockCard(request: UnlockCardRequest) -> Single<Response>{
        return provider.rx.request(.unlockCard(request: request))
    }

    func lockCard(request: BlockCardRequest) -> Single<Response>{
        return provider.rx.request(.lockCard(request: request))
    }
    
    func cancelCard(request: CancelCardRequest) -> Single<Response>{
        return provider.rx.request(.cancelCard(request: request))
    }

    func checkCardStatus(request: IdRequest) -> Single<Response>{
        return provider.rx.request(.checkCardStatus(request: request))
    }

    func activateCard(request: ActivateCardRequest) -> Single<Response>{
       return provider.rx.request(.activateCard(request: request))
    }
}
