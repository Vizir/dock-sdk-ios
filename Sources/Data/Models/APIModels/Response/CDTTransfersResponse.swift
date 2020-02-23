//
//  CDTTransfersRepository.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation

open class BankTransfersResponse: M2YModel{
    open var id: NSNumber?
    open var idAdjustment: NSNumber?
    open var transactionCode: String?
    open var idIssuer: NSNumber?
    open var _description :String?
    open var idOriginAccount: NSNumber?
    open var value: NSNumber?
    open var typeAccountFavored: String?
    open var nameFavored: String?
    open var bankFavored: NSNumber?
    open var agencyFavored: NSNumber?
    open var digitAgencyFavored: String?
    open var accountFavored: NSNumber?
    open var digitAccountFavored: String?
    open var cnabFileName: String?
    open var statusTransfer: String?
    open var tariffCode: String?
    open var transferenceDate: String?
    open var transferSuccess: String?
    open var codStatusTransfer: String?
    open var uid: String?
    open var bankName: String?
    open var cpfCnpjFavored: NSNumber?

    override open func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "_description",keyInResource: "description")]
    }

    open func getTransferData() -> String{
        var dataString = "\(self.nameFavored ?? "")\n"
        dataString += "\(self.bankName ?? "")\n"
        dataString += "\("agency".localized) \(self.agencyFavored?.stringValue ?? "")\n"
        dataString += "\("account".localized) \(self.accountFavored?.stringValue ?? "")-\(self.digitAccountFavored ?? "")"
        return dataString
    }

    open func getFullDateToDisplay() -> String{
        guard let transferenceDate = self.transferenceDate else { return ""}
        if let date = transferenceDate.detectDates?.first, let day = date.toString(withFormat: "dd/MM/yyyy"), let hour = date.toString(withFormat: "hh:mm") {
            return "\(day) às \(hour)h"
        }
        return ""
    }
}
