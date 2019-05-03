//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Alex Ladines on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItem {
    var image: UIImage
    var name: String
    var addedToList: Bool
    
    init(image: UIImage, name: String, addedToList: Bool = false) {
        self.image = image
        self.name = name
        self.addedToList = addedToList
    }
}
