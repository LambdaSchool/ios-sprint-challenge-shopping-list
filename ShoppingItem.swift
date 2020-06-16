//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by B$hady on 6/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable {

    var name: String
    var added: Bool
    var imageName: String
}
