//
//  CustomButtonView.swift
//  HikeApp
//
//  Created by Yongye Tan on 7/10/23.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack {
            // inner circle
            Circle()
                .fill(
                    LinearGradient(colors: [.customGreenLight, .customGreenMedium],
                    startPoint: .top,
                    endPoint: .bottom)
                )
            
            // add the outer black ring circle style
            Circle()
                .stroke(
                    LinearGradient(colors: [.customGrayLight, .customGrayMedium],
                    startPoint: .top,
                    endPoint: .bottom)
                    , lineWidth: 4)
            
            // hiking emoji
            Image(systemName: "figure.hiking")
                .font(.system(size: 30))
                .fontWeight(.black)
                .foregroundStyle(LinearGradient(colors: [.customGrayLight, .customGrayMedium],
                                                startPoint: .top,
                                                endPoint: .bottom))
        }
        .frame(width: 58, height: 58)
    }
}

#Preview {
    CustomButtonView()
}
