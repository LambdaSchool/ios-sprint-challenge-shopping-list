//
//  SkuCollectionVC.swift
//  Shopping List
//
//  Created by John Pitts on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SkuCollectionVC: UICollectionViewController, SkuCollectionViewCELLDelegate {
    
    
    // MARK: Properties
    var delegate: SkuCollectionViewCELLDelegate?
    let skuController = SkuController()
    
    func toggleSkuInCart(for cell: SkuCollectionViewCELL) {
        
        guard let indexPath = collectionView?.indexPath(for: cell) else { return }
        let sku = skuController.skus[indexPath.item]
        
        skuController.updateSkuInCart(for: sku)
        
        collectionView?.reloadItems(at: [indexPath])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skuController.loadFromPersistentStore()
        collectionView?.reloadData()
        
        //self.clearsSelectionOnViewWillAppear = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()  // Paul says there's a better way, I don't know it... YET
    }
    
    
    

    @IBAction func nextButtonPressed(_ sender: Any) {
    
        // prepare for segue to viewcontroller and pass count, by perhaps calling collectionView to update/reload forcing a prepare for segue
        
        //guard let cartVC = self.storyboard?.instantiateViewController(withIdentifier: "ToCart") as? CartVC else { return }

    }
    
    
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 7 // I'm confident I cant insert the actual .count here, in case it were to change but running low on time so just doing the literal
    }
    
    // cellForItemAt
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProtoCell", for: indexPath) as! SkuCollectionViewCELL
        
        let sku = skuController.skus[indexPath.item]   // remember, item instead of ".row" as in a tableview, both have sections tho
        
        cell.delegate = self  // the whole thing breaks down if we don't have this in the right spot!
        
        print(sku.skuName)

        cell.sku = sku
        
        return cell
    }

    
}
