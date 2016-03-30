//
//  CurrencyPickerDelegate.swift
//  Settler Kit
//
//  Created by N Hoppe on 2016-03-28.
//  Copyright © 2016 Natan Hoppe. All rights reserved.
//

import UIKit

class CurrencyPickerDelegate: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var currencyList: Array<String>! = CurrencyWebService().getAvailableCurrencies()
    
    var selectedOption: String! = ""
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyList.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyList[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
    }
}
