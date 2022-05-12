//
//  LoginViewController.swift
//  urna
//
//  Created by imac44 on 14.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBAction func login(){
    }
    @IBAction func registration() {
    }

    // MARK: - ViewDidLoad method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        // Do any additional setup after loading the view.
        if UserManager.shared.isLoggedIn {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBarController = storyboard.instantiateInitialViewController()!
            UIApplication.shared.windows[0].rootViewController = tabBarController
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navbar = navigationController?.navigationBar
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.shadowColor = .clear
        navigationBarAppearance.backgroundColor = UIColor.white
        navbar?.standardAppearance = navigationBarAppearance
        navbar?.scrollEdgeAppearance = navigationBarAppearance
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let navbar = navigationController?.navigationBar
        let navigationBarAppearance = UINavigationBarAppearance()
        
        var backButtonImage = UIImage(systemName: "arrow.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20.0, weight:  .bold))
        backButtonImage = backButtonImage?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0))
        navigationBarAppearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
        navigationBarAppearance.backgroundColor = UIColor(named: "mainMarine")
        navbar?.tintColor = .white
        navigationBarAppearance.shadowColor = .clear
        navbar?.standardAppearance = navigationBarAppearance
        navbar?.scrollEdgeAppearance = navigationBarAppearance
    }
}
