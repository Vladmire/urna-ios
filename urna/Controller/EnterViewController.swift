//
//  EnterViewController.swift
//  urna
//
//  Created by imac44 on 15.03.2022.
//
import SafariServices
import UIKit

class EnterViewController: UIViewController {

    let socialLinks = ["https:google.com", "https://vk.com", "https://facebook.com"]
   // let user: User!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = ""
        // Do any additional setup after loading the view.
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
    // MARK: - forgot password action
    
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
    
    @IBAction func forgotButtonTapped(sender: UIButton) {
        performSegue(withIdentifier: "forgot", sender: nil)
    }
    

}
