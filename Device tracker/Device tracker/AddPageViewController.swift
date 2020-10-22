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
        addButton.layer.cornerRadius = addButton.bounds.size.height / 2
        for x in 1...10 {
            quantities.append(String(x))
        }
        pickerController.delegate = self
        // Do any additional setup after loading the view.
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
                //newDevice.important = importantSwitch.isOn
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)
            }
        }
        navigationController?.popViewController(animated: true)
    }
    @IBAction func cameraTapped(_ sender: Any) {
        pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
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
