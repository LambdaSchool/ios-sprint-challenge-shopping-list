//
//  ShoppingItemsCollectionViewCell.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_218 on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemsCollectionViewCell: UICollectionViewCell {
    var delegate:SelectionDelegate?
  
   
    @IBAction func onChose(_ sender: Any) {
        
        selectedLabel.text = "Added"
               
               
    }
    
    @IBOutlet weak var selectedLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    

  
   
    
  
    
    
    //var delegate:SelectionDelegate?
    var item: Item? {
        
        didSet{
            updateViews()
            
        }
    }
    
    func updateViews() {
        guard let item = item else { return }
      
        itemLabel.text = item.name
        itemImage.image = item.image
        
        let picked = item.isPicked ? "Added" : "Not Added"
        selectedLabel.text = picked
        
       
    }
    
    @objc func onTapImage(){
        
        updateViews()
        
        
    }
    let imageGesture = UITapGestureRecognizer(target: UIImageView.self, action: #selector( onTapImage))
}

