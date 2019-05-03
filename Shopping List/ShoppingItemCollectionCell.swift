//
//  ShoppingItemCollectionCell.swift
//  Shopping List
//
//  Created by Michael Redig on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionCell: UICollectionViewCell {
	@IBOutlet var itemImageView: UIImageView! {
		didSet {
			updateViews()
		}
	}
	
	@IBOutlet var itemLabel: UILabel!
	
	var shoppingItem: ShoppingItem? {
		didSet {
			updateViews()
		}
	}
	
	func updateViews() {
		itemImageView.layer.cornerRadius = 15
		guard let item = shoppingItem else { return }
		itemLabel.text = item.imageName.capitalized
		let filename = item.inCart ? "\(item.imageName) 2" : item.imageName
		itemImageView.image = UIImage(named: filename)
		itemImageView.alpha = item.inCart ? 1.0 : 0.2
	}
}
