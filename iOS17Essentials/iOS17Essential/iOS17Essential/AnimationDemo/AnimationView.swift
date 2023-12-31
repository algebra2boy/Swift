//
//  AnimationView.swift
//  iOS17Essential
//
//  Created by Yongye Tan on 12/31/23.
//

import SwiftUI

struct AnimationView: View {
    
    @State private var rotation: Double = 0
    
    var body: some View {
        Button(action: {
            self.rotation = (self.rotation < 360 ? self.rotation + 90 : 0)
        }, label: {
            Text("Click to animation")
                .rotationEffect(.degrees(rotation))
                //  when the rotation reaches a full 360 degrees, the view rotates counter-clockwise 360 degrees, but so quickly the effect is not visible. These effects can be slowed down and smoothed out by adding the animation() modifier with an optional animation curve to control the timing of the animation:
                .animation(.linear, value: rotation)
        })
        
    }
}

#Preview {
    AnimationView()
}
