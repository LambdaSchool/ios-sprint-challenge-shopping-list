//
//  ShoppingItemsController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_218 on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemsController {
    
    var items: [Item] = []
    var results = [Item(name: "Apple"),
                    Item(name: "Grapes"),
                    Item(name: "Milk"),
                    Item(name: "Muffin"),
                    Item(name: "Popcorn"),
                    Item(name: "Soda"),
                    Item(name: "Strawberries")]
    
    
    
    var addedItems: [Item] = []
    
    func pickedItem(_ itme: Item) {
        addedItems.append(itme)
    }
    
    
    
    
    
    
}
