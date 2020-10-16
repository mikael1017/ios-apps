//
//  ViewController.swift
//  ToDo List
//
//  Created by Jaewoo Cho on 10/15/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var note: UILabel!
    var choreTableVC : TableViewController? = nil
    var toDo : ToDoItem? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        if toDo != nil {
            if toDo!.important {
                if let name = toDo!.name {
                    note.text = "❗️" + name
                }
            } else {
                note.text = toDo!.name
            }
        }
        
    }
    
    @IBAction func completeButton(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if toDo != nil {
                context.delete(toDo!)
                navigationController?.popViewController(animated: true)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            }
        }
    }
    
    
    
}
