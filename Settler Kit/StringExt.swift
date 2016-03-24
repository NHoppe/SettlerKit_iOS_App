//
//  StringExt.swift
//  Settler Kit
//
//  Created by N Hoppe on 2016-03-23.
//  Copyright © 2016 Natan Hoppe. All rights reserved.
//

import Foundation

extension String {
    func toDecimal() -> NSDecimalNumber {
        let formatter = NSNumberFormatter()
        formatter.generatesDecimalNumbers = true
        return formatter.numberFromString(self) as? NSDecimalNumber ?? 0
    }
}