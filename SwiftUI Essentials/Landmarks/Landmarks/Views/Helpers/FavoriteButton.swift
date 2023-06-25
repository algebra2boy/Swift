//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Yongye Tan on 6/25/23.
//

import SwiftUI

struct FavoriteButton: View {
    // Because we use a binding, changes made inside this view propagate back to the data source.
    // A binding controls the storage for a value, so you can pass data around to different views that need to read or write it. More than one view might uses the same.
    @Binding var isSet: Bool
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                // hide the title
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
                
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
