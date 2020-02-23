//
//  ContaRequest.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 25/09/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation
import EVReflection

open class ContaRequest: M2YModel {
    open var conta: Int?
}

open class PageRequest: M2YModel {
    open var page: Int?
}

open class IdRequest: M2YModel {
    open var id: Int?
}

open class IdStringRequest: M2YModel {
    open var id: String?
}

open class IdPessoaRequest: M2YModel {
    open var idPessoa: Int?
}

open class IdContaRequest: M2YModel {
    open var idConta: Int?
}

open class RegisterPasswordRequest: M2YModel {
    open var id: Int?
    open var senha: String?
}

open class CPFRequest: M2YModel {
    open var cpf: String?
    convenience init(cpf: String) {
        self.init()
        self.cpf = cpf
    }
}

open class EnvRequest: M2YModel {
    open var env: String?
}

open class ValidateAccountRequest: M2YModel {
    open var accountId: String?
    open var code: String?
}

open class TransferRequest: EVNetworkingObject {
    open var originalAccount: Int?
    open var destinationAccount: Int?
    open var amount: String?
    open var _description: String?

    override open func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "_description",keyInResource: "description")]
    }
}

open class LocalTransferRequest: M2YModel {
    open var originalAccount: Int?
    open var destinationAccount: Int?
    open var destinationCpf: String?
    open var destinationName: String?
    open var destinationNickname: String?
    open var amount: String?
    open var desc: String?
}

open class BankTransferRequestMock: M2YModel {
    open var bank: String?
    open var destinationAgency: String?
    open var destinationCnpj: String?
    open var destinationAccountType: String?
    open var originalAccount: Int?
    open var destinationAccount: Int?
    open var destinationCpf: String?
    open var destinationName: String?
    open var destinationNickname: String?
    open var amount: String?
    open var desc: String?
    open var accountType: String?
}

open class BankTransferRequest: EVNetworkingObject {
    open var idOriginAccount: Int?
    open var identificator: Int? = 123
    open var subIssuerCode: String? = "123"
    open var _description: String?
    open var value: String?
    open var beneficiary: Beneficiary?

    override open func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "_description",keyInResource: "description")]
    }
}

open class Beneficiary: M2YModel {
    open var type: String?
    open var docIdCpfCnpjEinSSN: NSNumber?
    open var name: String?
    open var bankId: NSNumber?
    open var agency: NSNumber?
    open var agencyDigit: String?
    open var account: NSNumber?
    open var accountDigit: String?
    open var accountType: String?
}

open class BankTransferRequestResponse: M2YModel {
    open var idOriginAccount: NSNumber?
    open var identificator: NSNumber?
    open var subIssuerCode: String?
    open var _description: String?
    open var beneficiary: Beneficiary?
    open var value: String?
    open var date: String?
    open var transactionCode: String?
    open var idAdjustment: String?

    override open func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "_description",keyInResource: "description")]
    }
}

open class GetBankTransferResponse: M2YModel {
    open var id: NSNumber?
    open var idAdjustment: NSNumber?
    open var transactionCode: String?
    open var idIssuer: NSNumber?
    open var _description: String?
    open var idOriginAccount: NSNumber?
    open var value: NSNumber?
    open var typeAccountFavored: String?
    open var nameFavored: String?
    open var bankFavored: String?
    open var agencyFavored: NSNumber?
    open var digitAgencyFavored: String?
    open var accountFavored: NSNumber?
    open var digitAccountFavored: String?
    open var cnabFileName: String?
    open var statusTransfer: String?
    open var trariffCode: String?
    open var transferenceDate: String?
    open var cpfCnpjFavored: String?
    open var uid: String?
    open var accountType: String?
    open var beneficiary: Beneficiary?
    open var bankName: String?
    open var isFromFavorites: NSNumber?
    open var destinationAccountId: NSNumber?

    override open func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "_description",keyInResource: "description")]
    }

    //MARK: - Account formatted
    open func getAccountFavoretedFormatted() -> String {
        if let beneficiary = self.beneficiary {
            if let digitAccountFavoreted = beneficiary.accountDigit, digitAccountFavoreted != "" {
                return "\(self.beneficiary?.account ?? 0)" + "-" + digitAccountFavoreted
            } else {
                return "\(self.beneficiary?.account ?? 0)"
            }
        } else {
            if let digitAccountFavoreted = self.digitAccountFavored, digitAccountFavoreted != "" {
                return "\(self.accountFavored ?? 0)" + "-" + digitAccountFavoreted
            } else {
                return "\(self.accountFavored ?? 0)"
            }
        }
    }


    //MARK: - Agency formatted
    open func getAgencyFavoretedFormatted() -> String {
        if let beneficiary = self.beneficiary {
            if let digitAgencyFavoreted = beneficiary.agencyDigit {
                if digitAgencyFavoreted != "" { 
                    return getAgencyWithZerosInBeneficiary() + "-" + digitAgencyFavoreted
                } else {
                    return getAgencyWithZerosInBeneficiary()
                }
            } else {
                return getAgencyWithZerosInBeneficiary()
            }
        } else {
            if let digitAgencyFavoreted = self.digitAgencyFavored, digitAgencyFavoreted != "" {
                return getAgencyWithZeros() + "-" + digitAgencyFavoreted
            } else {
                return getAgencyWithZeros()
            }
        }
    }

    open func getAgencyWithZerosInBeneficiary() -> String {
        let accountNumbers = "\(self.beneficiary?.agency ?? 0)".count

        if (4-accountNumbers > 0) {
            var account = ""

            for _ in 0..<(4-accountNumbers) {
                account.append("0")
            }

            account.append("\(self.beneficiary?.agency ?? 0)")

            return account
        }

        return "\(self.beneficiary?.agency ?? 0)"
    }

    open func getAgencyWithZeros() -> String {
        let accountNumbers = "\(self.agencyFavored ?? 0)".count

        if (4-accountNumbers > 0) {
            var account = ""

            for _ in 0..<(4-accountNumbers) {
                account.append("0")
            }

            account.append("\(self.agencyFavored ?? 0)")

            return account
        }

        return "\(self.agencyFavored ?? 0)"
    }

    //MARK: - Bank formatted
    open func getBankFavoretedFormatted() -> String {
        if self.beneficiary != nil {
            return getBankWithZerosInBeneficiary()
        } else {
            return getBankWithZeros()
        }
    }

    open func getBankWithZerosInBeneficiary() -> String {
        let accountNumbers = "\(self.beneficiary?.bankId ?? 0)".count

        if (4-accountNumbers > 0) {
            var account = ""

            for _ in 0..<(3-accountNumbers) {
                account.append("0")
            }

            account.append("\(self.beneficiary?.bankId ?? 0)")

            return account
        }

        return "\(self.beneficiary?.bankId ?? 0)"
    }

    open func getBankWithZeros() -> String {
        let accountNumbers = (self.bankFavored ?? "").count

        if (4-accountNumbers > 0) {
            var account = ""

            for _ in 0..<(3-accountNumbers) {
                account.append("0")
            }

            account.append(self.bankFavored ?? "")

            return account
        }

        return self.bankFavored ?? ""
    }
}

open class LockCardRequest: M2YModel {
    open var id_status: Int?
    open var observacao: String?
}
