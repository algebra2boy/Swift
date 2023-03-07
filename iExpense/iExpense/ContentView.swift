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
                // display the name of each item
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer() // push to the right
                        
                        // use user's preferred urrency
                        if (item.amount < 10){
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USA"))
                                .foregroundColor(.green)
                        } else if (item.amount < 100) {
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USA"))
                                .foregroundColor(.yellow)
                        } else {
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USA"))
                                .foregroundColor(.red)
                                .bold()
                                .underline()
                        }
                        
                    }
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

