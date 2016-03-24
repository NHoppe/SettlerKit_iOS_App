//
//  UIViewControllerExt.swift
//  Settler Kit
//
//  Source: http://stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}