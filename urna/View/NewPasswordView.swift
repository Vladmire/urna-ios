//
//  NewPasswordView.swift
//  urna
//
//  Created by imac44 on 31.03.2022.
//

import UIKit

class NewPasswordView: UIView {

    //MARK: - propeties
    
    let titleLabel = ViewsFactory.createLabel(text: "Password", fontName: "Avenir", fontsize: 25)
    let textLabel = ViewsFactory.createLabel(text: "Enter your new password", fontName: "Avenir", fontsize: 16)
    let textField = ViewsFactory.createTextField()
    let newTextLabel = ViewsFactory.createLabel(text: "Repeat your new password", fontName: "Avenir", fontsize: 16)
    let newTextField = ViewsFactory.createTextField()
    let saveButton = ViewsFactory.createButton(title: "Save")
    let cancelButton = ViewsFactory.createButton(title: "Cancel")

    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        titleLabel.font = UIFont(name: "Montserrat-Bold", size: 25)
        textLabel.font = UIFont(name: "Montserrat-Medium", size: 15)
        textField.font = UIFont(name: "Montserrat-Regular", size: 17)
        newTextLabel.font = UIFont(name: "Montserrat-Medium", size: 15)
        newTextField.font = UIFont(name: "Montserrat-Regular", size: 17)
        saveButton.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 17)
        cancelButton.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 17)
        
        addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        
        addSubview(textLabel)
        textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15 ).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        
        addSubview(textField)
        textField.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 15).isActive = true
        textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        addSubview(newTextLabel)
        newTextLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15 ).isActive = true
        newTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        
        addSubview(newTextField)
        newTextField.topAnchor.constraint(equalTo: newTextLabel.bottomAnchor, constant: 15).isActive = true
        newTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        newTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        newTextField.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        addSubview(saveButton)
        saveButton.topAnchor.constraint(equalTo: newTextField.bottomAnchor, constant: 20).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        
        addSubview(cancelButton)
        cancelButton.topAnchor.constraint(equalTo: newTextField.bottomAnchor, constant: 20).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: saveButton.leadingAnchor, constant: -45).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented ")
    }

}
