//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by patelpra on 6/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable, Codable {
    var name: String
    var hasBeenAdded: Bool
    
    init(withName name: String, withHasBeenAdded hasBeenAdded: Bool = false) {
        self.name = name
        self.hasBeenAdded = hasBeenAdded
    }
}
