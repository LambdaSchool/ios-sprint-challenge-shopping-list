//
//  Item.swift
//  Shopping List
//
//  Created by Taylor Lyles on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct Item: Equatable {
	
	init(name: String, imageName: String, added: Bool = false) {
		self.name = name
		self.image = UIImage(named: imageName)!
		self.added = added
	}
	
	var name: String
	var image: UIImage
	var added: Bool
}
