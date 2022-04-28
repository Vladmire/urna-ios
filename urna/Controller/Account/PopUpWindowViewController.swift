//
//  PopUpWindowViewController.swift
//  urna
//
//  Created by imac44 on 30.03.2022.
//

import UIKit

class PopUpWindowViewController: UIViewController {
    
    
    //MARK: - properties
    
    lazy var popUpWindow: PopUpWindowAccount = {
        let view = PopUpWindowAccount()
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
    
    // MARK: - ViewDidLoad method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(visualEffectView)
        visualEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        visualEffectView.alpha = 0
        
        popUpWindow.saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        popUpWindow.cancelButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        
        
        
    }
    
    // MARK: - ViewDidAppear method
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.addSubview(popUpWindow)
        popUpWindow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
        popUpWindow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popUpWindow.heightAnchor.constraint(equalToConstant: view.frame.width - 170).isActive = true
        popUpWindow.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
        
        popUpWindow.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        popUpWindow.alpha = 0
        
        UIView.animate(withDuration: 0.5) {
            self.visualEffectView.alpha = 1
            self.popUpWindow.alpha = 1
            self.popUpWindow.transform = CGAffineTransform.identity
        }
        
    }
    
    @objc private func saveButtonPressed() {
        if popUpWindow.textField.text != "" {
            dismiss(animated: false)
            completion(popUpWindow.textField.text ?? "")
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
