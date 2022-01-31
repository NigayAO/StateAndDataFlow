//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alik Nigay on 28.01.2022.
//

import Foundation

final class UserManager: ObservableObject {
    
    @Published var user = User()
    
    var counter: Bool {
        user.name.count >= 3
    }
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
}

struct User: Codable {
    var name = ""
    var isRegister = false
}
