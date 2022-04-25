//
//  DeleteAccountViewController.swift
//  urna
//
//  Created by imac44 on 04.04.2022.
//

import UIKit

class DeleteAccountViewController: UIViewController {
    
    
    //MARK: - properties
    
    lazy var deleteAccount: DeleteAccountView = {
        let view = DeleteAccountView()
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
        
        deleteAccount.deleteButton.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
        deleteAccount.cancelButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        
    }
    
    // MARK: - ViewDidAppear method
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.addSubview(deleteAccount)
        deleteAccount.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
        deleteAccount.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        deleteAccount.heightAnchor.constraint(equalToConstant: view.frame.width - 45).isActive = true
        deleteAccount.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
        
        deleteAccount.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        deleteAccount.alpha = 0
        
        UIView.animate(withDuration: 0.5) {
            self.visualEffectView.alpha = 1
            self.deleteAccount.alpha = 1
            self.deleteAccount.transform = CGAffineTransform.identity
        }
        
    }
    
    @objc private func deleteButtonPressed() {
        cancelButtonPressed()
        completion("")
    }
    
    @objc private func cancelButtonPressed() {
        dismiss(animated: false)
    }
    
    // MARK: - Navigation

   
}
