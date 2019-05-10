//
//  SkuController.swift
//  Shopping List
//
//  Created by John Pitts on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class SkuController {
    
    init() {
        
        //TO DO: if statement will go here to make sure we only load from persistent store once in the beginning.  Will use a boolean check stored in a user default.   
        
        loadFromPersistentStore()
    }
    
    func updateSkuInCart(for sku: Sku) {
        print("update ADDED func called in skuController")
        
        if let index = skus.firstIndex(of: sku) {
            
            print("\(skus[index].skuName)")
            
            // or skus[index].skuInCart = !sku.skuInCart
            skus[index].skuInCart.toggle()
        } else { return }

        
        saveToPersistentStore()
    }
    
    func cartCount() -> Int {
        var addedCount: Int = 0
        for i in 0...6 {
            if skus[i].skuInCart == true {
                addedCount += 1
            }
        }
        return addedCount
    }
    
    
    // Persistent Store funcs
    func saveToPersistentStore() {
        
        guard UserDefaults.standard.bool(forKey: "persistenceStoreInitialized") == false else { return }
            guard let url = shoppingListURL else { return }
        
            let encoder = PropertyListEncoder()
            do {
                let skusData = try encoder.encode(skus)
                try skusData.write(to: url)
            
            UserDefaults.standard.set(true, forKey: "persistenceStoreInitialized")
            
            } catch {
                print(error)
        }
    }
    
    func loadFromPersistentStore() {
        guard let url = shoppingListURL,
            FileManager.default.fileExists(atPath: url.path) else { return }
        
        let decoder = PropertyListDecoder()
        do {
            let data = try Data(contentsOf: url)
            let decodedSkus = try decoder.decode([Sku].self, from: data)
            skus = decodedSkus
        } catch {
            print(error)
        }
    }
    
    /*  this is here just in case I want to do the extra credit later...
     
     func createSku(skuName: String, skuImageName: String) {
     let sku = Sku(skuName: skuName, skuImageName: skuImageName)
     skus.append(sku)
     
     saveToPersistantStore()
     }
     */
    
    //PROPERTIES
    
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let finalURL = documentsDirectory.appendingPathComponent("skus.plist")
        return finalURL
    }
    
    var skus: [Sku] = [
        Sku(skuName: "apple", skuImageName: "apple"),
        Sku(skuName: "grapes", skuImageName: "grapes"),
        Sku(skuName: "milk", skuImageName: "milk"),
        Sku(skuName: "muffin", skuImageName: "muffin"),
        Sku(skuName: "popcorn", skuImageName: "popcorn"),
        Sku(skuName: "soda", skuImageName: "soda"),
        Sku(skuName: "strawberries", skuImageName: "strawberries"),
    ]
}
