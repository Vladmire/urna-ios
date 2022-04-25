//
//  UIButton+Convenience.swift
//  urna
//
//  Created by imac44 on 21.04.2022.
//

import UIKit

extension UIButton {

    func setupHorizontalInsets(image: CGFloat = 0, content: CGFloat = 0) {

            let horizontal = image + content

            contentEdgeInsets = UIEdgeInsets(top: 0, left: horizontal, bottom: 0, right: horizontal)

            let image = semanticContentAttribute == .forceRightToLeft ? -image : image

            imageEdgeInsets = UIEdgeInsets(top: 0, left: -image, bottom: 0, right: image)

            titleEdgeInsets = UIEdgeInsets(top: 0, left: image, bottom: 0, right: -image)

        }

    
    

}

