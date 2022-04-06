//
//  Filter.swift
//  urna
//
//  Created by imac44 on 06.04.2022.
//

import Foundation


struct Filter {
    
    enum type: String {
        case paper = "paper"
        case plastic = "plastic"
        case bio = "BIO"
    }
    
    let title: String
    let image: String
    let type: type?
}
