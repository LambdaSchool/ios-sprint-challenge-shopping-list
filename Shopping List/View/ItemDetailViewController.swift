//
//  ItemDetailViewController.swift
//  Shopping List
//
//  Created by Dillon McElhinney on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import Photos

class ItemDetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // MARK: - Properties
    var shoppingItemController: ShoppingItemController?
    var shoppingItem: ShoppingItem?

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var addItemButton: UIButton!
    @IBOutlet weak var deleteItemButton: UIButton!
    @IBOutlet var swipeRecognizer: UISwipeGestureRecognizer!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }

    // MARK: UI Methods
    @IBAction func addImage(_ sender: Any) {
        // CHeck Authorization Status
        let status = PHPhotoLibrary.authorizationStatus()
        
        if status == .authorized {
            // If authorized, present image picker
            presentImagePickerController()
        } else if status == .notDetermined {
            // If not determined, ask for authorization
            PHPhotoLibrary.requestAuthorization { (status) in
                if status == .authorized {
                    // If it comes back authorized, present the image picker
                    self.presentImagePickerController()
                }
            }
        } else {
            // TODO: - Handle denied access
        }
    }
    
    @IBAction func addShoppingItem(_ sender: Any) {
        view.endEditing(true)
        guard let name = nameTextField.text, !name.isEmpty,
            let image = itemImageView.image, let imageData = UIImagePNGRepresentation(image) else { return }
        
        if let shoppingItem = shoppingItem {
            shoppingItemController?.update(shoppingItem: shoppingItem, name: name, imageData: imageData)
        } else {
            shoppingItemController?.createShoppingItem(name: name, imageData: imageData, isOnShoppingList: false)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteShoppingItem(_ sender: Any) {
        view.endEditing(true)
        guard let shoppingItem = shoppingItem else { return }
        
        shoppingItemController?.delete(shoppingItem)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - UI Image Picker Controller Delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        addImageButton.setTitle("Change Image", for: .normal)
        picker.dismiss(animated: true, completion: nil)
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        itemImageView.image = image
    }
    
    // MARK: - Private Utility Methods
    private func updateViews() {
        deleteItemButton.isHidden = true
        guard let shoppingItem = shoppingItem else { return }
        
        nameTextField.text = shoppingItem.name
        itemImageView.image = UIImage(data: shoppingItem.imageData)
        addImageButton.setTitle("Change Image", for: .normal)
        addItemButton.setTitle("Update Shopping Item", for: .normal)
        deleteItemButton.isHidden = false
        swipeRecognizer.direction = .down
    }
    
    // Method to present the image picker controller
    private func presentImagePickerController() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
}
