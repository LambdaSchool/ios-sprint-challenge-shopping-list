//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Dillon McElhinney on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController, UIViewControllerPreviewingDelegate {

    // MARK: - Properties
    let shoppingItemController = ShoppingItemController()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: view)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    // MARK: - UI Collection View Data Source
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return shoppingItemController.shoppingItemsOnList.count
        } else {
            return shoppingItemController.shoppingItemsNotOnList.count
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .shoppingItemCellIdentifier, for: indexPath) as! ShoppingItemCollectionViewCell
        let shoppingItem = shoppingItemFor(indexPath)
        
        cell.shoppingItem = shoppingItem
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // Figure out the kind of element
        switch kind {
        case UICollectionElementKindSectionHeader:
            // If it is a section header, dequeue a view with the header identifier
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: .collectionViewSectionHeaderIdentifier, for: indexPath) as!HeaderCollectionReusableView
            if indexPath.section == 0 {
                // If it is in the first section, set the title to items on list
                headerView.headerLabel.text = "Items On List"
                // If it is not empty, enable it
                headerView.headerLabel.isEnabled = !shoppingItemController.shoppingItemsOnList.isEmpty
            } else {
                // If it is not the first section, set the title to items not on list
                headerView.headerLabel.text = "Items Not On List"
                // If it is not empty, enable it
                headerView.headerLabel.isEnabled = !shoppingItemController.shoppingItemsNotOnList.isEmpty
            }
            return headerView
        default:
            // TODO: I'm not sure the right way to handle if I get an element of a different kind. This works for now, but not a final solution.
            NSLog("Got an unexpected element kind")
            return (UICollectionReusableView())
        }
    }
    
    // MARK: - UI Collection View Delegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingItemFor(indexPath)
        shoppingItemController.toggleIsOnList(for: shoppingItem)
        collectionView.reloadData()
    }
    
    // MARK: - UI View Controller Previewing Delegate
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let indexPath = collectionView?.indexPathForItem(at: location),
        let cell = collectionView?.cellForItem(at: indexPath),
        let detailVC = storyboard?.instantiateViewController(withIdentifier: .itemDetailViewIdentifier) as? ItemDetailViewController else { return nil }
        detailVC.shoppingItemController = shoppingItemController
        detailVC.shoppingItem = shoppingItemFor(indexPath)
        
        detailVC.preferredContentSize = CGSize(width: 0.0, height: 260)
        previewingContext.sourceRect = cell.frame
        
        return detailVC
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        showDetailViewController(viewControllerToCommit, sender: self)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == String.placeOrderSegueIdentifier {
            guard let destinationVC = segue.destination as? PlaceOrderViewController else { return }
            destinationVC.shoppingItemController = shoppingItemController
        } else if segue.identifier == String.addItemSegueIdentifier {
            guard let destinationVC = segue.destination as? ItemDetailViewController else { return }
            destinationVC.shoppingItemController = shoppingItemController
        }
    }
    
    @IBAction func unwindToShoppingListCollectionViewController(_ sender: UIStoryboardSegue){}
    
    // MARK: - Private Utility Functions
    private func shoppingItemFor(_ indexPath: IndexPath) -> ShoppingItem {
        if indexPath.section == 0 {
            return shoppingItemController.shoppingItemsOnList[indexPath.item]
        } else {
            return shoppingItemController.shoppingItemsNotOnList[indexPath.item]
        }
    }
}
