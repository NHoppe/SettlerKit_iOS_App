//
//  CurrencyWebService.swift
//  Settler Kit
//
//  Created by N Hoppe on 2016-03-23.
//  Copyright © 2016 Natan Hoppe. All rights reserved.
//

import Foundation
import Alamofire

class CurrencyWebService {
    
    // http://api.fixer.io/latest?base=USD&symbols=GBP
    let baseUrl = "http://api.fixer.io/latest?base="
    let argUrl = "&symbols="
    
    func getRateFor(baseCurrency: String, toCurrency: String) {
        let url = baseUrl + baseCurrency + argUrl + toCurrency
        
        Alamofire.request(.GET, url)
            .responseJSON { response in
                print(response)
        }
    }
}