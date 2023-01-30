//
//  ScrambleView.swift
//  Scramble
//
//  Created by Yongye Tan on 1/30/23.
//

import SwiftUI

struct ScrambleView: View {
    
    @State private var useWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false


    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .autocapitalization(.none)
                }
                
                Section {
                    ForEach(useWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                        
                    }
                 }
            }
            // put this here in the list's modifier, instead of NavigationView's modifier
            .navigationTitle(rootWord)
        }
        // add an action to the view when user submit an value to the view
        .onSubmit (addNewWord)
        // run a function when the view is shown
        .onAppear(perform: startGame)
        // add an alert
        .alert(errorTitle, isPresented: $showingError) {
            Button("Okay", role: .cancel) {}
        } message: {
            Text(errorMessage)
        }
        
    }
    
    func addNewWord() {
        // step1: lowercase the string and get rid of the whitespace and new lines
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        // making sure that we have at least one characrter
        guard answer.count > 0 else { return }
        
        // making the word is not duplicated
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original!")
            return
        }
        
        // the word is able to be constructed using the rootword
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You cannot spell that word from \(rootWord)")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognize", message: "The word is not real")
            return
        }
        
        
        // add the word to the front of array
        // use insert for specific position
        // use append for end of array
        // make the transition more smoooth
        withAnimation {
            useWords.insert(answer, at: 0)
        } 
        newWord = ""
        
    }
    
    func startGame() {
        // read the txt word using the Bundle
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // if readign works, then load the all the file
            if let startWords = try? String(contentsOf: startWordURL) {
                // separate the fiel using the new line character
                let allWords = startWords.components(separatedBy: "\n")
                // rootWord is not an optional variable, so it must have
                // an optional when randomElement() does not work
                rootWord = allWords.randomElement() ?? "apple"
                print(rootWord)
                return
            }
        }
        // url could not be found or could not be loaded
        // terminate the program
        fatalError("The program could not load start.txt from bundle")
    }
    
    func isOriginal(word: String) -> Bool {
        return !useWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let position = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: position)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspellRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspellRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
 
    
}

struct ScrambleView_Previews: PreviewProvider {
    static var previews: some View {
        ScrambleView()
    }
}
