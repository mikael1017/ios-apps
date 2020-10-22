//
//  DeviceHomeTableViewController.swift
//  Device tracker
//
//  Created by Jaewoo Cho on 10/16/20.
//

import UIKit

class DeviceHomeTableViewController: UITableViewController {
    var devices : [Device] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCoreDataInfo()
    }
    
    func getCoreDataInfo() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataDevices = try? context.fetch(Device.fetchRequest()) as? [Device] {
                devices = coreDataDevices
                tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let device = devices[indexPath.row]
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                context.delete(device)
                getCoreDataInfo()
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
        var device = devices[indexPath.row]
        let deviceQuantity = String(device.quantity)
        cell.textLabel?.text = device.name! + "       Quantity: " + deviceQuantity
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDevice = devices[indexPath.row]
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
