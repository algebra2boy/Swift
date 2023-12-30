//
//  RenameButtonCaseStudy.swift
//  iOS17Essential
//
//  Created by Yongye Tan on 12/30/23.
//

import SwiftUI

struct RenameButtonCaseStudy: View {
    @State private var text = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        TextField(text: $text) {
            Text("Prompt")
        }
        .focused($isFocused)
        .contextMenu {
            RenameButton()
            // ... your own custom actions
        }
        .renameAction { isFocused = true }
    }
}

#Preview {
    RenameButtonCaseStudy()
}
