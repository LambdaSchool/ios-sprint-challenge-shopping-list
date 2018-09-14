//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Ilgar Ilyasov on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Equatable, Codable {
    
    // MARK: - Properties
    
    var name: String
    var imageData: Data
    var hasBeenAdded: Bool
    
}
