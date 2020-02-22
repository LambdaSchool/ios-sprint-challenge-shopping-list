//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Breena Greek on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable {
    var name: String
    var itemSelected: Bool
    
    
    var image: UIImage {
        return UIImage(named: name)!
    }
        
    
    init(name: String, itemSelected: Bool = false) {
        self.name = name
        self.itemSelected = itemSelected
    }
}
