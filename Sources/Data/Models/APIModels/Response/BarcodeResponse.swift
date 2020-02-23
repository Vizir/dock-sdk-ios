//
//  PaymentResponse.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 11/10/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

open class BarcodeResponse: M2YModel {
    open var Message: BarcodeMessage?
    open var DataReturn: BarcodeDataReturn?
    open var barCodePaymentDetail: BarCodePaymentDetail? // isso aqui eh montado por nos
}

open class BarcodeMessage: M2YModel {
    open var MessageId: NSNumber?
    open var Title: String?
    open var Message: String?
}

open class BarcodeDataReturn: M2YModel {
    open var Barcode: String?
    open var Result: BarcodeDataReturnResult?
}

open class BarcodeDataReturnResult: M2YModel {
    open var Success: NSNumber?
    open var Message: BarcodeMessage?
    open var BillPaymentTypeId: NSNumber?
    open var BillPaymentTypeDescription: String?
    open var HasEnoughBalance: NSNumber?
    open var WasPaid: NSNumber?
    open var PaymentSchedulingDate: String?
    open var ReachedLimit: NSNumber?
    open var ValidateBarCode: BarcodeValidateBarcode?
    open var PaymentInfoNPC: PaymentInfoNPC?
}

open class BarcodeValidateBarcode: M2YModel {
    open var Id: NSNumber?
    open var Description: String?
    open var Value: String?
    open var DueDate: String?
    open var IsOutTime: NSNumber?
    open var TimeWindow: NSNumber?
    open var MinTime: String?
    open var MaxTime: String?
    open var IsDefaultTime: NSNumber?
    open var PaymentType: NSNumber?
    open var HasDueDate: NSNumber?
    open var BarCodeNumber: String?
    open var CurrentDate: String?
}

open class PaymentInfoNPC: M2YModel {
    open var Id: NSNumber?
    open var ContractNumber: String?
    open var IdentificationNumber: String?
    open var DueDate: String?
    open var BillValue: NSNumber?
    open var TaxBreakValue: NSNumber?
    open var PaymentLimitDate: String?
    open var OpeningPaymentschedule: String?
    open var ClosingPaymentschedule: String?
    open var IsValidDate: NSNumber?
    open var IsBeforeWindow: NSNumber?
    open var IsValidWindow: NSNumber?
    open var NextUtilDay: String?
    open var BarCodeNumber: String?
    open var DigitavelLine: String?
    open var ReceivingDivergentValue: ReceivingDivergentValue?
    open var ReceiptRules: ReceiptRules?
    open var Traders: Traders?
    open var ComputedBillValues: ComputedBillValues?
    open var BillStatus: BillStatus?
    open var Params: Params?
}

open class Traders: M2YModel {
    open var Recipient: String?
    open var RecipientDocument: String?
    open var PayerName: String?
    open var PayerDocument: String?
}

open class ComputedBillValues: M2YModel {
    open var CalculatedInterestAmount: NSNumber?
    open var CalculatedFineValue: NSNumber?
    open var DiscountValueCalculated: NSNumber?
    open var TotalAmountToCharge: NSNumber?
    open var PaymentAmountUpdated: NSNumber?
    open var ComputedDate: String?
}

open class ReceivingDivergentValue: M2YModel {
    open var Code: NSNumber?
    open var Description: String?
}

open class ReceiptRules: M2YModel {
    open var TypeOfPaymentMin: String?
    open var TypeOfPaymentMax: String?
    open var MinPaymentValue: NSNumber?
    open var MaxPaymentValue: NSNumber?
}

open class BillStatus: M2YModel {
    open var Code: NSNumber?
    open var Description: String?
}

open class Params: M2YModel {
    open var OutOfDate: NSNumber?
    open var AptoForPayment: NSNumber?
    open var BlockPaymentOfDate: NSNumber?
}

open class ReceiptPaymentResponse: M2YModel {
    open var id: NSNumber?
    open var idAdjustment: NSNumber?
    open var idIssuer: NSNumber?
    open var uniqueIdDablan: String?
    open var account: NSNumber?
    open var amount: String?
    open var barCodeNumber: String?
    open var barCode: String?
    open var dueDate: String?
    open var _description: String?
    open var status: String?
    open var value: NSNumber?
    open var discount: NSNumber?
    open var taxValue: NSNumber?
    open var transactionDate: String?
    open var uniqueId: String?
    open var name: String?
    open var cpfOrCNPJ: String?
    open var interest: String?
    open var fine: NSNumber?
    open var charges: NSNumber?
    
    override open func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "_description",keyInResource: "description")]
    }
}

open class PaymentResponse: M2YModel {
    open var uniqueId: String?
    open var status: String?
    open var barCodeNumber: String?
    open var dueDate: String?
    open var assignor: String?
    open var value: NSNumber?
    open var discount: NSNumber?
    open var taxValue: NSNumber?
    open var transactionDate: String?
}
