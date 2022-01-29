//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Alik Nigay on 28.01.2022.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    
    @StateObject private var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManager)
        }
    }
}
