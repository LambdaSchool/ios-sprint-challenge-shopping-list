//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Paul Yi on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Equatable, Codable {
    var name: String
    var imageData: Data
    var isAdded: Bool
}
