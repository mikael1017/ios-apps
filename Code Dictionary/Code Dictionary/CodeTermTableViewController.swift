//
//  CodeTermTableViewController.swift
//  Code Dictionary
//
//  Created by Jaewoo Cho on 10/14/20.
//

import UIKit


class CodeTermTableViewController: UITableViewController {
    
    var terms: [Term] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let term1 = Term()
        term1.name = "Boolean"
        term1.definition = "A type that is true or false."
        term1.isType = true
        terms.append(term1)
        
        let term2 = Term()
        
        term2.name = "Double"
        term2.definition = "A type that is a number with decimal."
        term2.isType = true
        terms.append(term2)
        
        
        let term3 = Term()
        term3.name = "If Statement"
        term3.definition = "Code that allows us to go one way or another"
        term3.isType = false
        terms.append(term3)
        
    }


    //  How many rows?
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return terms.count
    }

    //  executed number of row times
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if terms[indexPath.row].isType {
            cell.textLabel?.text = terms[indexPath.row].name + " - Type"
        } else {
            cell.textLabel?.text = terms[indexPath.row].name
        }
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        let selectedTerm = terms[indexPath.row]
        
        performSegue(withIdentifier: "goToDefinition", sender: selectedTerm)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let codeVC = segue.destination as! DefinitionViewController
        let selectedTerm = sender as! Term
        codeVC.term = selectedTerm
        
        
    }
    
    
}
