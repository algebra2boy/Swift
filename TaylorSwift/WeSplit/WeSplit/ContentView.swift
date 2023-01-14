//
//  ContentView.swift
//  WeSplit
//
//  Created by Yongye Tan on 1/14/23.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    let students = ["Tina", "Yongye", "Michael"]
    @State private var selectedStudent = "Yongye"
    
    var body: some View {
        Button("Tap Count \(tapCount)") {
            tapCount += 1
        }
        Form {
            TextField("Enter your name", text: $name)
            Text("Your name is \(name)")
        }
        
        Form {
            ForEach(0..<10) {
                Text("Row \($0)")
                
            }
        }
        
        NavigationView {
            Form {
                Picker("Select your friend",
                       selection: $selectedStudent) {
                    ForEach(students, id:\.self) {
                        Text($0)
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
