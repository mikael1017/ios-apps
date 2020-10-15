//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Jaewoo Cho on 10/14/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var total: UITextField!
    
    @IBOutlet weak var tipPercentage: UITextField!
    
    @IBOutlet weak var tipResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculate(_ sender: Any) {

        let totalAmount = Double(total.text!)!
        let tip = Double(tipPercentage.text!)!
        let tipAmount = totalAmount * (tip / 100)
        
        tipResult.text = "Tip amount is $\(Int(tipAmount))"
        

    }
    
}

