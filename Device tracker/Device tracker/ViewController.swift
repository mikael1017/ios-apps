//
//  ViewController.swift
//  Device tracker
//
//  Created by Jaewoo Cho on 10/15/20.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedDevice : Device?
    @IBOutlet weak var imageField: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedDevice?.name
        if let imageData = selectedDevice?.image {
            imageField?.image = UIImage(data: imageData)
        }
    }


}

