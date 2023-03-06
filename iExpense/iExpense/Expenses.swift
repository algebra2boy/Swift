//
//  Expenses.swift
//  iExpense
//
//  Created by Yongye Tan on 3/5/23.
//

import Foundation

// ObservableObject comes with Publishe property wrapper
class Expenses: ObservableObject {
    // store a list expenseitem that is going to be shared among classes
    @Published var items = [ExpenseItem]()
}
