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

    let availableCurrencies = [
        "Australian dollar":		"AUD",
        "Bulgarian lev":			"BGN",
        "Brazilian real":			"BRL",
        "Canadian dollar":          "CAD",
        "Swiss franc":				"CHF",
        "Chinese Yuan Renminbi":	"CNY",
        "Czech koruna":				"CZK",
        "Danish krone":				"DKK",
        "Pound sterling":			"GBP",
        "Hong Kong dollar":			"HKD",
        "Croatian kuna":			"HRK",
        "Hungarian forint":			"HUF",
        "Indonesian rupiah":		"IDR",
        "Israeli new sheqel":		"ILS",
        "Indian rupee":				"INR",
        "Japanese yen":				"JPY",
        "South Korean won":			"KRW",
        "Mexican peso":				"MXN",
        "Malaysian ringgit":		"MYR",
        "Norwegian krone":			"NOK",
        "New Zealand dollar":		"NZD",
        "Philippine Peso":			"PHP",
        "Polish zloty":				"PLN",
        "Romanian leu":				"RON",
        "Russian ruble":			"RUB",
        "Swedish krona":			"SEK",
        "Singapore dollar":			"SGD",
        "Thai baht":				"THB",
        "Turkish lira":				"TRY",
        "United States dollar":		"USD",
        "South African rand":		"ZAR",
        "European euro":			"EUR"
    ]
    
    // http://api.fixer.io/latest?base=USD&symbols=GBP
    let baseUrl = "http://api.fixer.io/latest?base="
    let argUrl = "&symbols="
    
    private func getRateForCurrency(baseCurrency: String, toCurrency: String,
                                    callback: ((requestResponse: Response<AnyObject, NSError>)->Void)?){
        let url = baseUrl + baseCurrency + argUrl + toCurrency
                           
        Alamofire.request(.GET, url).responseJSON { response in
            if (response.result.isSuccess) {
                callback?(requestResponse: response)
            }
        }
    }
    
    func getAvailableCurrencies() -> Array<String> {
        return Array(availableCurrencies.keys).sort()
    }
        
    func getRateFor(baseCurrency: String, toCurrency: String, amount: NSDecimalNumber, rateOutput: UILabel, amountOutput: UILabel) {
        let base = availableCurrencies[baseCurrency]!
        let to = availableCurrencies[toCurrency]!

        if(base == to) {
            rateOutput.text = "N/A"
            amountOutput.text = "N/A"
        } else {
        
            var exchangeRate: NSDecimalNumber = 0
            
            getRateForCurrency(base, toCurrency: to) { (requestResponse) -> Void in
                if requestResponse.result.isSuccess {
                    let reqValue = requestResponse.result.value as! NSDictionary
                    let rateNum = reqValue["rates"]![to] as! Double
                    exchangeRate = NSDecimalNumber(double: rateNum)
                    let convAmount = amount.decimalNumberByMultiplyingBy(exchangeRate)
                    
                    rateOutput.text = exchangeRate.toCurrencyString(to)
                    amountOutput.text = convAmount.toCurrencyString(to)
                }
            }
            
        }
    }
}