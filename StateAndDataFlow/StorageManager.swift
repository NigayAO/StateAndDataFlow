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
    
    @AppStorage("name") var name = ""
    @AppStorage("state") var state = false
    
    private let userDefaults = UserDefaults.standard
    
    private init() {}
    
    func saveData(newName: String, newState: Bool) {
        name = newName
        state = newState
    }
    
    func fetchName() -> String {
        guard let name = userDefaults.value(forKey: "name") as? String else { return "" }
        return name
    }
    
    func fetchState() -> Bool {
        guard let state = userDefaults.value(forKey: "state") as? Bool else { return false }
        return state
    }
    
    func removeData() {
        userDefaults.removeObject(forKey: "name")
        userDefaults.removeObject(forKey: "state")
    }
}
