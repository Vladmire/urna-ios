//
//  UserManager.swift
//  urna
//
//  Created by imac44 on 06.04.2022.
//

import Foundation

class UserManager {
    
    private(set) var currentUser: User? = User(userID: 1 ,login: "admin", password: "admin", email: "dubo@sfedu.ru", image: "user photo", name: "Gosha", gender: .male)
    let defaultUser = User(userID: 0, login: "noName", password: "123456", email: "noEmail", image: "accIcon", name: "noName", gender: .hidden)
    let users = [User(userID: 1, login: "aaaaa", password: "aaaaaa", email: "aaaaa", image: "user photo", name: "aaaaa", gender: .female),
                 User(userID: 2  ,login: "admin", password: "admin", email: "dubo@sfedu.ru", image: "user photo", name: "Gosha", gender: .male)]
    
    
    static let shared = UserManager()
    
    private init() {}
    
    func login(email: String, password: String, completion: @escaping (User?, Error?) -> Void) {
        // TODO: login api
        // TODO: save to currentUser
    }
    func signUp() {
        //
    }
    
    func logout() {
        currentUser = nil
    }
    
    func getReviewAuthor(userID: Int) -> User {
        var userAuthor: User = defaultUser
        for user in users {
            if user.userID == userID {
                userAuthor = user
            }
        }
        return userAuthor
    }
}
