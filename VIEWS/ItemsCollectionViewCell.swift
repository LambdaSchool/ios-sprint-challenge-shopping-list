//
//  ItemsCollectionViewCell.swift
//  Shopping List
//
//  Created by B$hady on 6/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var addedLabel: UILabel!
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
   func updateViews() {
          if let item = item {
              itemNameLabel.text = item.name
              itemImageView.image = UIImage(named: item.imageName)
              if item.added == true {
                  addedLabel.text = "Added"
              } else {
                  addedLabel.text = "Not Added"
              }
          }
          
      }
}
