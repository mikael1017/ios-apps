//
//  TableViewController.swift
//  ToDo List
//
//  Created by Jaewoo Cho on 10/15/20.
//

import UIKit

class TableViewController: UITableViewController {
    var toDos: [ToDoItem] = []
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataToDoItems = try? context.fetch(ToDoItem.fetchRequest()) as? [ToDoItem] {
                toDos = coreDataToDoItems
                tableView.reloadData()
            }
        }
    }
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let toDo = toDos[indexPath.row]
        
        if toDo.important {
            if let name = toDo.name {
                cell.textLabel?.text = "❗️" + name
            }
        } else {
                cell.textLabel?.text = toDo.name
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDo = toDos[indexPath.row]
        performSegue(withIdentifier: "goToComplete", sender: selectedToDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let createVC = segue.destination as? addViewController {
            createVC.choreTableVC = self
        }
        
        if let completeVC = segue.destination as? ViewController {
            if let toDo = sender as? ToDoItem {
                completeVC.toDo = toDo
                completeVC.choreTableVC = self
            }
        }
    }
    
    
    
    
}
