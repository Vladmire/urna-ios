//
//  Users.swift
//  urna
//
//  Created by imac44 on 16.03.2022.
//

import Foundation

struct User: Hashable {
    
    enum Gender: String {
        case male = "male"
        case female = "female"
        case hidden = "hidden"
    }
    
    var userID: Int
    var login: String
    var password: String
    var email: String
    var image: String
    var name: String
    var gender: Gender?
}
