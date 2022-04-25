//
//  ChangeFinishedViewController.swift
//  urna
//
//  Created by imac44 on 19.04.2022.
//

import UIKit

class ChangeFinishedViewController: UIViewController {

    // MARK: - Outlets
    
    @IBAction func greatButtonPressed() {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let navBarController = storyboard.instantiateInitialViewController()!
        view.window?.windowScene?.windows.first?.rootViewController = navBarController
    }
    
    // MARK: - ViewDidLoad method
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
