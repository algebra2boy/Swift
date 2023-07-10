//
//  onBoardingView.swift
//  Restart
//
//  Created by Yongye Tan on 12/29/22.
//

import SwiftUI

struct onBoardingView: View {
    // MARK: - PROPERTY
    
    // This true value will only be added to the property when the program does not find the onboarding key previously set in the device's permanent storage
    // It will ignore the value set if there is a one already
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffSet: CGFloat = 0
    @State private var isAnimating = false
    @State private var imageOffSet: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle = "Give."
    
    var body: some View {
        
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                // MARK: - HEADER
                
                Spacer()
                
                VStack {
                    Text(textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .transition(.opacity)
                        // explictyly tell SwiftUI that this is a different view after the value change
                        .id(textTitle)
                    
                    Text("""
                    It's not how much we give but
                    how much love we love giving.
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                }
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeInOut(duration: 1), value: isAnimating)
                
                // MARK: - CENTER
                
                ZStack {
                    // a circle is on top of another circle (overlapping the views)
                    // this is at the bottom (SwiftUI render this first)
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.3)
                    // when user drag the picture to left, right goes to right, and vice verse
                        .offset(x: imageOffSet.width * -1)
                        .blur(radius: abs(imageOffSet.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffSet)
                    
                    // this renders on top of the view
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        // move the image in horzontal direction, but in the y direction
                        .offset(x: imageOffSet.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffSet.width / 20)))
                        // provide gesture movement to move the image
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if abs(imageOffSet.width) <= 150 {
                                        imageOffSet = gesture.translation
                                        
                                        // make the symbol disappear if image is being dragged
                                        withAnimation(.linear(duration: 0.25)) {
                                            indicatorOpacity = 0
                                            textTitle = "Give."
                                        }
                                    }
                                }
                                .onEnded { _ in
                                    imageOffSet = .zero
                                    // make the symbol appears again if image is stop being dragged
                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpacity = 1
                                        textTitle = "Share."
                                    }
                                }
                        )
                        // add animation whenever imageOffSet changeed
                        .animation(.easeOut(duration: 1), value: imageOffSet)
                }
                // the little circle
                .overlay(alignment: .bottom) {
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundStyle(.white)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1 : 0)
                    // delay the animation 2 seconds after isAnimating turns true
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(indicatorOpacity)
                }
                
                
                Spacer()
                
                // MARK: - FOOTER
                
                ZStack {
                    // Parts of the custom button
                    
                    // 1. background (static)
                    // a capsule outside and a smaller capsure inside
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    // 2. call to action (static)
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded, weight: .bold))
                        .foregroundStyle(.white)
                        .offset(x: 20)
                    
                    // 3. capsule ( dynamic width)
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            // add the smoothing render the pink background effect
                            .frame(width: buttonOffSet + 80)
                        Spacer()
                    }
                    
                    // 4. circle (draggble)
                    
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                            
                        }
                        .foregroundStyle(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        // move the button
                        .offset(x: buttonOffSet)
                        // trigger user's gesture
                        .gesture(
                            DragGesture()
                                // two state: user dragging the button (onChanged) and finish dragging
                                .onChanged { gesture in
                                    // only allow left to right movement and prevent going out of the box
                                    // buttonWidth - 80 is the right edge
                                    if gesture.translation.width > 0 && buttonOffSet <= buttonWidth - 80 {
                                        buttonOffSet = gesture.translation.width
                                    }
                                }
                                .onEnded { _ in
                                    withAnimation(Animation.easeOut(duration: 0.4)) {
                                        // past mid-line
                                        if buttonOffSet > buttonWidth / 2 {
                                            // move to the edge
                                            buttonOffSet = buttonWidth - 80
                                            isOnboardingViewActive = false
                                        } else {
                                            buttonOffSet = 0
                                        }
                                    }
                                }
                                    
                        )
                        
                        Spacer()
                    }
                    
                }
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            }
        }
        .onAppear(perform: {
            isAnimating = true
        })
        
        
    }
}

struct onBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        onBoardingView()
    }
}
