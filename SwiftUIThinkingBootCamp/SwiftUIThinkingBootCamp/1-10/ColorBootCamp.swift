//
//  ColorBootCamp.swift
//  SwiftUIThinkingBootCamp
//
//  Created by Yongye Tan on 7/16/23.
//

import SwiftUI

struct ColorBootCamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            // Color.primary is black in light node and Color.secondary is white in dark mode
//            .fill(Color.primary)
            .fill(
//                Color(UIColor.systemCyan)
                Color("CustomColor")
            
            )
            .frame(width: 250, height: 200)
//            .shadow(radius: 20)
            .shadow(color: .red.opacity(0.25), radius: 10, x: -20, y: 20)
            
    }
}

#Preview {
    ColorBootCamp()
        .preferredColorScheme(.light)
}
