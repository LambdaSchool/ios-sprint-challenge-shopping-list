//
//  PlaceOrderViewController.swift
//  Shopping List
//
//  Created by Dillon McElhinney on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PlaceOrderViewController: UIViewController {
    
    // MARK: - Properties
    var shoppingItemController: ShoppingItemController?
    
    let notificationHelper = NotificationHelper()

    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Utility Methods
    @IBAction func placeOrder(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty,
            let address = addressTextField.text, !address.isEmpty,
            let shoppingItemController = shoppingItemController,
            !shoppingItemController.shoppingItemsOnList.isEmpty else { return }
        let numberOfItems = shoppingItemController.shoppingItemsOnList.count
        
        notificationHelper.getAuthorizationStatus { (status) in
            if status == .authorized {
                // If the user has already granted authorization, schedule the notification
                self.notificationHelper.scheduleDeliveryRequest(name: name, address: address, numberOfItems: numberOfItems)
            } else if status == .notDetermined {
                // If the user hasn't been asked for authorization, ask them
                self.notificationHelper.requestAuthorization(completion: { (success) in
                    if success {
                        self.notificationHelper.scheduleDeliveryRequest(name: name, address: address, numberOfItems: numberOfItems)
                    }
                })
            } else {
                // TODO: - Handle if the user doesn't give authorization
            }
        }
        
        shoppingItemController.resetShoppingList()
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Private Utility Methods
    private func updateViews() {
        guard let shoppingItemController = shoppingItemController else { return }
        let numberOfItems = shoppingItemController.shoppingItemsOnList.count
        orderLabel.text = "Enter your name and address to place order for \(numberOfItems) item\(numberOfItems == 1 ? "" : "s")."
    }
    
}
