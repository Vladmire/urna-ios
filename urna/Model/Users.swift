//
//  Users.swift
//  urna
//
//  Created by imac44 on 16.03.2022.
//

import Foundation

struct User: Hashable {
    
    enum Gender: String {
        case male
        case female
        case hidden
    }
    
    var userID: String
    var login: String
    var password: String
    var email: String
    var image: String
    var name: String
    var gender: Gender
}
