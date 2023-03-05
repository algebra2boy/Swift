//
//  HelloSwiftUIAnimation.swift
//  Animation
//
//  Created by Yongye Tan on 3/4/23.
//

import SwiftUI

struct HelloSwiftUIAnimation: View {
    let letters = Array("Hello, SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    var body: some View {
        HStack (spacing: 0) {
            ForEach(0..<letters.count) { index in
                Text(String(letters[index]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    // delay makes the letter look like chain reaction
                    .animation(.default.delay(Double(index) / 20), value: dragAmount)
                
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
}

struct HelloSwiftUIAnimation_Previews: PreviewProvider {
    static var previews: some View {
        HelloSwiftUIAnimation()
    }
}
