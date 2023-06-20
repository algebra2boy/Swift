//
//  TextFieldMultiline.swift
//  WorkExperiment
//
//  Created by Yongye Tan on 6/15/23.
//

import SwiftUI

struct TextFieldMultiline: View {
    @State private var text: String = ""
    var body: some View {
        Form {
            TextField("HELLO", text: $text, axis: .vertical)
                .textFieldStyle(.roundedBorder)
            TextField("HELLO", text: $text, axis: .vertical)
                .textFieldStyle(.roundedBorder)
        }

    }
}


struct TextFieldMultiline_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldMultiline()
    }
}
