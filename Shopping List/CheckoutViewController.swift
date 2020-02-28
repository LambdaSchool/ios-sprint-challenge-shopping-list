//
//  CheckoutViewController.swift
//  Shopping List
//
//  Created by Mark Gerrior on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol DeliveryAlertDelegate {
    func showDeliveryAlert()
}

class CheckoutViewController: UIViewController {

    var cartItemCount = 2
    var cartController: CartController?
    var alertDeligate: DeliveryAlertDelegate?
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBAction func send(_ sender: Any) {
        var showAlert = false
        
        if let name = nameTextField.text,
            let address = addressTextField.text {
        
            cartController?.name = name
            cartController?.address = address
            
            showAlert = true
        }
        
        navigationController?.popViewController(animated: true)
        
        // TODO: Being paranoid. Want the dismiss first before I call this.
        // Not sure I'm happy with this. Given this will be a timed delay thing, maybe it's OK? Would prefer to "send a message" and not still be in this code during alert.
        if showAlert == true {
            alertDeligate?.showDeliveryAlert()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        var descriptionText = ""
        
        switch cartItemCount {
        case 0:
            descriptionText = "Your shopping list is empty."
        case 1:
            descriptionText = "You currently have \(cartItemCount) item in your shopping list."
        default:
            descriptionText = "You currently have \(cartItemCount) items in your shopping list."
        }
        
        descriptionLabel.text = descriptionText
    }
}
