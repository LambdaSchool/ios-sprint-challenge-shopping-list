//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Nichole Davidson on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

extension String {
    static var itemAdded = "itemAdded"
}
class ShoppingListController: ItemAddedButtonDelegate {
   
    
    var items: [ShoppingCart] = []
    let itemNames = [ShoppingItem(nameOfItem: "Apple", imageName: "apple"),
                    ShoppingItem(nameOfItem: "Grapes", imageName: "grapes"),
                    ShoppingItem(nameOfItem: "Milk", imageName: "milk"),
                    ShoppingItem(nameOfItem: "Muffin", imageName: "muffin"),
                    ShoppingItem(nameOfItem: "Popcorn", imageName: "popcorn"),
                    ShoppingItem(nameOfItem: "Soda", imageName: "soda"),
                    ShoppingItem(nameOfItem: "Strawberries", imageName: "strawberries")]
        
        let itemAdded = UserDefaults.standard.bool(forKey: .itemAdded)

//        if itemAdded {
//            itemAdded.append(ShoppingCart(itemListed: itemListed))
//    }
//        return result

        
        init() {
            loadFromPersistentStore()
        }
   
    var itemsInCart: [ShoppingCart] = []
    
    func itemAddedTappedButton(_ item: ShoppingCart) {
        itemsInCart.append(item)
       }
    
 
    
    var persistentFileURL: URL? {
        
        let fileManager = FileManager.default
        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let itemsURL = documentsDir.appendingPathComponent("info.plist")
        return itemsURL
    }
    
    func saveToPersistentStore() {
       guard let fileURL = persistentFileURL else { return }
       let encoder = PropertyListEncoder()
       do {
           let itemsData = try encoder.encode(items)
           try itemsData.write(to: fileURL)
       } catch {
           print("Error encoding items array: \(error)")
       }
    }
    
    func loadFromPersistentStore() {
        guard let fileURL = persistentFileURL else { return }
        do {
            let itemsData = try Data(contentsOf: fileURL)
            let decoder = PropertyListDecoder()
            let itemsArray = try decoder.decode([ShoppingCart].self, from: itemsData)
            self.items = itemsArray
        } catch {
            print("Error decoding items: \(error)")
        }
    }
}
   

