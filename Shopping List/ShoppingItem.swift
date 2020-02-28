//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Mark Gerrior on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable, Codable {
    var itemName: String
    var onShoppingList: Bool
    var imageName: String
}
