//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Karen Rodriguez on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable, Equatable {
    var name: String
    var isAdded: Bool
    var imageData: Data
}
