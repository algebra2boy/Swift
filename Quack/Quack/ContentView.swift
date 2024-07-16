//
//  ContentView.swift
//  Quack
//
//  Created by Yongye on 7/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            Text("side bar")
        } detail: {
            Text("detail view")
        }
    }
}

#Preview {
    ContentView()
}
