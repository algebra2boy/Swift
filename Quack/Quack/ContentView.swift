//
//  ContentView.swift
//  Quack
//
//  Created by Yongye on 7/16/24.
//

import SwiftUI

struct ContentView: View {
    
#if !os(macOS)
    @AppStorage("QuackTabViewCustomization") var tabViewCustomization: TabViewCustomization
#endif
    
    @State private var selectedTab: AppTabs = .order
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab(AppTabs.order.name, systemImage: AppTabs.order.icon, value: .order) {
                OrderNavigationStackView()
            }
            .customizationID(AppTabs.order.customizationID)
            
            Tab(AppTabs.menu.name, systemImage: AppTabs.menu.icon, value: .menu) {
                Text("menu")
            }
            .customizationID(AppTabs.menu.customizationID)
            
            Tab(AppTabs.analytics.name, systemImage: AppTabs.analytics.icon, value: .analytics) {
                Text("Analytics")
            }
            .customizationID(AppTabs.analytics.customizationID)
            
            Tab(value: .search, role: .search) {
                Text("search")
            }
            .customizationID(AppTabs.search.customizationID)
            
        }
        .tabViewStyle(.sidebarAdaptable)
#if !os(macOS)
        .tabViewCustomization($tabViewCustomization) // A new "Edit" button will appear
#endif
        .tint(.red) // TODO: customized this in the future
    }
}

#Preview {
    ContentView()
}
