//
//  Expenses.swift
//  iExpense
//
//  Created by Yongye Tan on 3/5/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
