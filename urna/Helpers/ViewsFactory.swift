//
//  ViewsFactory.swift
//  urna
//
//  Created by imac44 on 29.03.2022.
//

import Foundation
import UIKit

struct ViewsFactory {
    
    // MARK: - Create button
    
    static func createButton(title: String?,
                             image: String? = "",
                             titleColor: UIColor? = UIColor(named: "mainMarine"),
                             backgroundColor: UIColor? = .white,
                             cornerRadius: CGFloat = 0.0) -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = backgroundColor
        button.setTitle(title, for: .normal)
        if let buttonImage = image {
            button.setImage(UIImage(named: buttonImage), for: .normal)
        }
        button.setTitleColor(titleColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = cornerRadius
        return button
    }
    
    // MARK: - Create textfield
    
    static func createTextField() -> UITextField {
        let textField = RoundedTextField()
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    // MARK: - Create label
    
    static func createLabel(text: String?,
                            fontName: String = "Avenir",
                            fontsize: CGFloat = 10) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: fontName, size: fontsize)
        label.text = text
        return label
    }
    
    // MARK: - Create image
    
    static func createImage(imageName: String,
                            cornerRadius: CGFloat = 0.0,
                            tintColor: String) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: imageName)
        image.tintColor = UIColor(named: tintColor)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = cornerRadius
        return image
    }
    
    
    
}
