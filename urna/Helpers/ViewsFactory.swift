//
//  ViewsFactory.swift
//  urna
//
//  Created by imac44 on 29.03.2022.
//

import Foundation
import UIKit

struct ViewsFactory {
    
    //MARK: - Create button
    
    static func createButton(title: String?,
                             titleColor: UIColor? = UIColor(named: "mainMarine"),
                             backgroundColor: UIColor? = .white) -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    //MARK: - Create textfield
    
    static func createTextField() -> UITextField {
        let textField = RoundedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    //MARK: - Create label
    
    static func createLabel(text: String?, fontName: String = "Avenir", fontsize: CGFloat = 10) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: fontName, size: fontsize)
        label.text = text
        return label
    }
    
    
    
}
