//
//  CustomBackGroundView.swift
//  HikeApp
//
//  Created by Yongye Tan on 7/10/23.
//

import SwiftUI

struct CustomBackGroundView: View {
    var body: some View {
        ZStack {
            // MARK: - 3. DEPTH
            
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            // MARK: - 2. LIGHT
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            
            // MARK: - 1. SURFACE
            LinearGradient(
                colors: [.customGreenLight,
                         .customGreenMedium
                    ],
            startPoint: .top,
            endPoint: .bottom)
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackGroundView()
}
