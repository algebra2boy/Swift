//
//  dropImageView.swift
//  WorkExperiment
//
//  Created by Yongye Tan on 5/30/23.
//

import SwiftUI

//struct dropImageView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
struct dropImageView: View {
    let sports = ["figure.badminton", "figure.cricket", "figure.fencing"]
    @State private var dropImage = Image(systemName: "photo")

    var body: some View {
        VStack {
            HStack {
                ForEach(sports, id: \.self) { sport in
                    Image(systemName: sport)
                        .frame(minWidth: 50, minHeight: 50)
                        .background(.red)
                        .foregroundColor(.white)
                        .draggable(Image(systemName: sport))
                }
            }
            .frame(minWidth: 300, minHeight: 70)
            .background(.gray)

            dropImage
                .frame(width: 150, height: 150)
                .background(.green)
                .foregroundColor(.white)
                .dropDestination(for: Image.self) { items, location in
                    dropImage = items.first ?? Image(systemName: "photo")
                    return true
                }
        }
    }
}

struct dropImageView_Previews: PreviewProvider {
    static var previews: some View {
        dropImageView()
    }
}
