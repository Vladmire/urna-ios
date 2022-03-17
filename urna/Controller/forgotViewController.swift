//
//  forgotViewController.swift
//  urna
//
//  Created by imac44 on 17.03.2022.
//

import UIKit

class forgotViewController: UIViewController {
    
    @IBOutlet var emailTextField: RoundedTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    // MARK: - forgot password action
    
    @IBAction func sendButtonTapped(sender: UIButton) {
        //[nameTextField, passwordTextField].forEach({ $0?.text = "123" })
        if emailTextField.text == "" {
            let alertController = UIAlertController(title: "Oops", message: "Please note that all fields are required.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(alertAction)
            
            present(alertController, animated: true, completion: nil)
        } else
        {
            performSegue(withIdentifier: "sent", sender: nil)
        }
    }

}
