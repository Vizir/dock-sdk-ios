//
//  CDTPaymentRequest.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation

open class TransferPasswordRequest: M2YModel {
    //PayAccountRequest
    open var barCodeNumber: String?
    open var dueDate: String?
    open var assignor: String?
    open var discount: NSNumber?
    open var taxValue: NSNumber?
    //Bank Tranfer request
    open var idOriginAccount: String?
    open var identificator: String?
    open var subIssuerCode: String?
    open var beneficiary: BankTransferBeneficiary?
    //P2P Transfer request
    open var originalAccount: String?
    open var destinationAccount: String?
    //Recharge request
    open var orderId: String?
    open var ddd: String?
    open var phoneNumber: String?
    open var dealerCode: String?
    open var dealerName: String?
    open var amountKey: NSNumber?
    open var registerAsFavorite: Bool?
    //Favorite Transfer
    open var name: String?
    open var cpf: String?
    open var bankCode: String?
    open var agency: String?
    open var account: String?
    open var digit: String?
    open var nickname: String?
    open var accountType: String?
    //Generic
    open var accountId: NSNumber?
    open var amount: String?
    open var _description: String?
    open var value: String?
    open var cardId: NSNumber?
    open var password: String? //card Password

    open var cardNumber: NSNumber?
    open var creditType: NSNumber?
    open var productCode: NSNumber?
    override open func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "_description",keyInResource: "description")]
    }
    public convenience init(rechargeRequest: RechargeRequest) {
        self.init()
        self.orderId = rechargeRequest.orderId
        self.ddd = rechargeRequest.ddd
        self.phoneNumber = rechargeRequest.phoneNumber
        self.dealerCode = rechargeRequest.dealerCode
        self.dealerName = rechargeRequest.dealerName
        self.amountKey = rechargeRequest.amountKey as NSNumber?
        self.accountId = rechargeRequest.accountId as NSNumber?
        self.amount = String(rechargeRequest.amount ?? 0)
    }
    //    open static func transformPaymentRequestInModel(request: PayAccountRequest) -> TransferPasswordRequest {
    //        let transferRequest = TransferPasswordRequest()
    //
    //        transferRequest.accountId = request.accountId
    //        transferRequest._description = request._description
    //        transferRequest.barCodeNumber = request.barCodeNumber
    //        transferRequest.dueDate = request.dueDate
    //        transferRequest.assignor = request.assignor
    //        transferRequest.discount = request.discount
    //        transferRequest.taxValue = request.taxValue
    //        transferRequest.value = request.value
    //
    //        return transferRequest
    //    }
    //
    //    open static func transformBankTransferRequestInModel(request: BankTransferRequest) -> TransferPasswordRequest {
    //        let transferRequest = TransferPasswordRequest()
    //
    //        transferRequest.idOriginAccount = request.idOriginAccount
    //        transferRequest.identificator = request.identificator
    //        transferRequest.subIssuerCode = request.subIssuerCode
    //        transferRequest._description = request._description
    //        transferRequest.beneficiary = request.beneficiary
    //        transferRequest.value = request.value
    //
    //        return transferRequest
    //    }
    //
    //    open static func transformP2PTransferRequestInModel(request: P2PTransferRequest) -> TransferPasswordRequest {
    //        let transferRequest = TransferPasswordRequest()
    //
    //        transferRequest.originalAccount = request.originalAccount
    //        transferRequest.destinationAccount = request.destinationAccount
    //        transferRequest.amount = request.amount
    //        transferRequest._description = request._description
    //
    //        return transferRequest
    //    }
    //
    //    open static func transformConfirmRechargeRequestInModel(request: ConfirmRechargeRequest) -> TransferPasswordRequest {
    //        let transferRequest = TransferPasswordRequest()
    //
    //        transferRequest.orderId = request.orderId
    //        transferRequest.accountId = request.accountId
    //        transferRequest.ddd = request.ddd
    //        transferRequest.phoneNumber = request.phoneNumber
    //        transferRequest.dealerCode = request.dealerCode
    //        transferRequest.amount = request.amount
    //        transferRequest.amountKey = request.amountKey
    //
    //        return transferRequest
    //    }
    //
    //    open static func transformCreateRechargeInModel(request: ConfirmRechargeRequest) -> TransferPasswordRequest {
    //        let transferRequest = TransferPasswordRequest()
    //
    //        transferRequest.ddd = request.ddd
    //        transferRequest.phoneNumber = request.phoneNumber
    //        transferRequest.dealerCode = request.dealerCode
    //        transferRequest.dealerName = request.dealerName
    //
    //        return transferRequest
    //    }
}
open class ValidateBarcodeRequest: M2YModel {
    open var barCode: String?
}
open class AdjustmentIdRequest: M2YModel {
    open var idAdjustment: Int?
}
open class BankTransferBeneficiary: M2YModel {
    open var type: String?
    open var docIdCpfCnpjEinSSN: String?
    open var name: String?
    open var bankId: String?
    open var agency: String?
    open var agencyDigit: String?
    open var account: String?
    open var accountDigit: String?
    open var accountType: String?
}
