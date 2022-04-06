//
//  changeViewController.swift
//  urna
//
//  Created by imac44 on 17.03.2022.
//

import UIKit

class changeViewController: UIViewController {
    
    @IBOutlet var passwordTextField: RoundedTextField!
    @IBOutlet var newPasswordTextField: RoundedTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = ""
        // Do any additional setup after loading the view.
    }

    

    // MARK: - change password

     @IBAction func changeButtonTapped(sender: UIButton) {
         //[nameTextField, passwordTextField].forEach({ $0?.text = "123" })
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
