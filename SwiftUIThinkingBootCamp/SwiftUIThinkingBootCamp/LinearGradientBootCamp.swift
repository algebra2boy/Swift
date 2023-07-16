//
//  LinearGradientBootCamp.swift
//  SwiftUIThinkingBootCamp
//
//  Created by Yongye Tan on 7/16/23.
//

import SwiftUI

struct LinearGradientBootCamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
                
//                LinearGradient(colors: [.blue, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
                
//                RadialGradient(colors: [.blue, .yellow], center: .center, startRadius: 5, endRadius: 200)
                
                AngularGradient(
                    gradient: Gradient(colors: [Color.red, Color.blue]), center: .topLeading, angle: .degrees(60))
            
            )
            .frame(width: 300, height: 200)
    }
}

#Preview {
    LinearGradientBootCamp()
}
