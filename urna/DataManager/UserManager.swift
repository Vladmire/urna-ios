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
    
    private let users = [User(userID: 1, login: "alena", password: "12345", email: "aaaaa", image: "user photo", name: "Alena", gender: .female),
                 User(userID: 2  ,login: "gosha", password: "12345", email: "aaaaa", image: "user photo", name: "Gosha", gender: .male),
                 User(userID: 1, login: "vlad", password: "12345", email: "aaaaa", image: "user photo", name: "Vlad", gender: .male),
                 User(userID: 1, login: "nail", password: "12345", email: "aaaaa", image: "user photo", name: "Nail", gender: .male),
                 User(userID: 1, login: "nina", password: "12345", email: "aaaaa", image: "user photo", name: "Nina", gender: .female),
                 User(userID: 1, login: "lesha", password: "12345", email: "aaaaa", image: "user photo", name: "Lesha", gender: .male),
                 User(userID: 1, login: "vova", password: "12345", email: "aaaaa", image: "user photo", name: "Vova", gender: .male),
                 User(userID: 1, login: "kirill", password: "12345", email: "aaaaa", image: "user photo", name: "Kirill", gender: .male)]
    
    
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
