//
//  AudioPlayer.swift
//  Restart
//
//  Created by Yongye Tan on 7/9/23.
//

import Foundation
import AVFoundation // this is used for movive and sound

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    // find the path name of the sound file if it works
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            // try initalize an object using the content from the sound path url
            audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
            // play the sound
            audioPlayer?.play()
        } catch {
            print("Could not play hte sound file.")
        }
    }
}
