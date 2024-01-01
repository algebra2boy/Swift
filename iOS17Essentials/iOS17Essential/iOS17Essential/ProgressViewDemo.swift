//
//  ProgressViewDemo.swift
//  iOS17Essential
//
//  Created by Yongye Tan on 12/31/23.
//

import SwiftUI

struct ProgressViewDemo: View {
    
    @State private var progress: Double = 1.0
    
    var body: some View {
        VStack {
            ProgressView("Task Progress", value: progress, total: 100)
                .progressViewStyle(.linear)
                .tint(.red)
            
            ProgressView("Task Progress", value: progress, total: 100)
                .progressViewStyle(.circular)
            ProgressView("Task Progress", value: progress, total: 100)
                .progressViewStyle(ShadowProgressViewStyle())
            Slider(value: $progress, in: 1...100, step: 0.1)
        }
        .padding()
    }
}

struct ShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .tint(.red)
            .shadow(color: Color(red: 0, green: 0.7, blue: 0), radius: 5.0, x: 2.0, y: 2.0)
            .progressViewStyle(.linear)
    }
}

#Preview {
    ProgressViewDemo()
}
