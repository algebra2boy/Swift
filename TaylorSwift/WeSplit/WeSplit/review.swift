//
//  review.swift
//  WeSplit
//
//  Created by Yongye Tan on 6/7/23.
//

import SwiftUI

//struct review: View {
//    @State private var click: Int = 0
//    @State private var name: String = ""
//    var body: some View {

//        NavigationView {
//            Form {
//                Section {
//                    Text("Hello, world!")
//                }
//            }
//            .navigationTitle("SwiftUI")
//            .navigationBarTitleDisplayMode(.large)
//        }
        
//        Form {
//            Section {
//                Button("Click me to increase count") {
//                    self.click += 1
//                }
//                Text("I have been \(click) times")
//            }
//            Section {
//                TextField("Enter your name", text: $name)
//                Text("My name is \(name)")
//            }
//
//            Section {
//                ForEach(0..<100) { number in
//                        Text("Row \(number)")
//                    }
//            }
//
//            }
//        }
//}

struct review: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"

    var body: some View {
        NavigationView {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}


struct review_Previews: PreviewProvider {
    static var previews: some View {
        review()
    }
}
