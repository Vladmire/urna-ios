//
//  UserManager.swift
//  urna
//
//  Created by imac44 on 06.04.2022.
//

import Foundation

class UserManager {
    
    let defaults = UserDefaults.standard
    
    private(set) var currentUser: User? = User(userID: 0 ,login: "admin", password: "admin", email: "dubo@sfedu.ru", image: "accIcon", name: "Gosha", gender: .male)
    //currentUser = getCurrentUser()
    static let shared = UserManager()
    
    private init() {}
    
    // MARK: - login function
    func login(email: String, password: String) -> Bool {
        // TODO: login api
        // TODO: save to currentUser
        let usersCount = defaults.integer(forKey: "usercount")
        var count = 1
        var isEqual: Bool = false
        
        while count <= usersCount {
            currentUser = getUsers(counter: count)
            if currentUser?.login == email && currentUser?.password == password {
                isEqual = true
                saveCurrentUser(user: currentUser!)
            }
            count += 1
        }
        
        return isEqual
    }
    
    // MARK: - registration function
    func signUp(login: String, password: String, email: String) {
        currentUser = User(userID: 0 ,login: "admin", password: "admin", email: "dubo@sfedu.ru", image: "accIcon", name: "Gosha", gender: .male)
        currentUser?.name = login
        currentUser?.login = login
        currentUser?.password = password
        currentUser?.email = email
        currentUser?.userID = userCounter()
        
        saveCurrentUser(user: currentUser!)
    }
    
    // MARK: - logout function
    func logout() {
        currentUser = nil
        defaults.removeObject(forKey: "currentUser")
    }
    // MARK: - delete account function
    func deleteAccount() {
        deleteCurrentUser()
    }
    // MARK: - change account info function
    func changeUser() {
        defaults.removeObject(forKey: "currentUser")
        defaults.removeObject(forKey: String(currentUser?.userID ?? 0))
        
        defaults.set(currentUser, forKey: "currentUser")
        defaults.set(currentUser, forKey: String(currentUser?.userID ?? 0))
    }
    // MARK: - save user function
    private func saveCurrentUser(user: User) {
        
        defaults.removeObject(forKey: "currentUser")
        defaults.removeObject(forKey: String(user.userID))
        
        let currentUser = ["id": String(user.userID),
                           "login": user.login,
                           "password": user.password,
                           "name": user.name,
                           "email": user.email,
                           "image": user.image,
                           "gender": user.gender?.rawValue]
        
        
        defaults.set(currentUser, forKey: "currentUser")
        if defaults.object(forKey: String(user.userID)) == nil {
            defaults.set(currentUser, forKey: String(user.userID))
        }
        
    }
    
    // MARK: - delete current user function
    private func deleteCurrentUser() {
        defaults.removeObject(forKey: "currentUser")
        defaults.removeObject(forKey: String(currentUser?.userID ?? 0))
        currentUser = nil
    }
    
    // MARK: - get current user function
    func getCurrentUser() -> User? {
        
        guard let currentUser = defaults.object(forKey: "currentUser") as? [String:String] else {
            return nil
        }
        let userId = currentUser["id"]!
        var user = User(userID: Int(userId)!, login: currentUser["login"]!, password: currentUser["password"]!, email: currentUser["email"]!, image: currentUser["image"]!, name: currentUser["name"]!, gender: .male)
        
        if currentUser["gender"]! == "male" {
            user.gender = .male
        } else {
            user.gender = .female
        }
        return user
    }
    // MARK: - get all user function
    func getUsers(counter: Int) -> User? {
        guard let currentUser = defaults.object(forKey: String(counter)) as? [String:String] else {
            return nil
        }
        let userId = currentUser["id"]!
        var user = User(userID: Int(userId)!, login: currentUser["login"]!, password: currentUser["password"]!, email: currentUser["email"]!, image: currentUser["image"]!, name: currentUser["name"]!, gender: .male)
        
        if currentUser["gender"]! == "male" {
            user.gender = .male
        } else {
            user.gender = .female
        }
        return user
    }
    // MARK: - user counter function
    private func userCounter() -> Int {
        var userNumber = 0
        userNumber = defaults.integer(forKey: "usercount")
        userNumber += 1
        defaults.set(userNumber, forKey: "usercount")
        return userNumber
    }
}
