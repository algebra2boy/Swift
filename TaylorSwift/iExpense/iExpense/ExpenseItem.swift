//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Yongye Tan on 3/5/23.
//

import Foundation

// Identifiable protocol is for identifing uniquely for an object (only requirment is to include id = UUID).
// Codable protocol makes the item archiving
struct ExpenseItem : Identifiable, Codable {
    // unique universalal id, important to identify both struct when both struct has the same data
    var id = UUID()
    // For example, apple, vegetable, $1.0
    let name: String
    let type: String
    let amount: Double
    
}
