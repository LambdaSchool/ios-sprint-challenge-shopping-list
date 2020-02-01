//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Chris Gonzales on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    // Properties
    
    var shoppingItem: ShoppingItem?{
        didSet{
            updateViews()
        }
    }
    
    //  Outletes
    
    @IBOutlet weak var addedToShoppingListLabel: UILabel!
    
    @IBOutlet weak var shoppingItemImage: UIImageView!
    
    @IBOutlet weak var shoppingItemDescription: UILabel!
    
    // Methods
    
    func updateViews(){
        guard let shoppingItem = shoppingItem else {return}
        shoppingItemImage.image = shoppingItem.image
        shoppingItemDescription.text = shoppingItem.imageName
        if shoppingItem.hasBeenAddedToList{
            addedToShoppingListLabel.text = "Added"
        }else {
            addedToShoppingListLabel.text = "Not Added"
        }
    }
    
}
