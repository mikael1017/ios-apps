//
//  DeviceHomeTableViewController.swift
//  Device tracker
//
//  Created by Jaewoo Cho on 10/16/20.
//

import UIKit

class DeviceHomeTableViewController: UITableViewController {
    var devices : [String:[Device]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDatadevices = try? context.fetch(Device.fetchRequest()) as? [String:[Device]] {
                devices = coreDatadevices
                tableView.reloadData()
            }
        }
    }
    

    // MARK: - Table view data source

 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return devices.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var device = Array(devices.keys)[indexPath.row]
        cell.textLabel?.text = device
            
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDevice = Array(devices)[indexPath.row]
        //performSegue(withIdentifier: "goToComplete", sender: selectedToDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let completeVC = segue.destination as? ViewController {
            if let toDo = sender as? Device {
//                completeVC.toDo = toDo
//                completeVC.choreTableVC = self
                
            }
        }
    }
}
