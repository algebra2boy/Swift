//
//  ContentView.swift
//  AsyncImage
//
//  Created by Yongye Tan on 12/29/22.
//

import SwiftUI

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        
        // Mark:  - 1.BASIC
        // AsyncImage(url: URL(string: imageURL))
        
        // Mark: - 2. SCALE
        // scale: 1.0 is the original size
        // AsyncImage(url: URL(string: imageURL), scale: 3.0)
        
        // Mark: 3. PLACEHOLDER
        // if the picture cannot load
        AsyncImage(url: URL(string: imageURL)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Image(systemName: "photo.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 128)
                .foregroundColor(.purple)
                .opacity(0.5)
        }
        .padding(40)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
