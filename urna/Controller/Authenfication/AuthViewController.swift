//
//  AuthViewController.swift
//  urna
//
//  Created by imac44 on 17.03.2022.
//

import SafariServices
import UIKit


class AuthViewController: UIViewController {
    
    private let socialLinks = ["https://vk.com", "https:google.com", "https://facebook.com"]

    // MARK: - ViewDidLoad method
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.backButtonTitle = ""
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
