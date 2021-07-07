//
//  SkuCollectionViewCELLDelegate.swift
//  Shopping List
//
//  Created by John Pitts on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol SkuCollectionViewCELLDelegate: class {
    
    func toggleSkuInCart(for cell: SkuCollectionViewCELL)
}

