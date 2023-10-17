//
//  KeyBoardShortCut.swift
//  WorkExperiment
//
//  Created by Yongye Tan on 10/13/23.
//

import SwiftUI

struct KeyBoardShortCut: View {
    @FocusState private var focused: Bool
    @State private var key = ""
    
    var body: some View {
        Text(key)
            .focusable()
            .focused($focused)
            .onKeyPress(keys: [.delete, ",", "q"], action: { press in
                niceJob()
                return .handled
            })
            .onAppear {
                focused = true
            }
    }
    
    func niceJob() {
        print("nIce job")
    }
}

#Preview {
    KeyBoardShortCut()
}
