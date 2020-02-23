//
//  CDTTransfersRepository.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import EVReflection

open class CDTTransfersRepository: M2YRepository {
    static let remoteDataSource = CDTTransfersRemoteDataSource()

    open static func getBankTransfers(request: AccountIdRequest, success: @escaping ([GetBankTransferResponse])->(), error: @escaping (String)->()) -> Disposable {

        return remoteDataSource.getBankTransfers(request: request).singleSubscribe(onSuccess: { (response: [GetBankTransferResponse]) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func getP2PTransfers(request: AccountIdRequest, success: @escaping ([P2PTransferResponse]) -> (), error: @escaping (String) -> ()) -> Disposable {
        return remoteDataSource.getP2PTransfers(request: request).singleSubscribe(onSuccess: { (response: [P2PTransferResponse]) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func createBankTransfer(request: TransferPasswordRequest, success:@escaping (GetBankTransferResponse)->(), error:@escaping(String)->()) -> Disposable {
        return remoteDataSource.createBankTransfer(request: request).singleSubscribe(onSuccess: { (response: GetBankTransferResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func createP2PTransfer(request: TransferPasswordRequest, success:@escaping(P2PTransferResponse)->(), error:@escaping(String)->()) -> Disposable {
        return remoteDataSource.createP2PTransfer(request: request).singleSubscribe(onSuccess: { (response: P2PTransferResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func getBankTransferDetail(request: AdjustmentIdRequest, success:@escaping(GetBankTransferResponse)->(), error:@escaping(String)->()) -> Disposable {
        return remoteDataSource.getBankTransferDetail(request: request).singleSubscribe(onSuccess: { (response: GetBankTransferResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }
}
