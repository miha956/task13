//
//  ViewController.swift
//  AVFoundation_Audio
//
//  Created by Niki Pavlove on 18.02.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var songNameLabel: UILabel!
    
    var player = AVAudioPlayer()
    let songs: [String] = ["Queen","adele","eminem","akon"]
    var currentSobgInd: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        playSong(song: songs.first ?? "")
        
    }

    @IBAction func PlayButton(_ sender: Any) {
        if player.isPlaying {
            player.pause()
            playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            
        } else {
            player.play()
            playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
    }
    
    @IBAction func StopButton(_ sender: Any) {
        player.currentTime = 0
        player.stop()
    }
    
    @IBAction func prevSong(_ sender: Any) {
        if currentSobgInd == 1 {
            playSong(song: songs[currentSobgInd - 1])
        } else {
            currentSobgInd -= 1
            playSong(song: songs[currentSobgInd - 1])
        }
    }
    
    @IBAction func nextSong(_ sender: Any) {
        if currentSobgInd == songs.count {
            playSong(song: songs[currentSobgInd - 1])
        } else {
            currentSobgInd += 1
            playSong(song: songs[currentSobgInd - 1])
        }
    }
    
    func playSong(song: String) {
        do {
            player = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: song, ofType: "mp3")!))
            player.prepareToPlay()
            player.play()
            songNameLabel.text = song
        }
        catch {
            print(error)
        }
    }
    
}
