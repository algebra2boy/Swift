//
//  ContentView.swift
//  iExpense
//
//  Created by Yongye Tan on 3/5/23.
//

import SwiftUI

struct ContentView: View {
    // Expenses is a class
    @StateObject var expenses = Expenses()
    
    // option of showing the view
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            // switch to the other view
            .sheet(isPresented: $showingAddExpense) {
                // passing the initialized expenses object to the other view
                // the other side should receive as a observed object
                AddView(expense: expenses)
            }
            
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct ContentView: View {
//    var body: some View {
        
//        StateOnlyWorksWithStruct()
        
//        ShowingAndHidingViews()
//        DeletingItemsUsingOnDelete()
//        StoringUserSettingUsingUserDefault()
//        ArchivingObjectsWithCodable()
//    }
//}

