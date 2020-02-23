//
//  CDTBilletResponse.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 27/02/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation

open class BilletResponse: M2YModel {
   open var id: String?
   open var bank: String?
   open var cdt_id: String?
   open var value: NSNumber?
   open var expiration_date: String?
   open var created_at: String?
   open var account: NSNumber?
   open var pdf_id: String?
   open var bar_code: String?
   open var paid: NSNumber?
   open var accountId: NSNumber?
   open var name: String?
   open var cpf: String?
}
