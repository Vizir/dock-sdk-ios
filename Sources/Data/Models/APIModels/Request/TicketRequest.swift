//
//  TicketRequest.swift
//  Mobile2you
//
//  Created by Victor Catão on 06/12/18.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

open class TicketRequest: M2YModel {
    open var idConta: Int?
    open var tipoBoleto: Int?
    open var valor: String?
    open var dataVencimento: String?
}
