//
//  AudioPlayerManager.swift
//  BachelorsExperiment
//
//  Created by Andreas Garcia on 2024-02-07.
//

import Foundation
import AVFoundation

class AudioPlayerManager: ObservableObject {
    var audioPlayer: AVAudioPlayer?
    
    func playMusic(file: String, type: String) {
        guard let path = Bundle.main.path(forResource: file, ofType: type) else {
            print("Music file not found.")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("An error occurred while trying to play music: \(error.localizedDescription)")
        }
    }
    
    func pauseMusic() {
        audioPlayer?.pause()
    }
    
    func playOrPauseMusic() {
        guard let player = audioPlayer else { return }
        if player.isPlaying {
            player.pause()
        } else {
            player.play()
        }
    }
}
