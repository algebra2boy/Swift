//
//  BindingView.swift
//  Animation
//
//  Created by Yongye Tan on 1/31/23.
//

import SwiftUI

struct BindingView: View {
    @State private var animationAmount = 1.0
    var body: some View {
        print(animationAmount)
        return VStack {
            // animation effect 
            Stepper("Scale amount",value: $animationAmount.animation (
                // 3 in-n-out action every 1 second
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer() // push all the way down
            
            Button("Tap me") {
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            
        }
    }
}

struct BindingView_Previews: PreviewProvider {
    static var previews: some View {
        BindingView()
    }
}
