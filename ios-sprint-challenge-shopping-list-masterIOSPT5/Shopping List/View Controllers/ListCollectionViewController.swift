//
//  ListCollectionViewController.swift
//  Shopping List
//
//  Created by David Williams on 2/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


var numberOfItems = 0

protocol ShoppingListDelegate: class {
    func shouldBeAdded()
}

class ListCollectionViewController: UICollectionViewController {
    
 
    let shoppingController = ShoppingController()
   
    var delegate: ShoppingListDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return shoppingController.itemNames.count
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SubmitOrderSegue" {
            guard let submitOrderVC = segue.destination as? ShoppingListViewController else { return }
            submitOrderVC.shoppingController = shoppingController
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as? ListCollectionViewCell else { return UICollectionViewCell()}
    
        let item = shoppingController.itemNames[indexPath.item]
        cell.itemImage.image = UIImage(named: item.name)
        cell.itemNameLabel.text = item.name
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // check to see if already added, then numberOfItems -= 1 (watch for less than 0 amount)
        numberOfItems += 1
        UserDefaults.standard.set(true, forKey: .added)
//       let userDefaults = UserDefaults.standard
//       userDefaults.bool(forKey: .added)
       delegate?.shouldBeAdded()
        shoppingController.saveToPersistentStore()
      print("item at \(indexPath.item) tapped with \(numberOfItems) taps")
    }
    
    // MARK: UICollectionViewDelegate
    func shouldBeAdded() {
        shoppingController.items
        self.collectionView?.reloadData()
    }
}

extension String {
    static var added = "added"
}
