//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Dillon McElhinney on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController {
    // MARK: - Properties
    private(set) var shoppingItems: [ShoppingItem] = []
    
    // Computed property that returns items on the list
    var shoppingItemsOnList: [ShoppingItem] {
        return shoppingItems.filter { (shoppingItem) -> Bool in
            return shoppingItem.isOnShoppingList
        }
    }
    
    // Computed property that returns the items not on the list
    var shoppingItemsNotOnList: [ShoppingItem] {
        return shoppingItems.filter { (shoppingItem) -> Bool in
            return !shoppingItem.isOnShoppingList
        }
    }
    
    // MARK: - Initializers
    init() {
        loadFromPersistentStore()
    }
    
    // MARK: - CRUD Methods
    // Create a new shopping item and add it to the array
    func createShoppingItem(name: String, imageData: Data, isOnShoppingList: Bool) {
        let shoppingItem = ShoppingItem(imageData: imageData, name: name, isOnShoppingList: isOnShoppingList)
        
        shoppingItems.append(shoppingItem)
        saveToPersistentStore()
    }
    
    // Toggle is on shopping list for item
    func toggleIsOnList(for shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        
        shoppingItems[index].isOnShoppingList = !shoppingItems[index].isOnShoppingList
        saveToPersistentStore()
    }
    
    // Reset shopping list
    func resetShoppingList() {
        for index in 0 ..< shoppingItems.count {
            shoppingItems[index].isOnShoppingList = false
        }
        saveToPersistentStore()
    }
    
    // Update an existing shopping item in the array
    func update(shoppingItem: ShoppingItem, name: String, imageData: Data) {
        guard let index = shoppingItems.index(of: shoppingItem) else {
            NSLog("Wasn't able to find the shopping item in the shopping items array")
            return
        }
        
        shoppingItems[index].name = name
        shoppingItems[index].imageData = imageData
        saveToPersistentStore()
    }
    
    // Delete an existing shopping item from the array
    func delete(_ shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        
        shoppingItems.remove(at: index)
        saveToPersistentStore()
    }
    // MARK: - Persistence
    // Computed property to get the path to the shopping items array plist file
    private var persistentStoreURL: URL? {
        guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileName = "shoppingItems.plist"
        
        return documentsURL.appendingPathComponent(fileName)
    }
    
    // Private method to encode the data and write it to disk
    private func saveToPersistentStore() {
        guard let url = persistentStoreURL else { return }
        let plistEncoder = PropertyListEncoder()
        
        do {
            let shoppingItemsData = try plistEncoder.encode(shoppingItems)
            try shoppingItemsData.write(to: url)
        } catch {
            NSLog("Error saving data to persistent store: \(error)")
        }
    }
    
    // Private method to read the data from disk and decode it
    private func loadFromPersistentStore() {
        loadSampleShoppingItems()
        guard let url = persistentStoreURL,
            FileManager.default.fileExists(atPath: url.path) else { return }
        let plistDecoder = PropertyListDecoder()
        
        do {
            let shoppingItemsData = try Data(contentsOf: url)
            shoppingItems = try plistDecoder.decode([ShoppingItem].self, from: shoppingItemsData)
        } catch {
            NSLog("Error reading data from persistent store: \(error)")
        }
    }
    
    // MARK: - Private Utility Methods
    // Private method to load sample items the frist time the user launches the app
    private func loadSampleShoppingItems() {
        // Check if the sample items have been loaded before
        let hasLoadedSamepleItems = UserDefaults.standard.bool(forKey: .hasLoadedSampleItems)
        guard !hasLoadedSamepleItems else { return }
        
        // If not, load them now
        let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
        for item in itemNames {
            if let image = UIImage(named: item), let imageData = UIImagePNGRepresentation(image) {
                createShoppingItem(name: item, imageData: imageData, isOnShoppingList: false)
            }
        }
        UserDefaults.standard.set(true, forKey: .hasLoadedSampleItems)
    }
}
