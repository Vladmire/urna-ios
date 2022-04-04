//
//  DeleteAccountView.swift
//  urna
//
//  Created by imac44 on 04.04.2022.
//

import UIKit

class DeleteAccountView: UIView {

    //MARK: - propeties
    let warningImage: UIImageView = {
        let image = ViewsFactory.createImage(imageName: "warningVect")
        return image
    }()
    let titleLabel: UILabel = {
        let label = ViewsFactory.createLabel(text: "Are you sure to delete an account", fontName: "Avenir", fontsize: 25)
        label.numberOfLines = 0
        return label
    }()
    let textLabel: UILabel = {
        let label = ViewsFactory.createLabel(text: "If you delete account you will lost your data", fontName: "Avenir", fontsize: 16)
        label.numberOfLines = 0
        return label
    }()
    let deleteButton: UIButton = {
        let button = ViewsFactory.createButton(title: "Delete", titleColor: .white, backgroundColor: UIColor(named: "deleteColor"), cornerRadius: 20)
        return button
    }()
    let cancelButton: UIButton = {
        let button = ViewsFactory.createButton(title: "Cancel", titleColor: .white, backgroundColor: .gray, cornerRadius: 20)
        return button
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(warningImage)
        warningImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        warningImage.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: warningImage.bottomAnchor, constant: 15).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        
        addSubview(textLabel)
        textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10 ).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
    
        addSubview(deleteButton)
        deleteButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10).isActive = true
        deleteButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        deleteButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        addSubview(cancelButton)
        cancelButton.topAnchor.constraint(equalTo: deleteButton.bottomAnchor, constant: 10).isActive = true
        cancelButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented ")
    }
}

