//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by David Williams on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct Items {
    var name: String
    var image: UIImage
    
    init(name: String, imageName: String) {
        self.name = name
        self.image = UIImage(named: imageName)!
    }
}
