//
//  AnimationStack.swift
//  Animation
//
//  Created by Yongye Tan on 3/4/23.
//

import SwiftUI

struct AnimationStack: View {
    @State private var enabledColor = false
    
    var body: some View {
        
        Button("Tap Me") {
            enabledColor.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabledColor ? .blue : .red)
        // make the smooth transition
        .animation(.default, value: enabledColor)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabledColor ? 60 :0 ))
        // make the spring animation
        .animation(.interpolatingSpring(stiffness: 10, damping: 10), value: enabledColor)
        
        
        
    }
}

struct AnimationStack_Previews: PreviewProvider {
    static var previews: some View {
        AnimationStack()
    }
}
