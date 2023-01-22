//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Yongye Tan on 1/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia",
                     "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack (spacing: 30){
                VStack {
                    Text("Tap the flag of ")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                
                ForEach(0..<3) {number in
                    Button {
                        // flag was tagged
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .shadow(radius: 10)
                    }
                }
            }
        }
        // it only presents when showingScore = true
        // so find a way to disable and able it
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askMoreQuestion)
            } message: {
                Text("Your score is ???")
            }
        }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Incorrect"
        }
        
        showingScore = true
    }
    
    func askMoreQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
