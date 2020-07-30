//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Tiger Mei on 18.06.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var numberOfPeople: Int = 0
    var tipPercentage: String = "0%"
    var tip: Double = 0.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = "\(tip)"
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(tipPercentage) tip."

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
