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
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var nameTextField: RoundedTextField!
    @IBOutlet private var emailTextField: RoundedTextField!
    @IBOutlet private var passwordTextField: RoundedTextField!
    @IBAction private func buttonTapped(_ sender: UIButton) {
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
        
        for (index, textField) in [nameTextField, emailTextField, passwordTextField].enumerated() {
            textField?.tag = 4 + index
            textField?.layer.cornerRadius = 50
            textField?.autocorrectionType = .no
            textField?.spellCheckingType = .no
            textField?.delegate = self
        }
        nameTextField.becomeFirstResponder()
        
        // move view to the top when keyboard appear
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        
        // Hide the keyboard
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func keyboardWillShow(notification:NSNotification) {

        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        //let view =
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
    }

    @objc func keyboardWillHide(notification:NSNotification) {

        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
    }
    
    // MARK: - Open with safari function
    
    private func openWithSafariViewController(socialLink: String?) {
        guard let socialLink = socialLink else {
        return
        }
        if let url = URL(string: socialLink) {
            let safariController = SFSafariViewController(url: url)
            present (safariController, animated: true, completion: nil)
        }
    }
    
    // MARK: - Button Actions
    
    @IBAction private func registButtonTapped(sender: UIButton) {
//        [nameTextField, emailTextField, passwordTextField].forEach({ $0?.text = "123" })
        
        if nameTextField.text == "" || emailTextField.text == "" || passwordTextField.text == "" {
            let alertController = UIAlertController(title: "Oops", message: "We can't create a new account because one of the fields is blank. Please note that all fields are required.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        } else {
            UserManager.shared.signUp(login: nameTextField.text ?? "", password: passwordTextField.text ?? "", email: emailTextField.text ?? "")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBarController = storyboard.instantiateInitialViewController()!
            view.window?.windowScene?.windows.first?.rootViewController = tabBarController
        }
    }
    
}

    // MARK: - NextTextField action

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = view.viewWithTag(textField.tag + 1) {
            textField.resignFirstResponder()
            nextTextField.becomeFirstResponder()
        } else {
            view.endEditing(true)
        }
        return true
    }
}
