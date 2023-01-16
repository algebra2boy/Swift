//
//  ContentView.swift
//  WeSplit
//
//  Created by Yongye Tan on 1/14/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 20
    //  exactly like a regular @State property, except it’s specifically designed to handle input focus in our UI.
    // no need to specify a value at the beginning
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages: [Int] = [10, 15, 20, 25, 0]
    
    // calculated var
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount * (tipSelection / 100)
        let grandTotal = checkAmount + tipValue
        
        return grandTotal / peopleCount
    }
    
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    // Locale.current.currency is to match people with different currency, otherwise default to be USD
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    // using a different keyboard
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    // first one is the placeholder, then specify how many people we should select
                    Picker("Number of people", selection: $numberOfPeople) {
                        // a closure to choose more people
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section {
                    Picker("Tip percentage", selection: $tipPercentage ) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.wheel)
                    // try .segmented
                } header: {
                    Text("How much tips do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson * Double(numberOfPeople + 2), format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Total amount with tips")
                }
                
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Amount per person")
                }
                
                
                
            }
            .navigationTitle("Wesplit")
            .navigationBarTitleDisplayMode(.inline)
            // The toolbar() modifier lets us specify toolbar items for a view.
            .toolbar {
                // lets us place one or more buttons in a specific location
                // and a button placement an the keyboard
                ToolbarItemGroup(placement: .keyboard) {
                    // push the button all the way to the right
                    Spacer()
                    Button("Done") {
                        // once the button is pressed, set focus to false
                        amountIsFocused = false
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
