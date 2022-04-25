//
//  UINavigationBar+Convenience.swift
//  urna
//
//  Created by imac44 on 25.04.2022.
//

import UIKit

extension UINavigationController {
    
    func setDefaultNavBar() {
        let navbar = navigationController?.navigationBar
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.shadowColor = .clear
        navigationBarAppearance.backgroundColor = UIColor.white
        navbar?.standardAppearance = navigationBarAppearance
        navbar?.scrollEdgeAppearance = navigationBarAppearance
    }
    
    func setGreenNavBar() {
        
    }
}
