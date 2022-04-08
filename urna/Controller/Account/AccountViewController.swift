//
//  AccountViewController.swift
//  urna
//
//  Created by imac44 on 23.03.2022.
//

import UIKit

class AccountViewController: UIViewController {
    
    private let currentUser = UserManager.shared.currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //storyboard properties
         
        username[0].text = currentUser?.name
        username[1].text = currentUser?.name
        //gender.text = currentUser?.gender
        email.text = currentUser?.email
        password.text = currentUser?.password
        
        userAvatar.image  = UIImage(named: currentUser?.image ?? "accIcon")
        userAvatar.layer.cornerRadius = 75.0
        userAvatar.layer.borderWidth = 4
        userAvatar.layer.borderColor = UIColor.white.cgColor
        userAvatar.layer.masksToBounds = true
        
        addImage.layer.cornerRadius = addImage.frame.width / 2.0
        addImage.setTitle("", for: .normal)
        
        for button in changeValue {
            button.setTitle("", for: .normal)
        }
    }
    
    //MARK: - selectors
    
    @IBOutlet var username: [UILabel]!
    @IBOutlet var gender: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var password: UILabel!
    @IBOutlet var userAvatar: UIImageView!
    @IBOutlet var addImage: UIButton!
    
    
    // MARK: - change user information
    @IBOutlet var changeValue: [UIButton]!
    @IBAction func pencilButtonTapped(sender: UIButton) {
        switch sender.tag {
        case 1:
            let controller = PopUpWindowViewController { [weak self] text in
                //self?.user.name = text
                self?.username[0].text = text
                self?.username[1].text = text
            }
            controller.modalPresentationStyle = .overFullScreen
            self.present(controller, animated: false, completion: nil)
        
        case 2:
            let controller = ChangeGenderViewController { [weak self] text in
                //self?.user.gender = text
                self?.gender.text = text
            }
            controller.modalPresentationStyle = .overFullScreen
            self.present(controller, animated: false, completion: nil)
        case 3:
            let controller = NewEmailViewConroller { [weak self] text in
                //self?.user.email = text
                self?.email.text = text
            }
            controller.modalPresentationStyle = .overFullScreen
            self.present(controller, animated: false, completion: nil)
        case 4:
            let controller = NewPasswordViewController { [weak self] text in
                //self?.user.password = text
                self?.password.text = text
            }
            controller.modalPresentationStyle = .overFullScreen
            self.present(controller, animated: false, completion: nil)
        default:
            print("wrong tag sender")
        }
    }
    // MARK: - delete logout buttons
    @IBAction func logout(sender: UIButton) {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController()!
        view.window?.windowScene?.windows.first?.rootViewController = navigationController
    }
    
    @IBAction func deleteAccount(sender: UIButton) {
        let controller = DeleteAccountViewController { [weak self] _ in
            let storyboard = UIStoryboard(name: "Auth", bundle: nil)
            let navigationController = storyboard.instantiateInitialViewController()!
            self?.view.window?.windowScene?.windows.first?.rootViewController = navigationController
        }
        controller.modalPresentationStyle = .overFullScreen
        self.present(controller, animated: false, completion: nil)
        
        
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
