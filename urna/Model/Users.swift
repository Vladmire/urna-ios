//
//  Users.swift
//  urna
//
//  Created by imac44 on 16.03.2022.
//

import Foundation

struct User {
    
    enum Gender: String {
        case male = "male"
        case female = "female"
        case hidden = "hidden"
    }
    
    let userID: Int
    let login: String
    let password: String
    let email: String
    let image: String
    let name: String
    let gender: Gender?
}
