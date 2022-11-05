import UIKit

import Foundation
import AVFoundation

var player: AVAudioPlayer!


class GameTimer {
    
    static var TimerStart = GameTimer()
    
    func lose() {
        let url = Bundle.main.url(forResource: "loseSound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func correctAnswer() {
        let url = Bundle.main.url(forResource: "correctAnswer", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    
    func playingGame() {
        let url = Bundle.main.url(forResource: "zvukTikanya1", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func winGame() {
        let url = Bundle.main.url(forResource: "winGame", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
