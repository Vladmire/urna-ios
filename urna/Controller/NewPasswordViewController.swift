//
//  NewPasswordViewController.swift
//  urna
//
//  Created by imac44 on 31.03.2022.
//

import UIKit

class NewPasswordViewController: UIViewController {

    //MARK: - properties
    
    lazy var newPassword: NewPasswordView = {
        let view = NewPasswordView()
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
        
        newPassword.saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        newPassword.cancelButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.addSubview(newPassword)
        newPassword.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
        newPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        newPassword.heightAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        newPassword.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
        
        newPassword.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        newPassword.alpha = 0
        
        UIView.animate(withDuration: 0.5) {
            self.visualEffectView.alpha = 1
            self.newPassword.alpha = 1
            self.newPassword.transform = CGAffineTransform.identity
        }
        
    }
    
    @objc private func saveButtonPressed() {
        if (newPassword.textField.text == newPassword.newTextField.text && newPassword.textField.text != "") {
            dismiss(animated: false)
            completion(newPassword.textField.text ?? "")
        } else {
            let alertController = UIAlertController(title: "Oops", message: "Please check both fields. Try again!", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(alertAction)
            
            present(alertController, animated: true, completion: nil)
        }
        
    }
    
    @objc private func cancelButtonPressed() {
        dismiss(animated: false)
    }
    
    // MARK: - Navigation

}
