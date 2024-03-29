//
//  AnimalGesture.swift
//  Animation
//
//  Created by Yongye Tan on 3/4/23.
//

import SwiftUI

struct AnimalGesture: View {
    
    @State private var dragAmount = CGSize.zero
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation}
                    .onEnded { _ in
                        withAnimation {
                            dragAmount = .zero}
                    }
            )
    }
}

struct AnimalGesture_Previews: PreviewProvider {
    static var previews: some View {
        AnimalGesture()
    }
}
