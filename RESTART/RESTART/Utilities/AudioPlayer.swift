//  AudioPlayer.swift
//  RESTART
//
//  Created by Sowad Hossain Rafi on 22/6/23.

// AV Foundation is a full-featured framework for working with time-based audiovisual media on iOS, MacOS, WatchOS, and tvOS.
// We can easily play, create, and edit movies, sound files and build powerful media functionality into any apps using this framework.

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            //audioPlayer?.prepareToPlay() // Add this line to prepare the audio player
            audioPlayer?.play()
        } catch {
            print("Could not play the sound file.")
        }
    }
}
