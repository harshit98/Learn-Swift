//
//  ViewController.swift
//  MathCalculator
//
//  Created by Harshit Prasad on 19/01/19.
//  Copyright © 2019 Harshit Prasad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen:Double = 0
    
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func numericKeypad(_ sender: UIButton) {
        resultLabel.text = resultLabel.text! + String(sender.tag - 1)
        numberOnScreen = Double(resultLabel.text!)!
    }
    
    @IBAction func actionButtons(_ sender: UIButton) {
        if (resultLabel.text != "" && sender.tag != 12 && sender.tag != 19) {
            if (sender.tag == 15) {               // Division
                resultLabel.text = "/"
            } else if (sender.tag == 16) {        // Multiplication
                resultLabel.text = "x"
            } else if (sender.tag == 17) {        // Subraction
                resultLabel.text = "-"
            } else if (sender.tag == 18) {        // Addition
                resultLabel.text = "+"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

