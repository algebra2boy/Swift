//
//  ContentView.swift
//  Moonshot
//
//  Created by Yongye Tan on 3/15/23.
//

import SwiftUI

// make a struct class for customization
struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Making a new text called \(text)")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        // can also set up to .horizontal, but LazyVStack needs to change to LazyHStack
        ScrollView (.vertical) {
            /*
             LazyVStack is very similar Vstack except the views are only shown until they are actually loaded to the screen
             LazyVStack views are made when they are actually needed
             
             LazyStack automatically take up all ava. space
             normal stack will fit in the ava. space only
             */
            LazyVStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            // so it can be clickable outside the scrollview
            .frame(maxWidth: .infinity)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
