//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var bilTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        print(sender.value)
        splitNumberLabel.text = "\(Int(sender.value))"
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        var tipInPerc = "0%"
        if zeroPctButton.isSelected {
            if let buttonTitle = zeroPctButton?.titleLabel?.text {
                tipInPerc = buttonTitle
            }
        }
        else if tenPctButton.isSelected {
            if let buttonTitle = tenPctButton?.titleLabel?.text {
                tipInPerc = buttonTitle
            }
        }
        else if twentyPctButton.isSelected {
            if let buttonTitle = twentyPctButton?.titleLabel?.text {
                tipInPerc = buttonTitle
            }
        }
        //Remove the last character (%) from the title then turn it back into a String.
        let buttonTitleMinusPercentSign =  String(tipInPerc.dropLast())
        //Turn the String into a Double.
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
        let tip: Double = buttonTitleAsANumber / 100
        print(tip)
        print(splitNumberLabel!.text!)
    }
}

