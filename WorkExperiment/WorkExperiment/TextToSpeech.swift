//
//  TextToSpeech.swift
//  WorkExperiment
//
//  Created by Yongye Tan on 6/28/23.
//

import SwiftUI
import AVFoundation

struct TextToSpeech: View {
    @State private var text: String = ""
    var body: some View {
        VStack {
            TextField("text", text: $text)
            
            Button("Great") {
                let utterrance = AVSpeechUtterance(string: text)
                utterrance.voice = AVSpeechSynthesisVoice(language: "en-US")
                utterrance.rate = 0.5
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterrance)
            }
        }
    }
}

