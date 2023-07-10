//
//  LearningTabView.swift
//  PlayGround
//
//  Created by Yongye Tan on 7/9/23.
//

import SwiftUI

struct LearningTabView: View {
    var body: some View {
        // Tab view can show a maximum of five tab items.
        // if there are more than five, swiftui will change the last tab item to "More"
        TabView {
            Text("Home")
                // add a numeric badge on top right
                // this is so cool
                .badge(2)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Text("Explore")
                .tabItem {
                    Label("Explore", systemImage: "network")
                }
            
            Text("Search")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            Text("Notification")
                .badge("!")
                .tabItem {
                    Label("Notification", systemImage: "bell")
                }
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
            Text("NoteBook")
                .tabItem {
                    Label("Notebook", systemImage: "book")
                }
        }
    }
}

#Preview {
    LearningTabView()
}
