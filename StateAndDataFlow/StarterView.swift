//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Alik Nigay on 28.01.2022.
//

import SwiftUI

struct StarterView: View {
        
    private let user = StorageManager.shared.fetchData()
    
    var body: some View {
        Group {
            if user.isRegister {
                ContentView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
