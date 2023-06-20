//
//  textDrop.swift
//  WorkExperiment
//
//  Created by Yongye Tan on 5/30/23.
//

import SwiftUI

struct textDrop: View {
    @State private var message = ""

    var body: some View {
        Canvas { context, size in
            let formattedText = Text(message).font(.largeTitle).foregroundColor(.red)
            context.draw(formattedText, in: CGRect(origin: .zero, size: size))
        }
        .dropDestination(for: String.self) { items, location in
            message = items.first ?? ""
            return true
        }
    }
}

struct textDrop_Previews: PreviewProvider {
    static var previews: some View {
        textDrop()
    }
}
