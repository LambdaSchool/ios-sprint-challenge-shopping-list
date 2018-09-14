//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Paul Yi on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    
    // MARK:- Initializer using UserDefaults
    init() {
        let hasLaunced = UserDefaults.standard.bool(forKey: hasLaunchedKey)
        
        if !hasLaunced {
            // Default shopping items
            let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
            
            for i in itemNames {
                createShoppingItem(with: i, image: UIImage(named: i) ?? UIImage())
            }
            
            UserDefaults.standard.set(true, forKey: hasLaunchedKey)
        }
    }
    
    // MARK:- CRUD methods
    
    // Create a new shopping item instance and add it to an array of shopping items
    func createShoppingItem(with name: String, image: UIImage) {
        guard let imageData = UIImagePNGRepresentation(image) else { return }
        
        let item = ShoppingItem(name: name, imageData: imageData)
        items.append(item)
        
        saveToPersistentStore()
    }
    
    // Update an existing shopping item object
    func update(item: ShoppingItem, isInShoppingList: Bool) {
        guard let index = items.index(of: item) else { return }
        
        let tempItem = ShoppingItem(name: item.name, imageData: item.imageData, isInShoppingList: isInShoppingList)
        
        items.remove(at: index)
        items.insert(tempItem, at: index)
        
        saveToPersistentStore()
    }
    
    
    // MARK: Persistent store methods
    // Save data to storage
    private func saveToPersistentStore() {
        do {
            guard let itemsFileURL = itemsFileURL else { return }
            let plistEncoder = PropertyListEncoder()
            
            let itemsData = try plistEncoder.encode(items)
            
            // Attempting to write the shopping items data to plist file
            try itemsData.write(to: itemsFileURL)
            
            // If attempt to write data fails, an error is logged:
        } catch { NSLog("Error encoding shopping items: \(error)") }
    }
    
    // Read data from storage
    private func loadFromPersistentStore() {
        do {
            guard let itemsFileURL = itemsFileURL,
                FileManager.default.fileExists(atPath: itemsFileURL.path) else { return }
            let plistDecoder = PropertyListDecoder()
            
            let itemsData = try Data(contentsOf: itemsFileURL)
            
            self.items = try plistDecoder.decode([ShoppingItem].self, from: itemsData)
            
            // If decoding data data fails, an error is logged:
        } catch { NSLog("Error decoding shopping items: \(error)") }
    }
    
    //MARK:- Properties
    // Plist file URL in application documents directory
    private var itemsFileURL: URL? {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
            else { return nil }
        
        let fileName = "shopping-items.plist"
        return directory.appendingPathComponent(fileName)
    }
    
    // Arrays sorted with shopping items that ARE in the shopping list or NOT
    var addedItems: [ShoppingItem] {
        return items.filter { $0.isInShoppingList }
    }
    
    var notAddedItems: [ShoppingItem] {
        return items.filter { !$0.isInShoppingList }
    }
    
    private var hasLaunchedKey = "hasLaunchedKey"
    
    // Shopping items array, publicly accessible but not settable
    private(set) var items: [ShoppingItem] = []
}
