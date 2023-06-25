//
//  DeletingItemsUsingOnDelete.swift
//  iExpense
//
//  Created by Yongye Tan on 3/5/23.
//

import SwiftUI

struct DeletingItemsUsingOnDelete: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    var body: some View {
        NavigationView {
            VStack {
                List {
                    // onDelete only works with ForEach
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    // removeRows is function that remove row entry
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .navigationTitle("OnDelete()")
            .toolbar {
                // swiftUI built-in library (show a "delete" button for every row)
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct DeletingItemsUsingOnDelete_Previews: PreviewProvider {
    static var previews: some View {
        DeletingItemsUsingOnDelete()
    }
}
