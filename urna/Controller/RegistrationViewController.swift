//
//  RegistrationViewController.swift
//  urna
//
//  Created by imac44 on 15.03.2022.
//
import SafariServices
import UIKit

class RegistrationViewController: UIViewController  {
    
    var user: User!
    
    let socialLinks = ["https:google.com", "https://vk.com", "https://facebook.com"]
    
    @IBOutlet var nameTextField: RoundedTextField! {
        didSet {
            nameTextField.tag = 1
            nameTextField.becomeFirstResponder()
        }
    }
    @IBOutlet var emailTextField: RoundedTextField! {
        didSet {
            emailTextField.tag = 2
        }
    }
    @IBOutlet var passwordTextField: RoundedTextField! {
        didSet {
            passwordTextField.tag = 3
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0: openWithSafariViewController(socialLink: socialLinks[0])
        case 1: openWithSafariViewController(socialLink: socialLinks[1])
        case 2: openWithSafariViewController(socialLink: socialLinks[2])
            
        default: break
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = ""
        // Hide the keyboard
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    

    // MARK: - open with safari function
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
        
        
            
            
            user = User()
            
            user.login = nameTextField.text ?? ""
            user.email = emailTextField.text ?? ""
            user.password = passwordTextField.text ?? ""
        
            print("login \(user.login)")
            print("email \(user.email)")
            print("password \(user.password)")
        }
    }
    

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
