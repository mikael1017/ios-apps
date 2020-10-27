//
//  ViewController.swift
//  Device tracker
//
//  Created by Jaewoo Cho on 10/15/20.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedDevice : Device? = nil
    @IBOutlet weak var imageField: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let selectedDevice = selectedDevice {
            let deviceQuantity = "\(selectedDevice.quantity)"
            let deviceName = selectedDevice.name
            title = deviceName! + " - total: " + deviceQuantity + " devices"
            if let imageData = selectedDevice.image {
                imageField?.image = UIImage(data: imageData)
            }
        }
    }


}

