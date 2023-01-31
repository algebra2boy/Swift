//
//  ExplictView.swift
//  Animation
//
//  Created by Yongye Tan on 1/31/23.
//

import SwiftUI

struct ExplictView: View {
    @State private var animationAmount = 0.0
    var body: some View {
        Button("Tap me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 1, z: 1))
    }
}

struct ExplictView_Previews: PreviewProvider {
    static var previews: some View {
        ExplictView()
    }
}
