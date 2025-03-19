//
//  ContentView.swift
//  Pomodoro Watch App
//
//  Created by Yongye Tan on 2/3/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State private var isActive = false
    @State private var isStudying = true
    @State private var timeRemaining = 25 * 60 // Default 25 minutes
    @State private var studyTime = 25
    @State private var restTime = 5
    @State private var player: AVAudioPlayer?
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                HStack {
                    
                    Button(action: resetToInitial) {
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundColor(.red)
                    }
                    .buttonStyle(.plain)
                    
                    Spacer()
                    
                    NavigationLink {
                        PickerView(studyTimeSelection: $studyTime,
                                   restTimeSelection: $restTime)
                    } label: {
                        Image(systemName: "arrow.right")
                    }
                    .buttonStyle(.plain)
                    
                }
                
                VStack {
                    Button(action: toggleTimer) {
                        Image("tomato")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 80)
                    }
                    .buttonStyle(.plain)
                    
                    Text("\(timeRemaining / 60):\(String(format: "%02d", timeRemaining % 60))")
                        .font(.title)
                        .onReceive(timer) { _ in
                            guard isActive else { return }
                            
                            if timeRemaining > 0 {
                                timeRemaining -= 1
                            } else {
                                switchMode()
                            }
                        }
                    
                    Text(isStudying ? "Study" : "Rest")
                }
            }
            .padding(.top, 13)
            // .navigationTitle("Pomodoro")
            .onAppear(perform: resetTimer)
        }
    }
    
    private func toggleTimer() {
        isActive.toggle()
        if isActive {
            playSound()
        }
    }
    
    private func switchMode() {
        isStudying.toggle()
        resetTimer()
        playSound()
    }
    
    private func resetTimer() {
        timeRemaining = (isStudying ? studyTime : restTime) * 60
    }
    
    private func resetToInitial() {
        isActive = false
        isStudying = true
        timeRemaining = studyTime * 60
    }
    
    private func playSound() {
        guard let path = Bundle.main.path(forResource: "timeUp", ofType: "mp3"),
              let url = URL(string: path) else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound: \(error)")
        }
    }
}

#Preview {
    ContentView()
}
