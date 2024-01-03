//
//  SwiftDataDemoApp.swift
//  SwiftDataDemo
//
//  Created by Yongye Tan on 1/2/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Visitor.self)
    }
}
