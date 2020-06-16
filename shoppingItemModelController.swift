//
//  shoppingItemModelController.swift
//  Shopping List
//
//  Created by B$hady on 6/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class shoppingItemController {
    
    init() {
        if UserDefaults.standard.bool(forKey: "shoppingListLoaded") == true {
            loadFromPersistantStore()
            print("working")
        } else {
            for item in itemNames {
                shoppingItems.append(ShoppingItem(name: item, added: false, imageName: item))
            }
            saveToPersistentStore()
            print("not working")
            UserDefaults.standard.set(true, forKey: "shoppingListLoaded")
        }
    }
    
    func addItemCount() -> Int {
        var count = 0
        for item in shoppingItems {
            if item.added {
                count += 1
            }
        }
        return count
    }
    
    
    var itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var shoppingItems: [ShoppingItem] = []
    
    func itemWasUpdated() {
        saveToPersistentStore()
    }
    
    //MARK: Persistence
    
    var persistentFileURL: URL? {
        let fileMAnager = FileManager.default
        guard let documentsDir = fileMAnager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let shoppingItemsURL = documentsDir.appendingPathComponent("shoppingList.plist")
        return shoppingItemsURL
    }
    
    private func loadFromPersistantStore() {
        guard let fileURL = persistentFileURL else { return }
        do {
            let itemsData = try Data(contentsOf: fileURL)
            let decoder = PropertyListDecoder()
            let itemListArray = try decoder.decode([ShoppingItem].self, from: itemsData )
            self.shoppingItems = itemListArray
        } catch {
            print("error decoding stars: \(error)")
        }
    }

        func saveToPersistentStore() {
        guard let fileURL = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let itemsData = try encoder.encode(shoppingItems)
            try itemsData.write(to: fileURL)
        } catch {
            print("error encoding itemsArray: \(error)")
        }
    }
 }
