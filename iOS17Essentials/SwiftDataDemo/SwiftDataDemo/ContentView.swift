//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by Yongye Tan on 1/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            VisitorListView(searchText: searchText)
                .navigationTitle("Vistors")
                .searchable(text: $searchText)
                .navigationDestination(for: Visitor.self) { visitor in
                    VisitorDetailView(visitor: visitor)
                }
                .toolbar {
                    Button {
                        addVistor()
                    } label: {
                        Label("New Visitor", systemImage: "plus")
                    }
                    .labelStyle(.iconOnly)
                }
        }
    }
    
    private func addVistor() {
        let visitor = Visitor(firstName: "", lastName: "")
        modelContext.insert(visitor)
    }
}

#Preview {
    ContentView()
}
