//
//  StringMobile2You.swift
//  Mobile2you
//
//  Created by Mobile2You on 18/12/2017.
//  Copyright © 2017 Mobile2You. All rights reserved.
//

import UIKit

protocol Localizable {
    var localized: String { get }
}

protocol XIBLocalizable {
    var xibLocKey: String? { get set }
}

extension String: Localizable {
    /*
     Utilizado para pegar a localized da string na xib
     */
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

}

extension String {
    public func toDateString(inputFormat: String, outputFormat: String) -> String?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat

        let dateObj = dateFormatter.date(from: self)

        dateFormatter.dateFormat = outputFormat

        if let dateObj = dateObj {
            return dateFormatter.string(from: dateObj)
        } else {
            return self
        }
    }

    var maskCpf: String {
        var currentValue = self
        let diff = 11 - currentValue.count
        if diff > 0 {
            for i in 1 ... diff {
                currentValue.insert("0", at: (currentValue.index(currentValue.startIndex, offsetBy: i - 1)))
            }
        }
        if currentValue.count == 11 {
            currentValue.insert(".", at: (currentValue.index(currentValue.startIndex, offsetBy: 3)))
            currentValue.insert(".", at: (currentValue.index(currentValue.startIndex, offsetBy: 7)))
            currentValue.insert("-", at: (currentValue.index(currentValue.startIndex, offsetBy: 11)))
            return currentValue
        }
        return ""
    }

    static func floatToBRLFormat(value val: Float) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt-BR")
        formatter.numberStyle = .currency

        return formatter.string(from: NSNumber(value: val)) ?? ""
    }

}
