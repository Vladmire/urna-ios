//
//  NavigationController.swift
//  urna
//
//  Created by imac44 on 18.03.2022.
//

import UIKit

class NavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
    
}
