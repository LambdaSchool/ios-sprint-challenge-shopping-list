//
//  Sku.swift
//  Shopping List
//
//  Created by John Pitts on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class Sku: Codable {  //to get rid of error
    
    
    var skuName: String
    var skuImageName: String
    var skuInCart: Bool
    
    init(skuName: String, skuImageName: String, skuInCart: Bool = false) {  //i want "not added"
        self.skuName = skuName
        self.skuImageName = skuImageName
        //see SkuController file for "imageName"
        self.skuInCart = skuInCart
    }
    
    
}

extension Sku: Equatable {
    
    static func == (lhs: Sku, rhs: Sku) -> Bool {
        return
            lhs.skuName == rhs.skuName //&&
        //       lhs.skuImageName == rhs.skuImageName &&
        //     lhs.skuInCart == rhs.skuInCart    Really think this would be a bad idea to include this
    }
}

