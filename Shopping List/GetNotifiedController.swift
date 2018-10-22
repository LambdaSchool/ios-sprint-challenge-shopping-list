//
//  GetNotifiedController.swift
//  Shopping List
//
//  Created by Lotanna on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class GetNotifiedController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    var myItemController: ItemController?
    var mynotifier: Notifier?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadListView()
        
    }
    
    @IBAction func notifyButton(_ sender: UIButton) {
    
        guard let name = nameField.text, !name.isEmpty else { return }
        guard let address = addressField.text, !address.isEmpty else { return }
        guard let itemCount = myItemController?.groceryList.count else { return }
        
        //Ask for notification Permission
        Notifier().AskPermission { success in
            if success {
                Notifier().Notify(name: name, address: address, itemCount: itemCount)
            } else {
                NSLog("Something went wrong trying to notify you")
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    private func reloadListView() {
        guard let myItemController = myItemController else { return }
        let itemCount = myItemController.groceryList.count
        messageLabel.text = "So far, You've added \(itemCount) item\(itemCount == 1 ? "" : "s")!"
    }
    
}





