//
//  WeSplitApp2.swift
//  WeSplit
//
//  Created by Yongye Tan on 6/8/23.
//

import SwiftUI

struct WeSplitApp2: View {
    @State private var checkAmoount: Double = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Double = 18
    
    let tipPercentages = [10, 15, 20, 25, 50, 100, 0]
    
    var body: some View {
        Form {
            Section {
                TextField("Amount", value: $checkAmoount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
            
            Section {
                Text(checkAmoount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
        }
    }
}

struct WeSplitApp2_Previews: PreviewProvider {
    static var previews: some View {
        WeSplitApp2()
    }
}
