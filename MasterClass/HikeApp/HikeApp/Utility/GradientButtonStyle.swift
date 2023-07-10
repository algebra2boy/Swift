//
//  GradientButtonStyle.swift
//  HikeApp
//
//  Created by Yongye Tan on 7/10/23.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        // this is a skeleton of a custom button style
        configuration
            .label
            .padding(.vertical, 20)
            .padding(.horizontal) // no need to add extra padding to horizontal direction
            .background(
                // Conditional Statement with Nil Coalescing
                configuration.isPressed ?
                LinearGradient(colors: [.customGrayMedium, .customGrayLight], startPoint: .top, endPoint: .bottom) :
                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(40)
    }
}
