//
//  CDTTransfersRemoteDataSource.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import Moya
import RxSwift

open class CDTTransfersRemoteDataSource {
    
    let provider = MoyaProvider<CDTTransferService>()
    
    func getBankTransfers(request: AccountIdRequest) -> Single<Response>{
        return provider.rx.request(.getBankTransfers(request: request))
    }
    
    func getP2PTransfers(request: AccountIdRequest) -> Single<Response> {
        return provider.rx.request(.getP2PTransfers(request: request))
    }
    
    func createBankTransfer(request: TransferPasswordRequest) -> Single<Response> {
        return provider.rx.request(.createBankTransfer(request: request))
    }
    
    func createP2PTransfer(request: TransferPasswordRequest) -> Single<Response> {
        return provider.rx.request(.createP2PTransfer(request: request))
    }
    
    func getBankTransferDetail(request: AdjustmentIdRequest) -> Single<Response> {
        return provider.rx.request(.getBankTransferDetail(request: request))
    }
}
