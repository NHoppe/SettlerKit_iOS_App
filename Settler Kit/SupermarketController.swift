//
//  ViewController.swift
//  Settler Kit
//
//  Created by N Hoppe on 2016-03-23.
//  Copyright © 2016 Natan Hoppe. All rights reserved.
//

import UIKit

class SupermarketController: UIViewController, UITextFieldDelegate  {

    let kgToLbRatio: NSDecimalNumber! = 2.20462
    let lbToKgRatio: NSDecimalNumber! = 0.453592
    
    @IBOutlet weak var priceInputField: UITextField!
    @IBOutlet weak var weightInputSegment: UISegmentedControl!
    
    @IBOutlet weak var calculateBtn: UIButton!
    
    @IBOutlet weak var convPriceLabel: UILabel!
    @IBOutlet weak var convPriceValue: UILabel!
    
    var btnText = "Convert to Price per "
    var opositeWeight: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.hideKeyboardWhenTappedAround()
        
        priceInputField.delegate = self
        
        priceInputField.keyboardType = UIKeyboardType.DecimalPad
        
        convPriceLabel.text = ""
        convPriceValue.text = ""
        weightInputSegment.selectedSegmentIndex = 0
        opositeWeight = "Kilogram (kg)"

        calculateBtn.setTitle(btnText + opositeWeight, forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Delegates
    
    func textField(textField: UITextField,shouldChangeCharactersInRange range: NSRange,replacementString string: String) -> Bool
    {
        let countdots = textField.text!.componentsSeparatedByString(".").count - 1
        
        if countdots > 0 && string == "."
        {
            return false
        }
        return true
    }
    
    // MARK: Actions
    
    
    @IBAction func weightSelection(sender: UISegmentedControl) {
        if(sender == weightInputSegment) {
            switch weightInputSegment.selectedSegmentIndex {
            case 1: // per Kilogram
                opositeWeight = "Pound (lb)"
            default: // per Pound
                opositeWeight = "Kilogram (kg)"
            }
            
            calculateBtn.setTitle(btnText + opositeWeight, forState: .Normal)
        }
    }
    
    @IBAction func calculate(sender: UIButton) {
        if(sender == calculateBtn) {
            if(priceInputField.text!.isEmpty) {
                return
            }

            self.view.endEditing(true)
            
            var convRatio: NSDecimalNumber = 0.0
            
            let priceValue = priceInputField.text!.toDecimal()
            
            switch (weightInputSegment.selectedSegmentIndex) {
            case 1: // From Kg to Lb
                convPriceLabel.text = "Price per Pound (lb)"
                convRatio = kgToLbRatio
                
            default: // From Lb to Kg
                convPriceLabel.text = "Price per Kilogram (kg)"
                convRatio = lbToKgRatio
            }
            
            let convertedPrice: NSDecimalNumber = priceValue.decimalNumberByMultiplyingBy(convRatio)
            
            convPriceValue.text = convertedPrice.toCurrencyString()
        }
    }
}

