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
    
    @AppStorage("user") var userData: Data?
        
    private init() {}
    
    func saveData(user: User) {
        userData = try! JSONEncoder().encode(user)
    }
    
    func fetchData() -> User {
        guard let user = try? JSONDecoder().decode(User.self, from: userData ?? Data()) else { return User() }
        return user
    }
    
    func clearData(userManager: UserManager) {
        userManager.user.isRegister = false
        userManager.user.name = ""
        userData = nil
    }
}
