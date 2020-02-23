//
//  P2PRemoteDataSource.swift
//  Mobile2you
//
//  Created by Victor Catão on 26/02/19.
//  Copyright (c) 2019 Mobile2You. All rights reserved.
//

import Moya
import RxSwift

open class P2PRemoteDataSource {
    
    let provider = MoyaProvider<P2PService>()
    
    func getP2p() -> Single<Response>{
        return provider.rx.request(.getP2p())
    }

    func favoriteP2p(request: P2pFavoriteRequest) -> Single<Response>{
        return provider.rx.request(.favoriteP2p(request: request))
    }
    
    func getP2PAdjustment(request: IdRequest) -> Single<Response>{
        return provider.rx.request(.getP2PAdjustment(request: request))
    }
    
}
