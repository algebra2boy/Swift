//
//  Expenses.swift
//  iExpense
//
//  Created by Yongye Tan on 3/5/23.
//

import Foundation

// ObservableObject comes with Publishe property wrapper
class Expenses: ObservableObject {
    // store a arraylist expenseitem that is going to be shared among classes
    @Published var items = [ExpenseItem]() {
        didSet {
            
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        // read from the user default
        if let saveItems = UserDefaults.standard.data(forKey: "Items") {
            // decode the userdefault
            //
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: saveItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
