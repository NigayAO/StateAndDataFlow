//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alik Nigay on 28.01.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject private var userManager: UserManager
        
    @State private var name = ""
    @State private var countCharacter = 0
    @State private var color = Color.red
    @State private var enableButton = true
        
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .onChange(of: name.count, perform: { newValue in
                        countCharacter = newValue
                        updateUI()
                    })
                    .multilineTextAlignment(.center)
                Text("\(countCharacter)")
                    .foregroundColor(color)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(enableButton)
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            userManager.name = name
            userManager.isRegister.toggle()
            StorageManager.shared.saveData(User(name: name, isRegister: true))
        }
    }
    
    private func updateUI() {
        if countCharacter > 2 {
            color = .green
            enableButton = false
        } else {
            color = .red
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}
