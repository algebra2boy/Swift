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
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                    
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    let expense = ExpenseItem(name: "Test", type: "tuition", amount: 1000)
                    expenses.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }
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

