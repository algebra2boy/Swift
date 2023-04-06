//
//  ScrollingGrid.swift
//  Moonshot
//
//  Created by Yongye Tan on 4/5/23.
//

import SwiftUI

struct ScrollingGrid: View {
    // crazy grid item (make columns of data, a grid of information)
    // manually make grid items
//    let layout = [
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80))
//    ]
    
    // let swiftui to figure out how many grid items to fit into a screen
    // good for if we work on different screen size
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
    ]
    
    
    
    var body: some View {
        ScrollView {
            
            // prevent loading unnecessarily too much
            LazyVGrid(columns: layout) {
                ForEach(0..<200) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct ScrollingGrid_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingGrid()
    }
}
