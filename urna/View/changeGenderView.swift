//
//  changeGenderView.swift
//  urna
//
//  Created by imac44 on 31.03.2022.
//

import UIKit

class changeGenderView: UIView {

    //MARK: - propeties
    
    let titleLabel = ViewsFactory.createLabel(text: "Your gender", fontName: "Avenir", fontsize: 25)
    let textField = ViewsFactory.createTextField()
    let saveButton = ViewsFactory.createButton(title: "Save")
    let cancelButton = ViewsFactory.createButton(title: "Cancel")

    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        
        addSubview(textField)
        textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 35).isActive = true
        textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        addSubview(saveButton)
        saveButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 30).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
    
        addSubview(cancelButton)
        cancelButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 30).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: saveButton.leadingAnchor, constant: -45).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented ")
    }

}
