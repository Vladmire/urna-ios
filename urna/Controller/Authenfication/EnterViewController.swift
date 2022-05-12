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
    @IBOutlet private var stackView: UIStackView!
    @IBOutlet private var scrollView: UIScrollView!
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
    
    // MARK: - Handlers
    @IBAction func enterButtonTapped(sender: UIButton) {
        if nameTextField.text == "" || passwordTextField.text == "" {
            let alertController = UIAlertController(title: "Oops", message: "Please note that all fields are required.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        } else {
            if UserManager.shared.login(email: nameTextField.text!, password: passwordTextField.text!) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let tabBarController = storyboard.instantiateInitialViewController()!
                view.window?.windowScene?.windows.first?.rootViewController = tabBarController
            } else {
                nameTextField.text = ""
                passwordTextField.text = ""
                
                let alertController = UIAlertController(title: "Oops", message: "Wrong login or password. Check it again!", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
            }
        }
    }
    @IBAction func forgotButtonTapped(sender: UIButton) {
        performSegue(withIdentifier: "forgot", sender: nil)
    }

    @objc private func togglePassword() {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @objc private func keyboardWillShow(notification:NSNotification) {

        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom =  keyboardFrame.size.height
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
    }

    @objc private func keyboardWillHide(notification:NSNotification) {

        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
    }
    
    
    
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
        passwordTextField.rightView = UIButton.systemButton(with: UIImage(systemName: "eye")!, target: self, action: #selector(togglePassword))
        
        passwordTextField.rightViewMode = .always
        
        // move view to the top when keyboard appear
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        
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
}

    // MARK: - NextTextField action

extension EnterViewController: UITextFieldDelegate {
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
