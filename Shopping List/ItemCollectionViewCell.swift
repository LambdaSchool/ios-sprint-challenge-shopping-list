//
//  ItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Taylor Lyles on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
	
	
	
//	var item: Item? {
//		didSet {
//			updateViews()
//		}
//	}
//
//	func updateViews() {
//		guard let item = item else { return }
//		imageView.image = UIImage
//		label.text = item.name
//
//	}
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var label: UILabel!
}
