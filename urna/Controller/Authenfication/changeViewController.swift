//
//  changeViewController.swift
//  urna
//
//  Created by imac44 on 17.03.2022.
//

import UIKit

class changeViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var passwordTextField: RoundedTextField!
    @IBOutlet var newPasswordTextField: RoundedTextField!
    
    // MARK: - ViewDidLoad method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = ""
        passwordTextField.tag = 1
        passwordTextField.becomeFirstResponder()
        passwordTextField.delegate = self
        passwordTextField.autocorrectionType = .no
        newPasswordTextField.tag = 2
        newPasswordTextField.autocorrectionType = .no
        newPasswordTextField.delegate = self
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    // MARK: - Change password action

     @IBAction func changeButtonTapped(sender: UIButton) {
         
         if passwordTextField.text == "" || newPasswordTextField.text == "" {
             let alertController = UIAlertController(title: "Oops", message: "Please note that all fields are required.", preferredStyle: .alert)
             let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
             alertController.addAction(alertAction)
             
             present(alertController, animated: true, completion: nil)
             
         } else if passwordTextField.text != newPasswordTextField.text {
             let alertController = UIAlertController(title: "Oops", message: "Please note the passwords must be the same.", preferredStyle: .alert)
             let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
             alertController.addAction(alertAction)
             
             present(alertController, animated: true, completion: nil)
         }
         else
         {
             performSegue(withIdentifier: "change", sender: nil)
         }
     }
}

    // MARK: - NextTextField action

extension changeViewController: UITextFieldDelegate {
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
