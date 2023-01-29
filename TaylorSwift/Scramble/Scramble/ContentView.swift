//
//  ContentView.swift
//  Scramble
//
//  Created by Yongye Tan on 1/28/23.
//

import SwiftUI

struct ContentView: View {
    let classes = ["Math", "History", "Computer Science"]
    var body: some View {
        // List can have iterate through row without forEach loop
        List {
            ForEach(1..<5) {
                Text("\($0)")
            }
            Section {
                ForEach(classes, id: \.self) { c in
                    Text("\(c) classes")
                }
            }
        }
    }
    // how to load a file from a bundle
    func loadFile() {
        if let fileURL = Bundle.main.url(forResource: "file-name", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                // do something with fileContents
            }
        }
    }
    
    func test() {
        
        let input = """
            a
            b
            c
            """
        let letters = input.components(separatedBy: "\n") // -> [a,b,c]
        let letter = letters.randomElement()
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let miseppledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        // check if the word is spell correctly
        let allgood = miseppledRange.location == NSNotFound
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
