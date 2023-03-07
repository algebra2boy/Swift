//
//  AddView.swift
//  iExpense
//
//  Created by Yongye Tan on 3/6/23.
//

import SwiftUI

struct AddView: View {
    // this object should be passed, meaning it should not be initialized
    @ObservedObject var expense: Expenses
    
    // only belong to this class
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    // use to dismiss the screen
    @Environment(\.dismiss) var dismiss
    
    let types = ["Buisness", "Personal"]
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                // we are using US dollar
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USA"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expense.items.append(item)
                    
                    // dismiss the screen
                    dismiss()
                }
            }
        }
        
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        // the pre-view should also need to pass the parameter
        AddView(expense: Expenses())
    }
}
