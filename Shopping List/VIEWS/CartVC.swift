//
//  CartVC.swift
//  Shopping List
//
//  Created by John Pitts on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CartVC: UIViewController {

    
    //collectionView?.delegate = self  // SUNDAY/MONDAY edit
    

    
    override func viewWillAppear(_ animated: Bool) {
        
        cartMessageLabel.text = "You currently have \(skuController.cartCount()) items in your shopping list"
    }
    
    


    @IBAction func sendOrderButtonTapped(_ sender: Any) {
    
        // write optional if let for nameTextField.text to remove forced unwrap !
        
        let alert = UIAlertController(title: "ShoppingList would like to send you Notifications", message: "in order to help process your order \(nameTextField.text!) to \(addressTextField.text!)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Allow", style: .default, handler: /* this syntax just not working and documentation says it should work... { _ in navigationController?.popViewController(animated: true) } */ nil ))
        alert.addAction(UIAlertAction(title: "Don't Allow", style: .destructive, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
       
        
        // need to now show an .actionsheet alert with name and address, similar to above, but this time make it run after user shuts down the app like in the gif.
        
    }
    
   // PROPERTIES

    @IBOutlet var cartMessageLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    
    var addedCount: Int?
    
    var skuController = SkuController()
    var sku: Sku?
}
