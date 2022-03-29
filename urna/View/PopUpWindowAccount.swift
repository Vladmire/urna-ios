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
        let label = ViewsFactory.createLabel(text: "Name and Surname", fontName: "Avenir", fontsize: 16)
        return label
    }()
    let textLabel: UILabel = {
        let label = ViewsFactory.createLabel(text: "Enter your new name and surname", fontName: "Avenir", fontsize: 10)
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
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 50).isActive = true
        
        addSubview(textLabel)
        textLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 30).isActive = true
        
        addSubview(textField)
        textField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(saveButton)
        saveButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        saveButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented ")
    }
    
    @objc func handleDismissal() {
        delegate?.handleDismissal()
    }
}
