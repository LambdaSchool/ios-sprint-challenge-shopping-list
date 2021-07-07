//
//  OrderPlaceViewController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_218 on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderPlaceViewController: UIViewController {
    var count:Int = 3
 
  
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var listLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       updateLabel()
        
    }
    
    @IBAction func sendOrder(_ sender: Any) {
        guard let name = nameTextField.text else { return }
        guard let address = addressTextField.text else { return }
        let alert = UIAlertController(title: "\(name)", message:  "your order of \(String(count)) is ready and will be delivered to \(address)" , preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func updateLabel() {
        listLabel.text? = "There are \(String(count)) items in your list"
      
    }
 

}
