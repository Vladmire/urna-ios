//
//  AccountViewController.swift
//  urna
//
//  Created by imac44 on 23.03.2022.
//

import UIKit

class AccountViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(visualEffectView)
        visualEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        visualEffectView.alpha = 0
    }
    
    var user: User = User(login: "admin", password: "admin", email: "dubo@sfedu.ru", image: "user photo", name: "Gosha", gender: .male)
    //MARK: - properties
    
    lazy var popUpWindow: PopUpWindowAccount = {
        let view = PopUpWindowAccount()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10.0
        view.delegate = self
        return view
    }()
    
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //MARK: - selectors
    
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
            userAvatar.layer.cornerRadius = 75.0
            userAvatar.layer.masksToBounds = true
        }
    
    }
    @IBOutlet var addImage: UIButton! {
        didSet {
            addImage.layer.cornerRadius = addImage.frame.width / 2.0
            addImage.setTitle("", for: .normal)
        }
    }
    // MARK: - change user information
    @IBOutlet var changeValue: [UIButton]! {
        didSet {
            for button in changeValue {
                button.setTitle("", for: .normal)
            }
        }
    }
    @IBAction func pencilButtonTapped(sender: UIButton) {
        if sender.tag == 1 {
            view.addSubview(popUpWindow)
            popUpWindow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
            popUpWindow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            popUpWindow.heightAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
            popUpWindow.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
            
            popUpWindow.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            popUpWindow.alpha = 0
            
            UIView.animate(withDuration: 0.5) {
                self.visualEffectView.alpha = 1
                self.popUpWindow.alpha = 1
                self.popUpWindow.transform = CGAffineTransform.identity
            }
        }
    }
    // MARK: - delete logout buttons
    @IBAction func logout(sender: UIButton) {
        
    }
    @IBAction func deleteAccount(sender: UIButton) {
        
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
    
    
    
    
    
    
    
    // MARK: - change user's settings
    
    
    
    
}

extension AccountViewController: PopUpDelegate {
    func handleDismissal() {
        UIView.animate(withDuration: 0.5, animations: {
            self.visualEffectView.alpha = 0
            self.popUpWindow.alpha = 0
            self.popUpWindow.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }) {(_) in
            self.popUpWindow.removeFromSuperview()
    }
    
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
