//
//  AccountViewController.swift
//  urna
//
//  Created by imac44 on 23.03.2022.
//

import UIKit

class AccountViewController: UIViewController {
    
    private var currentUser = UserManager.shared.currentUser
    
    //MARK: - Outlets
    
    @IBOutlet var username: [UILabel]!
    @IBOutlet var gender: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var password: UILabel!
    @IBOutlet var userAvatar: UIImageView!
    @IBOutlet var addImage: UIButton!
    
    
    // MARK: - Handlers
    @IBOutlet var changeValue: [UIButton]!
    @IBAction func pencilButtonTapped(sender: UIButton) {
        switch sender.tag {
        case 1:
            let controller = PopUpWindowViewController { [weak self] text in
                self?.username[0].text = text
                self?.username[1].text = text
                self?.currentUser?.name = text
                guard let person = self?.currentUser else {
                    return
                }
                UserManager.shared.saveCurrentUser(person: person)
            }
            controller.modalPresentationStyle = .overFullScreen
            self.present(controller, animated: false, completion: nil)
        
        case 2:
            guard let currentGender = currentUser?.gender else {
                return
            }
            let controller = ChangeGenderViewController(currentGender: currentGender) { [weak self] gender in
                if gender == .male {
                    self?.gender.text = "Male"
                } else {
                    self?.gender.text = "Female"
                }
                self?.currentUser?.gender = gender
                guard let person = self?.currentUser else {
                    return
                }
                UserManager.shared.saveCurrentUser(person: person)
            }
            controller.modalPresentationStyle = .overFullScreen
            self.present(controller, animated: false, completion: nil)
        case 3:
            let controller = NewEmailViewConroller { [weak self] text in
                self?.email.text = text
                self?.currentUser?.email = text
                guard let person = self?.currentUser else {
                    return
                }
                UserManager.shared.saveCurrentUser(person: person)
            }
            controller.modalPresentationStyle = .overFullScreen
            self.present(controller, animated: false, completion: nil)
        case 4:
            let controller = NewPasswordViewController { [weak self] text in
                self?.password.text = text
                self?.currentUser?.password = text
                guard let person = self?.currentUser else {
                    return
                }
                UserManager.shared.saveCurrentUser(person: person)
            }
            controller.modalPresentationStyle = .overFullScreen
            self.present(controller, animated: false, completion: nil)
        default:
            print("wrong tag sender")
        }
    }
    @IBAction func logout(sender: UIButton) {
        UserManager.shared.logout()
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController()!
        view.window?.windowScene?.windows.first?.rootViewController = navigationController
        
    }
    
    @IBAction func deleteAccount(sender: UIButton) {
        let controller = DeleteAccountViewController { [weak self] isTapped in
            if isTapped {
                UserManager.shared.deleteAccount()
                let storyboard = UIStoryboard(name: "Auth", bundle: nil)
                let navigationController = storyboard.instantiateInitialViewController()!
                self?.view.window?.windowScene?.windows.first?.rootViewController = navigationController
            }
        }
        controller.modalPresentationStyle = .overFullScreen
        self.present(controller, animated: false, completion: nil)
        
        
        
    }
    
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
        
        //storyboard properties
        
        username[0].text = currentUser?.name ?? ""
        username[1].text = currentUser?.name ?? ""
        gender.text = currentUser?.gender.rawValue
        email.text = currentUser?.email ?? ""
        password.text = currentUser?.password
         
        userAvatar.image  = UIImage(named: currentUser?.image ?? "")
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
    
}

    // MARK: - image picker

    extension AccountViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
            if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                //currentUser?.image = selectedImage
                userAvatar.image = selectedImage
                userAvatar.contentMode = .scaleToFill
                userAvatar.clipsToBounds = true
            }
            dismiss(animated: true, completion: nil)
        }
    }
