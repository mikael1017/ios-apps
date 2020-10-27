//
//  AddPageViewController.swift
//  Device tracker
//
//  Created by Jaewoo Cho on 10/16/20.
//

import UIKit

class AddPageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var DeviceNameField: UITextField!
    var quantityPicker = UIPickerView()
    @IBOutlet weak var quantityField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraTapped: UIBarButtonItem!
    var pickerController = UIImagePickerController()
    var quantities: [String] = []
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quantityPicker.dataSource = self
        quantityPicker.delegate = self
        quantityField.inputView = quantityPicker
        
        dismissPickerView(textField: quantityField)
        dismissPickerView(textField: DeviceNameField)
        
        addButton.layer.cornerRadius = addButton.bounds.size.height / 2
        for x in 1...10 {
            quantities.append(String(x))
        }
        pickerController.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        quantityPicker.selectRow(0, inComponent: 0, animated: false)
        quantityField.text = "\(quantities[quantityPicker.selectedRow(inComponent: 0)])"
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imageView.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    @IBAction func addTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newDevice = Device(context: context)
            if let name = DeviceNameField.text {
                newDevice.name = name
            }
            if let quantityInt = quantityField.text {
                if let quantityInt16 = Int16(quantityInt) {
                    newDevice.quantity = quantityInt16
                }
            }
            newDevice.image = imageView.image?.jpegData(compressionQuality: 1.0)
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            navigationController?.popViewController(animated: true)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
    }
    
    func dismissPickerView(textField: UITextField) {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        if textField == self.DeviceNameField {
            let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelBtnClicked))
            toolBar.setItems([cancelButton, flexibleSpace, button], animated: true)
        } else if textField == self.quantityField {
            let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelBtnClickedQty))
            toolBar.setItems([cancelButton, flexibleSpace, button], animated: true)
        }
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        

    }
    

    @objc func cancelBtnClickedQty() {
        
        view.endEditing(true)
        self.quantityField.text = nil
    }
    @objc func cancelBtnClicked() {
        
        view.endEditing(true)
        self.DeviceNameField.text = nil
    }
    @objc func action() {
        view.endEditing(true)
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
        quantityPicker.selectRow(row, inComponent: component, animated: false)
        quantityField.text = quantities[row]
    }
}
