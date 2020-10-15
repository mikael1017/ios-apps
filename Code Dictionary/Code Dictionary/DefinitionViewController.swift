//
//  DefinitionViewController.swift
//  Code Dictionary
//
//  Created by Jaewoo Cho on 10/14/20.
//

import UIKit

class DefinitionViewController: UIViewController {

    var term = Term()
    
    @IBOutlet weak var definitionText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        title = term.name
        definitionText.text = term.definition
        if term.isType {
            definitionText.textColor = .purple
        }
    }
    

   

}
