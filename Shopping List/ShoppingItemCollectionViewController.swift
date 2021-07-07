//
//  ShoppingItemCollectionViewController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_218 on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit



class ShoppingItemCollectionViewController: UICollectionViewController{
    
    
    
    func toggleSelected(cell: ShoppingItemsCollectionViewCell) {
        guard let indexPath = collectionView?.indexPath(for: cell) else {return}
        
        let item = shoppingItemController.results[indexPath.row]
        shoppingItemController.pickItem(item:item)
        collectionView?.reloadData()
        
    }
    

    let shoppingItemController = ShoppingItemsController()
    
    var testcount = ShoppingItemsController().addedItems.count
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        

        // Do any additional setup after loading the view.
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "placeOrder" && segue.destination is OrderPlaceViewController{
            let vc = segue.destination as? OrderPlaceViewController
            vc?.count = shoppingItemController.addedItems.count
            
        }
        
    }
    
    

    // MARK: UICollectionViewDataSource
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let addedItem = shoppingItemController.results[indexPath.item]
        shoppingItemController.pickedItem(addedItem)
        
        
        let alert = UIAlertController(title: "Items added", message: "\(addedItem.name) \(shoppingItemController.addedItems.count)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
       
    }
    
    
    
    
    



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.results.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingItemsCollectionViewCell else {return UICollectionViewCell() }
       
    
        let item = shoppingItemController.results[indexPath.row]
       
        
        
        cell.item = item
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    

  

}

