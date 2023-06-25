//
//  CircleImage.swift
//  Landmarks
//
//  Created by Yongye Tan on 6/24/23.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            // add gray stroke
            .overlay {
                Circle().stroke(.gray, lineWidth: 4)
            }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
