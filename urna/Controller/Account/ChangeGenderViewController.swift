//
//  ChangeGenderViewController.swift
//  urna
//
//  Created by imac44 on 31.03.2022.
//

import UIKit

class ChangeGenderViewController: UIViewController {
    
    private var currentGender: User.Gender
    
    private var isSelected: Bool = false

    //MARK: - properties
    
    lazy var changeGender: changeGenderView = {
        let view = changeGenderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10.0
        return view
    }()
    
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let completion: (User.Gender) -> Void
    
    init(currentGender: User.Gender, completion: @escaping (User.Gender) -> Void) {
        self.currentGender = currentGender
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - ViewDidLoad method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(visualEffectView)
        visualEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        visualEffectView.alpha = 0
        changeGender.radioButton_1.addTarget(self, action: #selector(radioButtonTapped), for: .touchUpInside)
        changeGender.radioButton_2.addTarget(self, action: #selector(radioButtonTapped), for: .touchUpInside)
        changeGender.saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        changeGender.cancelButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        
        if currentGender == .female {
            radioButtonTapped()
        } else {
            isSelected = true
            radioButtonTapped()
        }
        
    }
    
    // MARK: - ViewDidAppear method
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.addSubview(changeGender)
        changeGender.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
        changeGender.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeGender.heightAnchor.constraint(equalToConstant: view.frame.width - 170).isActive = true
        changeGender.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
        
        changeGender.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        changeGender.alpha = 0
        
        UIView.animate(withDuration: 0.5) {
            self.visualEffectView.alpha = 1
            self.changeGender.alpha = 1
            self.changeGender.transform = CGAffineTransform.identity
        }
        
    }
    
    
    @objc private func radioButtonTapped() {
        
        if isSelected {
            changeGender.radioButton_1.setImage(UIImage(named: "radioButtonOn"), for: .normal)
            changeGender.radioButton_2.setImage(UIImage(named: "radioButtonOff"), for: .normal)
            isSelected = false
            currentGender = .male
        } else {
            changeGender.radioButton_1.setImage(UIImage(named: "radioButtonOff"), for: .normal)
            changeGender.radioButton_2.setImage(UIImage(named: "radioButtonOn"), for: .normal)
            isSelected = true
            currentGender = .female
        }
    }
    
    @objc private func saveButtonPressed() {
            dismiss(animated: false)
            completion(currentGender)
    }
    
    @objc private func cancelButtonPressed() {
        dismiss(animated: false)
    }
    
    // MARK: - Navigation

   
}
