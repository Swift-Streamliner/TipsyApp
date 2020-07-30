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
    
    var tip: Double = 0.0
    var numberOfPeople = 2
    var tipPercentage: String = "0%"

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        print(sender.value)
        splitNumberLabel.text = "\(Int(sender.value))"
        numberOfPeople = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if zeroPctButton.isSelected {
            if let buttonTitle = zeroPctButton?.titleLabel?.text {
                tipPercentage = buttonTitle
            }
        }
        else if tenPctButton.isSelected {
            if let buttonTitle = tenPctButton?.titleLabel?.text {
                tipPercentage = buttonTitle
            }
        }
        else if twentyPctButton.isSelected {
            if let buttonTitle = twentyPctButton?.titleLabel?.text {
                tipPercentage = buttonTitle
            }
        }
        //Remove the last character (%) from the title then turn it back into a String.
        let buttonTitleMinusPercentSign =  String(tipPercentage.dropLast())
        //Turn the String into a Double.
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
        if let cost = Double(bilTextField.text!) {
            tip = cost * (buttonTitleAsANumber / 100) / Double(numberOfPeople)
            tip = (tip * 100).rounded() / 100
            performSegue(withIdentifier: "resultSegue", sender: self)
        } else {
            print("invalid input")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            let destination = segue.destination as! ResultsViewController
            destination.numberOfPeople = numberOfPeople
            destination.tipPercentage = tipPercentage
            destination.tip = tip
        }
    }
}

