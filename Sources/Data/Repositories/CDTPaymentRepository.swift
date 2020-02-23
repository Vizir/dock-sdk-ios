//
//  CDTPaymentRepository.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import EVReflection

open class CDTPaymentRepository: M2YRepository {

    static let remoteDataSouce = CDTPaymentRemoteDataSource()

    open static func pay(request: TransferPasswordRequest, success: @escaping (ReceiptPaymentResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.pay(request: request).singleSubscribe(onSuccess: { (response: ReceiptPaymentResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func validate(request: ValidateBarcodeRequest, success: @escaping (BarcodeResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.validate(request: request).singleSubscribe(onSuccess: { (response: BarcodeResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func getPaymentList(request: AccountIdRequest,success: @escaping ([ReceiptPaymentResponse])->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.getPaymentList(request: request).singleSubscribe(onSuccess: { (response: [ReceiptPaymentResponse]) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func getPaymentAdjustment(request: IdRequest,success: @escaping (ReceiptPaymentResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.getPaymentAdjustment(request: request).singleSubscribe(onSuccess: { (response: ReceiptPaymentResponse) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }

    open static func getNewPaymentList(request: AccountIdRequest,success: @escaping ([ReceiptPaymentResponse])->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSouce.getNewPaymentList(request: request).singleSubscribe(onSuccess: { (response: [ReceiptPaymentResponse]) in
            success(response)
        }, onError: { (message) in
            error(message)
        })
    }
}
