//
//  UserManager.swift
//  urna
//
//  Created by imac44 on 06.04.2022.
//

import Foundation

class UserManager {
    
    private(set) var currentUser: User? = User(userID: 1 ,login: "admin", password: "admin", email: "dubo@sfedu.ru", image: "userPhoto", name: "Gosha", gender: .male)
    private let defaultUser = User(userID: 0, login: "noName", password: "123456", email: "noEmail", image: "accIcon", name: "noName", gender: .hidden)
    
    
    static let shared = UserManager()
    
    private init() {}
    
    func login(email: String, password: String) -> Bool {
        // TODO: login api
        // TODO: save to currentUser
        if currentUser?.login == email && currentUser?.password == password {
            return true
        } else {
            return false
        }
        
    }
    func signUp(login: String, password: String, email: String) {
        //
        currentUser?.name = login
        currentUser?.login = login
        currentUser?.password = password
        currentUser?.email = email
    }
    
    func logout() {
        currentUser = nil
    }
}
