//
//  RegistrationViewController.swift
//  urna
//
//  Created by imac44 on 15.03.2022.
//
import SafariServices
import UIKit

class RegistrationViewController: UIViewController  {
    
    private let socialLinks = ["https:google.com", "https://vk.com", "https://facebook.com"]
    
    // MARK: - Outlets
    
    @IBOutlet var nameTextField: RoundedTextField!
    @IBOutlet var emailTextField: RoundedTextField!
    @IBOutlet var passwordTextField: RoundedTextField!
    @IBAction func buttonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0: openWithSafariViewController(socialLink: socialLinks[0])
        case 1: openWithSafariViewController(socialLink: socialLinks[1])
        case 2: openWithSafariViewController(socialLink: socialLinks[2])
        default: break
        }
    }
    
    // MARK: - ViewDidLoad method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = ""
        
        nameTextField.tag = 4
        nameTextField.becomeFirstResponder()
        nameTextField.autocorrectionType = .no
        nameTextField.delegate = self
        
        emailTextField.tag = 5
        emailTextField.autocorrectionType = .no
        emailTextField.delegate = self
        
        passwordTextField.tag = 6
        passwordTextField.autocorrectionType = .no
        
        // move view to the top when keyboard appear
        //NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        //NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Hide the keyboard
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - Open with safari function
    
    func openWithSafariViewController(socialLink: String?) {
        guard let socialLink = socialLink else {
        return
        }
        if let url = URL(string: socialLink) {
            let safariController = SFSafariViewController(url: url)
            present (safariController, animated: true, completion: nil)
        }
    }
    
    // MARK: - Button Actions
    
    @IBAction func registButtonTapped(sender: UIButton) {
        [nameTextField, emailTextField, passwordTextField].forEach({ $0?.text = "123" })
        if nameTextField.text == "" || emailTextField.text == "" || passwordTextField.text == "" {
            let alertController = UIAlertController(title: "Oops", message: "We can't create a new account because one of the fields is blank. Please note that all fields are required.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBarController = storyboard.instantiateInitialViewController()!
            view.window?.windowScene?.windows.first?.rootViewController = tabBarController
        }
    }
    // func for work with keyboard
//    @objc func keyboardWillShow(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0 {
//                self.view.frame.origin.y -= keyboardSize.height
//                NSLayoutConstraint().constant = keyboardSize.height
//            }
//        }
//    }
//
//    @objc func keyboardWillHide(notification: NSNotification) {
//        if self.view.frame.origin.y != 0 {
//            self.view.frame.origin.y = 0
//        }
//    }
}

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = view.viewWithTag(textField.tag + 1) {
            textField.resignFirstResponder()
            nextTextField.becomeFirstResponder()
        }
        return true
    }
}
