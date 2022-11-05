import UIKit

import Foundation
import AVFoundation

var counter = 0
var timer = Timer()
var timeToAnswer = 30
var secondsPassed = 30
var totalTime = 0
var player: AVAudioPlayer!


class GameTimer {
    
    static var TimerStart = GameTimer()
    
    func lose() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
        let url = Bundle.main.url(forResource: "loseSound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func playingGame() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
        let url = Bundle.main.url(forResource: "zvukTikanya1", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    @objc func updateTimer() {
        if timeToAnswer > 0 {
            timeToAnswer -= 1
            
        }
    }
}
