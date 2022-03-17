//
//  Users.swift
//  urna
//
//  Created by imac44 on 16.03.2022.
//

import Foundation

struct User {
    
    enum Gender: String {
        case male
        case female
        case hidden
    }
    
    var login: String = ""
    var password: String = ""
    var email: String = ""
    var image: String = ""
    var name: String = ""
    var gender: Gender = .hidden
}
