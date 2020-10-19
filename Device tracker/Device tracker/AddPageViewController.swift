//
//  AddPageViewController.swift
//  Device tracker
//
//  Created by Jaewoo Cho on 10/16/20.
//

import UIKit

class AddPageViewController: UIViewController {

    @IBOutlet weak var DeviceNameField: UITextField!
    var quantityPicker = UIPickerView()
    @IBOutlet weak var quantityField: UITextField!
    
    var quantities: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quantityPicker.dataSource = self
        quantityPicker.delegate = self
        quantityField.inputView = quantityPicker
        for x in 1...10 {
            quantities.append(String(x))
        }
        // Do any additional setup after loading the view.
    }
}
    
extension AddPageViewController: UIPickerViewDataSource {
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return quantities[row]
    }
        
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return quantities.count
    }
}

extension AddPageViewController: UIPickerViewDelegate {
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        quantityField.text = quantities[row]
    }
}
