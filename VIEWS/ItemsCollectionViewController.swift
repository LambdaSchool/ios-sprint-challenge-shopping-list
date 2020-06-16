//
//  ItemsCollectionViewController.swift
//  Shopping List
//
//  Created by B$hady on 6/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ItemsCollectionViewController: UICollectionViewController {
    
    
    let shoppingItemControlla = shoppingItemController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailVCSegue" {
            if let detailVC = segue.destination as? ShoppingListDetailViewController {
                detailVC.shoppingItemController = shoppingItemControlla
            }
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemControlla.itemNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ItemsCollectionViewCell else { return UICollectionViewCell() }
        cell.item = shoppingItemControlla.shoppingItems[indexPath.item]
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shoppingItemControlla.shoppingItems[indexPath.item].added.toggle()
        collectionView.reloadData()
        shoppingItemControlla.saveToPersistentStore()
    }
}
