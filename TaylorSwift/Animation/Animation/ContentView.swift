//
//  ContentView.swift
//  Animation
//
//  Created by Yongye Tan on 1/31/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Tap me") {
            // animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        // layer a shape in front of this view
        .overlay(
            Circle()
                .stroke(.red)
                // enlarge the circle
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
            // increasing blur after being clicked
            // .blur(radius: (animationAmount - 1) * 2, opaque: false)
            // smooth effect
            // .eastIn, .eastOut, .eastIntOut,
            // .interpolatingSpring(stiffness: <#T##Double#>, damping: <#T##Double#>)
                .animation(
                // going in and out every 1 second
                    .easeInOut(duration: 1)
                    // delay every second after clicked
                    // .delay(1)
                    // repeat the action forever in opposite direction
                        .repeatForever(autoreverses: true)
                ,value: animationAmount)
        )
        .onAppear {
            animationAmount = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
