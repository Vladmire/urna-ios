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
    let radioButton_1 = ViewsFactory.createButton(title: "Male", image: "radioButtonOff")
    let radioButton_2 = ViewsFactory.createButton(title: "Female", image: "radioButtonOff")
    let saveButton = ViewsFactory.createButton(title: "Save")
    let cancelButton = ViewsFactory.createButton(title: "Cancel")

    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        
        addSubview(radioButton_1)
        radioButton_1.tintColor = UIColor.gray
        radioButton_1.setTitleColor(UIColor.black, for: .normal)
        radioButton_1.setupHorizontalInsets(image: 5, content: 0)
        radioButton_1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25).isActive = true
        radioButton_1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        radioButton_1.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -25).isActive = true
        
        radioButton_1.setImage(UIImage(named: "radioButtonOff"), for: .normal)
        radioButton_1.setImage(UIImage(named: "radioButtonOn"), for: .selected)
        
        
        
        addSubview(radioButton_2)
        radioButton_2.tintColor = UIColor.gray
        radioButton_2.setTitleColor(UIColor.black, for: .normal)
        radioButton_2.setupHorizontalInsets(image: 5, content: 0)
        radioButton_2.topAnchor.constraint(equalTo: radioButton_1.bottomAnchor, constant: 15).isActive = true
        radioButton_2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        radioButton_2.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -25).isActive = true
        
        radioButton_2.setImage(UIImage(named: "radioButtonOff"), for: .normal)
        radioButton_2.setImage(UIImage(named: "radioButtonOn"), for: .selected)
        
        addSubview(saveButton)
        saveButton.topAnchor.constraint(equalTo: radioButton_2.bottomAnchor, constant: 30).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
    
        addSubview(cancelButton)
        cancelButton.topAnchor.constraint(equalTo: radioButton_2.bottomAnchor, constant: 30).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: saveButton.leadingAnchor, constant: -45).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented ")
    }

}
