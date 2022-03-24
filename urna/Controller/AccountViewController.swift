//
//  AccountViewController.swift
//  urna
//
//  Created by imac44 on 23.03.2022.
//

import UIKit

class AccountViewController: UIViewController {
    
    var user: User = User(login: "admin", password: "admin", email: "dubo@sfedu.ru", image: "user photo", name: "Gosha", gender: .male)
    
    
    @IBOutlet var username: [UILabel]! {
        didSet {
            username[0].text = user.name
            username[1].text = user.name
        }
    }
    @IBOutlet var gender: UILabel!
    @IBOutlet var email: UILabel!  {
        didSet {
            email.text = user.email
        }
    }
    @IBOutlet var password: UILabel! {
        didSet {
            password.text = user.password
        }
    }
    @IBOutlet var userAvatar: UIImageView! {
        didSet {
            userAvatar.image  = UIImage(named: user.image)
            userAvatar.layer.cornerRadius = 25.0
            userAvatar.layer.masksToBounds = true
        }
    
    }
    @IBOutlet var addImage: UIButton! {
        didSet {
            addImage.layer.cornerRadius = 15.0
            addImage.setTitle("", for: .normal)
        }
    }
    // MARK: - choose user photo
    @IBAction func pickUserImage() {
        let photoSourceRequestController = UIAlertController(title: "", message: "Choose your photo avatar", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .camera
                imagePicker.delegate = self
                self.present(imagePicker, animated: true, completion: nil)
                
            }
        })
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {(action) in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                imagePicker.delegate = self
                self.present(imagePicker, animated: true, completion: nil)
            }
        })
        
        photoSourceRequestController.addAction(cameraAction)
        photoSourceRequestController.addAction(photoLibraryAction)
        
        present(photoSourceRequestController, animated: true, completion: nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}

extension AccountViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            userAvatar.image = selectedImage
            userAvatar.contentMode = .scaleToFill
            userAvatar.clipsToBounds = true
        }
        
        dismiss(animated: true, completion: nil)
        
    }
}
