//
//  NewEmailViewConroller.swift
//  urna
//
//  Created by imac44 on 31.03.2022.
//

import UIKit

class NewEmailViewConroller: UIViewController {

    //MARK: - properties
    
    lazy var newEmail: NewEmailView = {
        let view = NewEmailView()
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
        
        newEmail.saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        newEmail.cancelButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.addSubview(newEmail)
        newEmail.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
        newEmail.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        newEmail.heightAnchor.constraint(equalToConstant: view.frame.width - 170).isActive = true
        newEmail.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
        
        newEmail.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        newEmail.alpha = 0
        
        UIView.animate(withDuration: 0.5) {
            self.visualEffectView.alpha = 1
            self.newEmail.alpha = 1
            self.newEmail.transform = CGAffineTransform.identity
        }
        
    }
    
    @objc private func saveButtonPressed() {

        if newEmail.textField.text != "" {
            dismiss(animated: false)
            completion(newEmail.textField.text ?? "")
        } else {
            let alertController = UIAlertController(title: "Oops", message: "The textfield is blank", preferredStyle: .alert)
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
