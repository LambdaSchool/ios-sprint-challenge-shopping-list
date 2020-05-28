//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Bryan Cress on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable {
    var name: String
    var addedToCart: Bool = false
     var image: UIImage? {
            return UIImage(named: name)
        }
     }
