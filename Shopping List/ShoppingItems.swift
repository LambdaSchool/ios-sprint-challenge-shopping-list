//
//  ShoppingItems.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_218 on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
struct Item: Equatable {
    
    var name: String
    var isPicked: Bool
    var image: UIImage?
    
    
    init(name: String, isPicked: Bool = false) {
        
        self.name = name
        self.isPicked = isPicked
        self.image = UIImage(named: name)
        
    }
    
}
