//
//  BindingToggle.swift
//  BookWorm
//
//  Created by Yongye Tan on 7/3/23.
//

import SwiftUI

struct BindingToggle: View {
    @State private var rememberMe = false
    var body: some View {
        
        VStack {
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On": "Off")
        }
    }
}

public struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white:0.6), Color(white: 0.4)]
    
    public var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
    
    
}


struct BindingToggle_Previews: PreviewProvider {
    static var previews: some View {
        BindingToggle()
    }
}
