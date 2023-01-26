//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Yongye Tan on 1/18/23.
//

import SwiftUI

// a view that render one flag image using the speciic set of modifiers
struct FlagImage: View {
    var name_of_country: String
    
    var body: some View {
        Image(name_of_country)
            .renderingMode(.original)
            .shadow(radius: 10)
    }
}


struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var userChoice = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia",
                     "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack {
//            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom)
            // make the background color
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.5)],
                           center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Text("Guess the flag")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                VStack (spacing: 30){
                    VStack {
                        Text("Tap the flag of ")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundColor(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) {number in
                        Button {
                            // flag was tagged
                            flagTapped(number)
                            askMoreQuestion()
                        } label: {
                            FlagImage(name_of_country: countries[number])
                        }
                    }
                }
                // this stretch the view horizontally as much as possible
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                 // make the background kinda invisible/transluent
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                
                Spacer()
                Spacer()
                
                // display score
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.weight(.bold))
                
                Spacer()
                Spacer()
                
            }
            // make the background board smaller
            .padding(40)
                
            
        }
        // it only presents when showingScore = true
        // so find a way to disable and able it
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askMoreQuestion)
            } message: {
                Text("Your score is \(score), and the flag you chose was the flag of \(userChoice)")
            }
        }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Incorrect"
            showingScore = true
            userChoice = countries[number]
            score = 0
        }
        
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
