//
//  VisitorListView.swift
//  SwiftDataDemo
//
//  Created by Yongye Tan on 1/2/24.
//

import SwiftUI
import SwiftData

struct VisitorListView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var visitors: [Visitor]
    
    var body: some View {
        List {
            ForEach(visitors) { visitor in
                NavigationLink(value: visitor) {
                    if (visitor.lastName.isEmpty) {
                        Text("Edit new visitor")
                            .foregroundColor(Color.gray)
                    } else {
                        Text(visitor.fullName)
                    }
                }
            }
            .onDelete(perform: deleteVistors)
        }
    }
    
    // When accessing a variable from an initializer, the variable name must be prefixed with an underscore (_)
    init(searchText: String) {
        _visitors = Query(filter: #Predicate {
            if (searchText.isEmpty) {
                return true
            } else {
                return $0.firstName.localizedStandardContains(searchText)
            }
        })
    }
    
    private func deleteVistors(_ indexSet: IndexSet) {
        for index in indexSet {
            let vistor = visitors[index]
            modelContext.delete(vistor)
        }
    }
}

//#Preview {
//    VisitorListView(searchText: "")
//}
