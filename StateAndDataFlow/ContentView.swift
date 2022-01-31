//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alik Nigay on 28.01.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    
    @EnvironmentObject private var userManager: UserManager
        
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)")
                .font(.largeTitle)
                .padding(.top, 50)
            Text("\(timer.counter)")
                .font(.largeTitle)
            .padding(.top, 50)
            Spacer()
            ButtonView(timer: timer)
            Spacer()
            logOutButtonView(action: removeUser)
        }
    }
    
    private func removeUser() {
        StorageManager.shared.clearData(userManager: userManager)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.red)
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 4))
    }
}

struct logOutButtonView: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Text("LogOut")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.blue)
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 4))
        .padding(.bottom, 20)
    }
}
