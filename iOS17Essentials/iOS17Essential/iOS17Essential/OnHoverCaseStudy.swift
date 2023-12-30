//
//  OnHoverCaseStudy.swift
//  iOS17Essential
//
//  Created by Yongye Tan on 12/30/23.
//

import SwiftUI

struct OnHoverCaseStudy: View {
    
    @State private var overText = false
    
    var body: some View {
        Text("Hello, World!")
            .foregroundStyle(overText ? .green : .red)
//            .onHover { over in
//                overText = over
//            }
            // does't exist on MacOS
            #if os(iOS)
            .hoverEffect(.lift)
            #endif
    }
}

#Preview {
    OnHoverCaseStudy()
}
