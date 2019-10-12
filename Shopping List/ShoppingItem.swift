//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Alex Thompson on 10/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
struct ShoppingItems: Codable, Equatable {
    
    var name: String
    var isAdded: Bool
    
    init(name: String, isAdded: Bool = false) {
        self.name = name
        self.isAdded = isAdded
    }
}
