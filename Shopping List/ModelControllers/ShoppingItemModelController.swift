//
//  ShoppingItemModelController.swift
//  Shopping List
//
//  Created by Chris Price on 12/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemModelController {
    
    var shoppingList: [ShoppingItem] = []
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        return documents.appendingPathComponent("shopping.plist")
    }
    
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else {return}
        
        do {
            let encoder = PropertyListEncoder()
            let shoppingData = try encoder.encode(shoppingList)
            try shoppingData.write(to: url)
        } catch {
            print("Error saving shopping data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else {return}
        
        do {
            let shoppingData = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingList = try decoder.decode([ShoppingItem].self, from: shoppingData)
        } catch {
            print("Error loading shopping data: \(error)")
        }
    }
}
