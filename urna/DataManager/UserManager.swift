//
//  UserManager.swift
//  urna
//
//  Created by imac44 on 06.04.2022.
//

import Foundation

class UserManager {
    
    private let defaults = UserDefaults.standard
    private(set) var currentUser: User? = nil {
        didSet {
            if let user = currentUser {
                defaults.set(user.email, forKey: "currentUserEmail")
            } else {
                defaults.removeObject(forKey: "currentUserEmail")
            }
        }
    }
    var isLoggedIn: Bool {
        return currentUser != nil
    }
    static let shared = UserManager()
    
    private init() {
        if let currentUserEmail = defaults.string(forKey: "currentUserEmail") {
            currentUser = self.users().first(where: { $0.email == currentUserEmail })
        }
    }
    
    func login(email: String, password: String) -> Bool {
        let users = self.users()
        currentUser = users.first(where: { $0.email == email })
        return currentUser != nil
    }
    
    func signUp(login: String, password: String, email: String) -> Bool {
        
        // TODO: check if user with the same login/email already exists
        let dict = users()
        if dict.contains(where: { $0.login == login }) {
            return false
        } else {
            currentUser = createCurrentUser(login: login, password: password, email: email, name: login)
            addUser(currentUser!)
            return true
        }
    }
    
    func logout() {
        currentUser = nil
    }
    
    func deleteAccount() {
        removeUser(currentUser!)
        logout()
    }
    
    // MARK: - Internal Helpers
    
    private func users() -> [User] {
        let users = defaults.array(forKey: "users") as? [[String: String]] ?? []
        return users.map { User(userID: $0["id"]!,
                                login: $0["login"]!,
                                password: $0["password"]!,
                                email: $0["email"]!,
                                image: $0["image"]!,
                                name: $0["name"]!,
                                gender: User.Gender(rawValue: $0["gender"]!)!) }
    }
    
    private func addUser(_ user: User) {
        let dict = ["id": String(user.userID),
                    "login": user.login,
                    "password": user.password,
                    "name": user.name,
                    "email": user.email,
                    "image": user.image,
                    "gender": user.gender.rawValue]
        var users = defaults.array(forKey: "users") as? [[String: String]] ?? []
        users.append(dict)
        defaults.set(users, forKey: "users")
    }
    
    private func removeUser(_ user: User) {
        var users = defaults.array(forKey: "users") as? [[String: String]] ?? []
        users.removeAll(where: { $0["email"] == user.email })
        defaults.set(users, forKey: "users")
    }
    
    private func createCurrentUser(login: String, password: String, email: String, name: String) -> User {
        currentUser = User(userID: NSUUID().uuidString,
                           login: login,
                           password: password,
                           email: email,
                           image: "accIcon",
                           name: name,
                           gender: .male)
        return currentUser!
    }
    
    // MARK: - save current user function
    func saveCurrentUser(person: User) {
        var users = defaults.array(forKey: "users") as? [[String: String]] ?? []
        users.removeAll(where: { $0["id"] == person.userID })
        defaults.set(users, forKey: "users")
        currentUser = person
        addUser(person)
    }
    
}
