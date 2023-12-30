//
//  NavigationSplitViewCaseStudy.swift.swift
//  iOS17Essential
//
//  Created by Yongye Tan on 12/29/23.
//

import SwiftUI

struct NavigationSplitViewCaseStudy: View {
    
    @State private var colors = ["Red", "Green", "Blue"]
    @State private var selectedColor: String?
    @State private var columnVisility: NavigationSplitViewVisibility = .detailOnly
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisility) {
            List(colors, id: \.self, selection: $selectedColor) { color in
                Text(color)
                    .tag(color) // used to differentiate between selectable items in view
            }
            .navigationSplitViewColumnWidth(150)
        } detail: {
            Text( selectedColor ?? "No color selected")
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    NavigationSplitViewCaseStudy()
}
