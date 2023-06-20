//
//  GridItems.swift
//  Moonshot
//
//  Created by Yongye Tan on 6/17/23.
//

import SwiftUI

struct GridItems: View {
    var body: some View {
        let layout = [
            GridItem(.adaptive(minimum: 80))
//            GridItem(.fixed(80)),
//            GridItem(.fixed(80)),
//            GridItem(.fixed(80)),
        ]
        
        ScrollView (.vertical) {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct GridItems_Previews: PreviewProvider {
    static var previews: some View {
        GridItems()
    }
}
