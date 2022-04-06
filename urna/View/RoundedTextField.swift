//
//  RoundedTextField.swift
//  urna
//
//  Created by imac44 on 17.03.2022.
//

import UIKit

class RoundedTextField: UITextField {

    private let padding = UIEdgeInsets(top: 7, left: 10, bottom: 7, right: 7)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.systemGray5.cgColor
        layer.cornerRadius = 20.0
        layer.masksToBounds = true
    }
}
