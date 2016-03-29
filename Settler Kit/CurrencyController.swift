//
//  CurrencyController.swift
//  Settler Kit
//
//  Created by N Hoppe on 2016-03-28.
//  Copyright © 2016 Natan Hoppe. All rights reserved.
//

import UIKit

class CurrencyController: UIViewController {
    
    @IBOutlet weak var currencyFromPicker: UIPickerView!
    @IBOutlet weak var currencyToPicker: UIPickerView!
    
    @IBOutlet weak var getRateBtn: UIButton!
    
    @IBOutlet weak var exchangeValue: UILabel!
    
    let currencyFromDelegate = CurrencyPickerDelegate()
    let currencyToDelegate = CurrencyPickerDelegate()
    
    var currencyList: Array<String>! = CurrencyWebService().getAvailableCurrencies()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        exchangeValue.text = ""
        
        currencyFromPicker.delegate = currencyFromDelegate
        currencyFromPicker.dataSource = currencyFromDelegate
        
        currencyToPicker.delegate = currencyToDelegate
        currencyToPicker.dataSource = currencyToDelegate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Action
    
    @IBAction func getRate(sender: UIButton) {
        if(sender == getRateBtn) {
            let from = currencyList[currencyFromPicker.selectedRowInComponent(0)]
            let to = currencyList[currencyToPicker.selectedRowInComponent(0)]
            
            let currencyService = CurrencyWebService()
            
            let rate = currencyService.getRateForCurrency(from, toCurrency: to)
            
            let currencies = currencyService.getCurrencies()
            
            exchangeValue.text = rate.toCurrencyString(currencies[to] as! String)
        }
    }
    
}
