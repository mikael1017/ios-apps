//
//  addViewController.swift
//  ToDo List
//
//  Created by Jaewoo Cho on 10/15/20.
//

import UIKit

class addViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    var choreTableVC : TableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //  when addbutton is tapped
    @IBAction func addButton(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newChore = ToDoItem(context: context)
            if let name = nameField.text {
                newChore.name = name
                newChore.important = importantSwitch.isOn
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)
            }
        }
 

    }
}
