//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Dillon McElhinney on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable, Codable {
    
    // MARK: - Properties
    var imageData: Data
    var name: String
    var isOnShoppingList: Bool
}
