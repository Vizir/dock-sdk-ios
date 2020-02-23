//
//  Extract.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 20/09/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation

public enum ExtractIconType {
    case p2pTransfer
    case payment
    case transferBank
}

open class Extract {
    open var id: String?
    open var title: String?
    open var subtitle: String?
    open var value: String?
    open var date: String?
    open var type: ExtractIconType?
    open var formatedDate: Date?
    open var idEventoAjuste: NSNumber?
    open var descricaoAbreviada: String?

    init() {
    }

    init(response: TimelineContent) {
        self.id = response.idTipoTransacaoNaoProcessada?.stringValue
        self.title = response.descricaoAbreviada
        self.subtitle = response.nomeEstabelecimento
        self.idEventoAjuste = response.idEventoAjuste
        self.descricaoAbreviada = response.descricaoAbreviada
        self.date = String(response.dataOrigem?.prefix(10) ?? "")
        if let desc = response.descricaoAbreviada {
            if desc.contains("Pagamento de contas") {
                self.type = .payment
            } else if desc.contains("Transferência entre contas - crédito") {
                self.type = .p2pTransfer
            } else {
//            } else if desc.contains("Transferencia bancária - débito") || desc.contains("Transferencia bancária - crédito") {
                self.type = .transferBank
            }
        }

        if let flagCredito = response.flagCredito?.boolValue {
            if flagCredito {
               self.value = String.floatToBRLFormat(value: response.valorBRL?.floatValue ?? 0.0)
            } else {
                self.value = "- " + String.floatToBRLFormat(value: response.valorBRL?.floatValue ?? 0.0)
            }
        }
    }
}

open class ExtractList {
    open var date: String?
    open var formatedDate: Date?
    open var extracts: [Extract]?
}
