//
//  CreateReceiptResponse.swift
//  Mobile2you
//
//  Created by Victor Catão on 06/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

open class CreateReceiptResponse: M2YModel {
    open var numeroDoDocumento: String?
    open var dataProcessamento: String?
    open var dataDocumento: String?
    open var dataVencimento: String?
    open var dataFechamento: String?
    open var valorBoleto: String?
    open var nomeBeneficiario: String?
    open var documentoBeneficiario: String?
    open var agencia: String?
    open var codigoBeneficiario: String?
    open var numeroConvenio: String?
    open var digitoCodigoBeneficiario: String?
    open var carteira: String?
    open var nossoNumero: String?
    open var digitoNossoNumero: String?
    open var banco: String?
    open var aceite: NSNumber?
    open var especieDoDocumento: String?
    open var especie: String?
    open var instrucoes: [String]?
    open var locaisDePagamento: [String]?
    open var nomePagador: String?
    open var documentoPagador: String?
    open var logradouroPagador: String?
    open var bairroPagador: String?
    open var cepPagador: String?
    open var cidadePagador: String?
    open var ufPagador: String?
    open var codigoDeBarras: String?
    open var linhaDigitavel: String?
    open var id: NSNumber?
    open var idConta: NSNumber?
    open var enderecoCobrancaBeneficiario:String?
    open var status: NSNumber?
    open var boletoRegistrado: NSNumber?
}
