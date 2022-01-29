//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Alik Nigay on 28.01.2022.
//

import Foundation
import SwiftUI

class StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "user"
    
    private init() {}
    
    func saveData(_ user: User) {
        guard let data = try? JSONEncoder().encode(user) else { return }
        userDefaults.set(data, forKey: key)
    }
    
    func newSaveData(_ user: User) {
        @AppStorage(key) var name = ""
    }
    
    func fetchData() -> User {
        guard let data = userDefaults.data(forKey: key) else { return User(name: "", isRegister: false) }
        guard let user = try? JSONDecoder().decode(User.self, from: data) else { return User(name: "", isRegister: false) }
        return user
    }
    
    func removeData() {
        userDefaults.removeObject(forKey: key)
    }
}
