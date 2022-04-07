//
//  UserManager.swift
//  urna
//
//  Created by imac44 on 06.04.2022.
//

import Foundation

class UserManager {
    
    private(set) var currentUser: User?
    
    
    static let shared = UserManager()
    
    private init() {}
    
    func login(email: String, password: String, completion: @escaping (User?, Error?) -> Void) {
        // TODO: login api
        // TODO: save to currentUser
        currentUser = User(userID: 1 ,login: "admin", password: "admin", email: "dubo@sfedu.ru", image: "user photo", name: "Gosha", gender: .male)
    }
    
    func signUp() {
        //
    }
    
    func logout() {
        currentUser = nil
    }
}
