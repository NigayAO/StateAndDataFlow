//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alik Nigay on 28.01.2022.
//

import Foundation

class UserManager: ObservableObject {
    @Published var isRegister = StorageManager.shared.fetchState()
}
