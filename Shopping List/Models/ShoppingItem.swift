//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Alex Rhodes on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable {
    let name: String
    let hasBeenAdded: Bool
    
    init(name: String, hasBeenAdded: Bool = false){
        self.name = name
        self.hasBeenAdded = hasBeenAdded
    }
}
