//
//  AuthViewController.swift
//  urna
//
//  Created by imac44 on 17.03.2022.
//

import SafariServices
import UIKit


class AuthViewController: UIViewController {
    
    let socialLinks = ["https://vk.com", "https:google.com", "https://facebook.com"]
    
//    let socialButton: UIButton {
//
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

//        let socialButtons = UIButton(type: .system)
//        socialButtons.backgroundColor =
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
    // MARK: - social links button
    


}
