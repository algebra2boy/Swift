//
//  ContentView.swift
//  ViewModifier
//
//  Created by Yongye Tan on 1/24/23.
//

import SwiftUI
// reusable function
struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
    
}

struct ContentView: View {
    @State private var changeColorText = false
    
    let text1 = Text("Welcome")
    let text2 = Text("to swift")
    
    @ViewBuilder var a_view: some View {
        Text("How are you")
        Text("I am doing good")
    }
    
    var body: some View {
//        Text("Hello")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(.red)
        VStack {
            Button("Hello, world!") {
                print(type(of: self.body))
            }
            .background(.red)
            .frame(width: 200, height: 200)
            
            Button("press me ") {
                changeColorText.toggle()
            }
            .foregroundColor(changeColorText ? .red :.blue)
            
            text1.foregroundColor(.red)
            text2.foregroundColor(.green)
            
            a_view
            
            CapsuleText(text: "SWIFT")
            CapsuleText(text: "UI")
            
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
