//
//  LongPressingView.swift
//  WorkExperiment
//
//  Created by Yongye Tan on 10/16/23.
//

import SwiftUI

struct LongPressingView: View {
    var body: some View {
        Text("Hello, World!")
            .onLongPressGesture(minimumDuration: 5) {
                print("Long pressed haha!")
            }
    }
}

#Preview {
    LongPressingView()
}
