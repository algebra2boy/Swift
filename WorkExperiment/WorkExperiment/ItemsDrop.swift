//
//  ItemsDrop.swift
//  WorkExperiment
//
//  Created by Yongye Tan on 5/30/23.
//

import SwiftUI


struct ItemsDrop: View {
    @State private var image = Image(systemName: "photo")

    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .frame(width: 500, height: 500)
            .dropDestination(for: Data.self) { items, location in
                guard let item = items.first else { return false }
                guard let uiImage = UIImage(data: item) else { return false }
                image = Image(uiImage: uiImage)
                return true
            }

    }
}

struct ItemsDrop_Previews: PreviewProvider {
    static var previews: some View {
        ItemsDrop()
    }
}
