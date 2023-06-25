//
//  StoringUserSettingUsingUserDefault.swift
//  iExpense
//
//  Created by Yongye Tan on 3/5/23.
//

import SwiftUI

struct StoringUserSettingUsingUserDefault: View {
    // load the previously tapped variable
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    // Using AppStorage is similar to UserDefaults except AppStorage doesn’t make it easy to handle storing complex objects such as Swift structs
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
            // save the user data
            // There is a single set() method that accepts any kind of data – integers, Booleans, strings, and more.
//            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}

struct StoringUserSettingUsingUserDefault_Previews: PreviewProvider {
    static var previews: some View {
        StoringUserSettingUsingUserDefault()
    }
}
