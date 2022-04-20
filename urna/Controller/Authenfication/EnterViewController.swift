//
//  EnterViewController.swift
//  urna
//
//  Created by imac44 on 15.03.2022.
//
import SafariServices
import UIKit

class EnterViewController: UIViewController {

    private let socialLinks = ["https:google.com", "https://vk.com", "https://facebook.com"]
    
    // MARK: - Outlets
    
    @IBOutlet var socialButtons: [UIButton]!
    @IBOutlet var nameTextField: RoundedTextField!
    @IBOutlet var passwordTextField: RoundedTextField!
    @IBAction func buttonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0: openWithSafariViewController(socialLink: socialLinks[0])
        case 1: openWithSafariViewController(socialLink: socialLinks[1])
        case 2: openWithSafariViewController(socialLink: socialLinks[2])
        default: break
        }
    }
    
    @IBAction func enterButtonTapped(sender: UIButton) {
        [nameTextField, passwordTextField].forEach({ $0?.text = "123" })
        
        if nameTextField.text == "" || passwordTextField.text == "" {
            let alertController = UIAlertController(title: "Oops", message: "Please note that all fields are required.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBarController = storyboard.instantiateInitialViewController()!
            view.window?.windowScene?.windows.first?.rootViewController = tabBarController
        }
    }
    //forgot password action
    @IBAction func forgotButtonTapped(sender: UIButton) {
        performSegue(withIdentifier: "forgot", sender: nil)
    }
    
    // MARK: - ViewDidLoad method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = ""
        nameTextField.tag = 4
        nameTextField.becomeFirstResponder()
        nameTextField.autocorrectionType = .no
        nameTextField.delegate = self
        
        passwordTextField.tag = 5
        passwordTextField.autocorrectionType = .no
        passwordTextField.delegate = self
        
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
}

extension EnterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = view.viewWithTag(textField.tag + 1) {
            textField.resignFirstResponder()
            nextTextField.becomeFirstResponder()
        }
        return true
    }
}
