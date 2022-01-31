//
//  ButtonAppearance.swift
//  StateAndDataFlow
//
//  Created by Alik Nigay on 31.01.2022.
//

import SwiftUI

struct ButtonSetup: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: 200, height: 60)
            .background(color)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 4))
    }
}

extension View {
    func buttonAppearance(color: Color) -> some View {
        ModifiedContent(
            content: self,
            modifier: ButtonSetup(color: color)
        )
    }
}
