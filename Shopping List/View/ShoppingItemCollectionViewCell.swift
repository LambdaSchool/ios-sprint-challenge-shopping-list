//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Dillon McElhinney on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var shoppingItemImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var isOnShoppingListLabel: UILabel!
    
    //MARK: - Private Utility Functions
    private func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        shoppingItemImageView.image = UIImage(data: shoppingItem.imageData)
        nameLabel.text = shoppingItem.name
        isOnShoppingListLabel.text = shoppingItem.isOnShoppingList ? "Added ✔︎" : "Not Added"
        isOnShoppingListLabel.textColor = shoppingItem.isOnShoppingList ? .red : .black
    }
    
}
