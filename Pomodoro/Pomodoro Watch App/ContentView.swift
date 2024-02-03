//
//  ContentView.swift
//  Pomodoro Watch App
//
//  Created by Yongye Tan on 2/3/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var player: AVAudioPlayer?
    @State private var isTapped: Bool = false
    
    @State private var studyTimeSelection: Int = 25
    @State private var restTimeSelection: Int = 5
    @State private var isStudying: Bool = false
    
    @State private var timeRemaining: Int = 0
    
    
    var body: some View {
        
        NavigationStack {
            
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink {
                        PickerView(studyTimeSelection: $studyTimeSelection,
                                   restTimeSelection: $restTimeSelection)
                    } label: {
                        Image(systemName: "arrow.right")
                    }
                    .buttonStyle(.plain)
                    
                }
                
                
                VStack(spacing: 5) {
                    Button(action: didTap) {
                        Image("tomato")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 100)
                    }
                    .buttonStyle(.plain)
                    
                    Text("\(timeRemaining / 60):\(String(format: "%02d", timeRemaining % 60))")
                        .font(.title)
                        .onReceive(timer) { _ in
                            
                            if (!isTapped) {
                                return
                            }
                            
                            if timeRemaining > 0 {
                                timeRemaining -= 1
                            } else {
                                // timer.upstream.connect().cancel()
                                isStudying.toggle()
                                isTapped = true
                                setUpTime()
                                playSound()
                            }
                        }
                    
                    Text(isStudying ? "Study" : "Rest")
                }
                
                
            }
            .navigationTitle("Pomodoro")
            .onAppear(perform: setUpTime)
            
        }
    }
    
    private func setUpTime() {
        timeRemaining = (isStudying ? studyTimeSelection : restTimeSelection)  * 60
    }
    
    func didTap() {
        isTapped.toggle()
        isStudying.toggle()
        setUpTime()
        playSound()
    }
    
    func playSound() {
        // specify the file path
        guard let path = Bundle.main.path(forResource: "testing", ofType:"mp3") else {
            return
        }
        
        // use the file path to get the file url
        let url = URL(filePath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("there is an error")
        }
    }
}

#Preview {
    ContentView()
}
