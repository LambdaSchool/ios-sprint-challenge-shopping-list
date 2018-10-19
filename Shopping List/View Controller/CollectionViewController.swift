//
//  CollectionViewController.swift
//  Shopping List
//
//  Created by Nikita Thomas on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit


class CollectionViewController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadItems() //Temporary until data persistence setup
        collectionView.reloadData()
    }
    
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    func loadItems() {
        for i in itemNames {
            shoppingItemController.create(name: i)
        }
        // SAVE TO FILE
    }

    // MARK: UICollectionViewDataSource
    let reuseIdentifier = "itemCell"
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.items.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        let item = shoppingItemController.items[indexPath.item]
        if item.added {
            cell.addedLabel.text = "Added"
            cell.addedLabel.textColor = .red
        } else {
            cell.addedLabel.text = "Not Added"
            cell.addedLabel.textColor = .black
        }
        
        cell.nameLabel.text = item.name
        cell.image.image = UIImage(named: item.name)
    
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */


    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
}
