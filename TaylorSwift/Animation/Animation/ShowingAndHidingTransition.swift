//
//  ShowingAndHidingTransition.swift
//  Animation
//
//  Created by Yongye Tan on 3/4/23.
//

import SwiftUI

struct ShowingAndHidingTransition: View {
    @State private var isShowingRed = false
    var body: some View {
        VStack {
            Button("Tap me") {
                // make the smooth transition
                withAnimation {
                    // showing and hidding the red rectangle
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    // make the rectangle goes from small to big and vice and verse
                    .transition(.scale)
            }
        }
    }
}

struct ShowingAndHidingTransition_Previews: PreviewProvider {
    static var previews: some View {
        ShowingAndHidingTransition()
    }
}
