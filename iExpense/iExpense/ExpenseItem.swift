//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Yongye Tan on 3/5/23.
//

import Foundation

// protocol is for identifing uniquely for an object (only requirment is to include id = UUID).
struct ExpenseItem:Identifiable{
    // unique universalal id, important to identify both struct when both struct has the same data
    let id = UUID()
    // For example, apple, vegetable, $1.0
    let name: String
    let type: String
    let amount: Double
}
