//
//  ViewController.swift
//  MusicLibrary
//
//  Created by Harshit Prasad on 19/01/19.
//  Copyright © 2019 Harshit Prasad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
    }

    // MARK: Actions
    @IBAction func enterButton(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
    @IBAction func selectImageFromPhotoGallery(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        
        // This code ensures that when user taps on select image option
        // the keyboard is dismissed.
        
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controllers which helps
        // user to pick image from gallery.
        let imagePickerController = UIImagePickerController()
        
        // Only pick photo, not take.
        
        // .photoLibrary access the camera roll.
        imagePickerController.sourceType = .photoLibrary
        
        // Handle the image pick through delegate callback.
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }

    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss if the user cancels to upload image.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // This gives chance to do something with the image picked.
        // In this case, we'll pick and display the image.
        
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            else {
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selectedimage.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
}

