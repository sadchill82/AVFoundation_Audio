//
//  ViewController.swift
//  AVFoundation_Audio
//
//  Created by Niki Pavlove on 18.02.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    var currentTrackIndex = 0
    let tracks = [
        ("Queen", "mp3"),
        ("Celine Dion", "mp3"),
        ("Sia", "mp3"),
        ("Katty Perry", "mp3"),
        ("Bruno Mars", "mp3")
    ]
    
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var trackLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadTrack(index: currentTrackIndex)
    }
    
    func loadTrack(index: Int) {
        guard index >= 0, index < tracks.count else { return }
        
        let track = tracks[index]
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: track.0, ofType: track.1)!))
            player.prepareToPlay()
            trackLabel.text = "Now Playing: \(track.0)"
        } catch {
            print("Error loading track: \(error)")
        }
    }

    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        if player.isPlaying {
            player.pause()
            playPauseButton.setTitle("Play", for: .normal)
        } else {
            player.play()
            playPauseButton.setTitle("Pause", for: .normal)
        }
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        player.stop()
        player.currentTime = 0
        playPauseButton.setTitle("Play", for: .normal)
    }
    
    @IBAction func nextTrackButtonTapped(_ sender: UIButton) {
        currentTrackIndex = (currentTrackIndex + 1) % tracks.count
        loadTrack(index: currentTrackIndex)
        player.play()
        playPauseButton.setTitle("Pause", for: .normal)
    }
    
    @IBAction func previousTrackButtonTapped(_ sender: UIButton) {
        currentTrackIndex = (currentTrackIndex - 1 + tracks.count) % tracks.count
        loadTrack(index: currentTrackIndex)
        player.play()
        playPauseButton.setTitle("Pause", for: .normal)
    }
}
