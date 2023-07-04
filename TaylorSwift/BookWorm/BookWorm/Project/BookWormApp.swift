//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Yongye Tan on 7/3/23.
//

import SwiftUI

@main
struct BookWormApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
