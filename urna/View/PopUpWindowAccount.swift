//
//  PopUpWindowAccount.swift
//  urna
//
//  Created by imac44 on 29.03.2022.
//

import UIKit

protocol PopUpDelegate {
    func handleDismissal()
}

class PopUpWindowAccount: UIView {

    //MARK: - propeties
    
    var delegate: PopUpDelegate?
    
    let titleLabel: UILabel = {
        let label = ViewsFactory.createLabel(text: "Name and Surname", fontName: "Avenir", fontsize: 25)
        return label
    }()
    let textLabel: UILabel = {
        let label = ViewsFactory.createLabel(text: "Enter your new name and surname", fontName: "Avenir", fontsize: 16)
        return label
    }()
    let textField: UITextField = {
        let textField = ViewsFactory.createTextField()
        return textField
    }()
    let saveButton: UIButton = {
        let button = ViewsFactory.createButton(title: "Save")
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        return button
    }()
    let cancelButton: UIButton = {
        let button = ViewsFactory.createButton(title: "Cancel")
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
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
        
        
        addSubview(saveButton)
        saveButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        
        
        addSubview(cancelButton)
        cancelButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: saveButton.leadingAnchor, constant: -45).isActive = true
        
//        cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented ")
    }
    
    @objc func handleDismissal() {
        delegate?.handleDismissal()
    
    }
}
