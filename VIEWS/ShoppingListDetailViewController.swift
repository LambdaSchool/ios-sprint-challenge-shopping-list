//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by B$hady on 6/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {
    
    
    @IBOutlet weak var enterName: UITextField!
    @IBOutlet weak var enterAddress: UITextField!
    
    @IBOutlet weak var itemsCountLabel: UILabel!
    
    var shoppingItemController: shoppingItemController?
    
  

        // Do any additional setup after loading the view.
override func viewDidLoad() {
      super.viewDidLoad()
    updateViews()
    }
    
    func updateViews() {
        if let count = shoppingItemController?.addItemCount() {
            itemsCountLabel.text = "You currently have \(count) in your shopping list"
        }
        
        
    }
    
    @IBAction func sendOrderTapped(_ sender: Any) {
        
        let addedItems = shoppingItemController?.shoppingItems.filter { $0.added == true }
        let alert = UIAlertController(title: "Thanks, \(enterName.text ?? "User")", message: "Your order contains \(addedItems?.count ?? 0) items", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}
