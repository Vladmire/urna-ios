//
//  ChangeGenderViewController.swift
//  urna
//
//  Created by imac44 on 31.03.2022.
//

import UIKit

class ChangeGenderViewController: UIViewController {

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
    
    
    let completion: (String) -> Void
    
    init(completion: @escaping (String) -> Void) {
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //var changeNameView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(visualEffectView)
        visualEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        visualEffectView.alpha = 0
        
        changeGender.saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        changeGender.cancelButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        
    }
    
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
    
    @objc private func saveButtonPressed() {
        dismiss(animated: false)
        completion(changeGender.textField.text ?? "")
    }
    
    @objc private func cancelButtonPressed() {
        dismiss(animated: false)
    }
    
    // MARK: - Navigation

   
}
