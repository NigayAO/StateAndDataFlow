//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alik Nigay on 28.01.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject private var userManager: UserManager
        
    var body: some View {
        VStack {
            TextFieldView(
                name: $userManager.user.name,
                isValid: userManager.counter
            )
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!userManager.counter)
        }
    }
    
    private func registerUser() {
        if !userManager.user.name.isEmpty {
            userManager.user.isRegister.toggle()
            StorageManager.shared.saveData(user: userManager.user)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}

struct TextFieldView: View {
    
    @Binding var name: String
    var isValid: Bool
    
    var body: some View {
        HStack {
            TextField("Enter your name", text: $name)
                .multilineTextAlignment(.center)
            Text("\(name.count)")
                .foregroundColor(isValid ? .green : .red)
                .padding(.trailing, 20)
        }
    }
}
