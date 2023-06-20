//
//  imageDrop.swift
//  WorkExperiment
//
//  Created by Yongye Tan on 5/30/23.
//

import SwiftUI

//struct imageDrop: View {
//    @State private var image = Image(systemName: "photo")
//
//    var body: some View {
//        image
//            .resizable()
//            .scaledToFit()
//            .frame(width: 500, height: 500)
//            .dropDestination(for: Data.self) { items, location in
//                guard let item = items.first else { return false }
//                guard let uiImage = UIImage(data: item) else { return false }
//                image = Image(uiImage: uiImage)
//                return true
//            }
//
//    }
//}

struct imageDrop: View {
    @State private var images = [Image]()

    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<images.count, id: \.self) { i in
                    images[i]
                        .resizable()
                        .scaledToFit()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .dropDestination(for: Data.self) { items, location in
            images = items.compactMap {
                UIImage(data: $0).map(Image.init)
            }

            return true
        }
    }
}

struct imageDrop_Previews: PreviewProvider {
    static var previews: some View {
        imageDrop()
    }
}
