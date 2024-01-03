//
//  VisitorDetailView.swift
//  SwiftDataDemo
//
//  Created by Yongye Tan on 1/2/24.
//

import SwiftUI

struct VisitorDetailView: View {
    
    @Bindable var visitor: Visitor
    
    var body: some View {
        
        Form {
            Section {
                TextField("First name", text: $visitor.firstName)
                TextField("Last name", text: $visitor.lastName)
            } header: {
                Text("Vistor")
            }
            
            Section {
                Button("Add Visit", action: addVisit)
                ForEach(visitor.visits) { visit in
                    Text(visit.date.formatted(date: .abbreviated, time: .shortened))
                }
            } header: {
                Text("Visit History")
            }
        }
        .navigationTitle("Visitor Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func addVisit() {
        let newLog = LogEntry(date: .now)
        visitor.visits.append(newLog)
    }
}

