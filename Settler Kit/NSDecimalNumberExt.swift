//
//  NSDecimalNumberExt.swift
//  Settler Kit
//
//  Created by N Hoppe on 2016-03-23.
//  Copyright © 2016 Natan Hoppe. All rights reserved.
//

import Foundation

extension NSDecimalNumber {
    func toCurrencyString() -> String {
        let formatter = NSNumberFormatter()
        formatter.positiveFormat = "$ 0.00"
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "en_CA")
        
        return formatter.stringFromNumber(self)!
    }
}
