//
//  MotionAnimationView.swift
//  HikeApp
//
//  Created by Yongye Tan on 7/10/23.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTIES
    
    // 6 to 12 random circle
    private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            ForEach(0 ..< randomCircle, id: \.self) { item in
                Circle()
                    .foregroundStyle(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoordinate(),
                        y: randomCoordinate()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        // pretty cool spring animation
                        withAnimation(.interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimating.toggle()
                        }
                    })
                
            }
        }
        .frame(width: 250, height: 250)
        // this new modifier applies an alpha channel with a circle shape to the zstack and the result is a mask layer in the rendering system
        // reframe the motion in the circle
        .mask(Circle())
        // this is a high performance rendering
        // Apple's metal framework - direct connection to the GPU
        // tells SwiftUI to render the content into an off screen image before returning it to the screen as a single rendered output
        // resulting a much faster performance and speed
        .drawingGroup()
    }
    
    // MARK: - FUNCTIONS
    
    // 1. random coordinate
    // declare a precise position of any view in SwiftUI, we must use CGFloat
    func randomCoordinate() -> CGFloat {
        CGFloat.random(in: 0...256)
    }
    
    // 2. random size
    func randomSize() -> CGFloat {
        CGFloat(Int.random(in: 4...80))
    }
    // 3. random scale
    func randomScale() -> CGFloat {
        CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // 4. random speed
    func randomSpeed() -> Double {
        Double.random(in: 0.05...1.0)
    }
    
    // 5. random delay
    func randomDelay() -> Double {
        Double.random(in: 0...2)
    }
}

#Preview {
    MotionAnimationView()
        .background(
            Circle()
                .fill(.teal)
        )
        
}
