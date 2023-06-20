//
//  draggable.swift
//  WorkExperiment
//
//  Created by Yongye Tan on 5/30/23.
//

import SwiftUI

struct draggable: View {
    @State var portrait: Image
    var body: some View {
        portrait
            .cornerRadius(8)
            .draggable(portrait)
            .dropDestination(payloadType: Image.self) { (images: [Image], _) in
                if let image = images.first {
                    portrait = image
                    return true
                }
                return false
            }
    }
}


struct draggable_Previews: PreviewProvider {
    static var previews: some View {
        draggable()
    }
}
