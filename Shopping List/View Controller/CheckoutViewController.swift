//
//  CheckoutViewController.swift
//  Shopping List
//
//  Created by Nikita Thomas on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    var shoppingItemController: ShoppingItemController?
    
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBAction func placeOrderButton(_ sender: Any) {
        //Notification
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateViews()
    }
    
    func updateViews() {
        let addedItems = shoppingItemController?.items.filter({ $0.added })
        itemCountLabel.text = "You currently have \(addedItems?.count ?? 0) item(s) in your shopping cart"
    }


}
