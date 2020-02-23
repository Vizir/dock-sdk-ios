//
//  PessoaResponse.swift
//  Mobile2you
//
//  Created by Lucas Soares on 21/01/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation

open class PersonResponse: M2YModel {
    open var id: NSNumber?
    open var nome: String?
    open var tipo: String?
    open var cpf: String?
    open var cnpj: String?
    open var dataNascimento: String?
    open var numeroIdentidade: String?
    open var orgaoExpedidorIdentidade: String?
    open var sexo: String?
    open var unidadeFederativaIdentidade: String?
    open var dataEmissaoIdentidade: String?
}

open class GetPersonResponse: M2YModel {
    open var number: NSNumber?
    open var size: NSNumber?
    open var totalPages: NSNumber?
    open var numberOfElements: NSNumber?
    open var totalElements: NSNumber?
    open var firstPage: NSNumber?
    open var hasPreviousPage: NSNumber?
    open var hasNextPage: NSNumber?
    open var content: [PersonResponse]?
}
