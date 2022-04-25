////
////  KeyboardHandlerProtocol.swift
////  urna
////
////  Created by imac44 on 22.04.2022.
////
//
//import Foundation
//import UIKit
//
//protocol KeyboardHandler {
//    var scrollView: UIScrollView { get }
//}
//
//extension UIViewController {
//    
//    func subscribe() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//    
//    func unsubscribe() {
//        NotificationCenter.default.removeObserver(self)
//    }
//    
//    @objc func keyboardWillHide() {
//        updateBottomInset(0)
//    }
//
//    @objc func keyboardWillChange(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            updateBottomInset(keyboardSize.height)
//        }
//    }
//    
//    private func updateBottomInset(_ inset: CGFloat) {
//        let oldInsets = self.scrollView.contentInset
//        scrollView.contentInset = UIEdgeInsets.init(top: oldInsets.top, left: oldInsets.left, bottom: inset, right: oldInsets.right)
//    }
//    
//}
