//
//  UITableView+Convienience.swift
//  urna
//
//  Created by imac44 on 13.04.2022.
//

import UIKit
 

 extension UITableView {
     
     func updateHeaderFrame() {
         tableHeaderView = updateFrame(of: tableHeaderView)
     }
     
     func updateFooterFrame() {
         tableFooterView = updateFrame(of: tableFooterView)
     }
     
     private func updateFrame(of view: UIView?) -> UIView? {
         guard let view = view else { return view }
         view.translatesAutoresizingMaskIntoConstraints = false
         let width = bounds.width
         let constraint = view.widthAnchor.constraint(equalToConstant: width)
         constraint.isActive = true
         let height = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
         view.frame = CGRect(origin: .zero, size: CGSize(width: width, height: height))
         constraint.isActive = false
         view.translatesAutoresizingMaskIntoConstraints = true
         return view
     }
     
 }
