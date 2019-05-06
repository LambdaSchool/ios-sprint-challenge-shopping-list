//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Jonathan Ferrer on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
protocol ShoppingItemControllerDelegate {
    func grabTheTotal(for total: ShoppingItemController)
}

class ShoppingItemController{
    init() {
        loadFromPersistentStore()
    }
    
    var shoppingList: [ShoppingItem] = [
            ShoppingItem(name: "Apple", imageName: "apple", added: false),
            ShoppingItem(name: "Grapes", imageName: "grapes", added: false),
            ShoppingItem(name: "Milk", imageName: "milk", added: false),
            ShoppingItem(name: "Muffin", imageName: "muffin", added: false),
            ShoppingItem(name: "Popcorn", imageName: "popcorn", added: false),
            ShoppingItem(name: "Soda", imageName: "soda", added: false),
            ShoppingItem(name: "Strawberries", imageName: "strawberries", added: false)
        
    ]
    
    
    //updates the added propery of ShoppingItem
    
    func updateTotal() -> Int{
        var orderTotal = 0
        for item in shoppingList {
            if item.added == true{
                orderTotal += 1
            }
        }
        return orderTotal
    }
    
    func updateItemHasBeenAdded(shoppingItem: ShoppingItem) {
        guard let itemIndex = shoppingList.firstIndex(of: shoppingItem) else { return }
        if shoppingList[itemIndex].added == false  {
            shoppingList[itemIndex].added = true
            } else {
            shoppingList[itemIndex].added = false
            
            }
       

        saveToPersitentStore()

    }
    // Save to disk
    func saveToPersitentStore() {
        guard let url = persistentURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingList)
            try data.write(to: url)
        } catch {
            print("Error saving stars: \(error)")
        }
    }
    
    // Load from the disk
    func loadFromPersistentStore() {
        // Make sure file exists
        let fileManager = FileManager.default
        guard let url = persistentURL, fileManager.fileExists(atPath: url.path) else {
            print("load failed to find file")
            return }
        
        // Load and decode
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingList = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading data from disk: \(error)")
        }
    }
    
    private var persistentURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        print("Documents: \(documents.path)")
        return documents.appendingPathComponent("shoppingList.plist")
    }
    
}
