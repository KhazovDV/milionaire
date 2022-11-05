//
//  ViewControllerTest3.swift
//  millionaire
//
//  Created by garpun on 04.11.2022.
//

import UIKit
import AVFoundation

class ViewControllerTest3: UIViewController {
    
    @IBOutlet weak var questionsLabel: UITextView!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func hintFiftyButton(_ sender: UIButton) {
    }
    @IBAction func hintSeventeeButton(_ sender: UIButton) {
    }
    
    @IBAction func hintImmortalityButton(_ sender: UIButton) {
    }
    
    @IBAction func hintTakeMoneyButton(_ sender: UIButton) {
    }
    
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    
    @IBAction func answerButton(_ sender: UIButton) {
        let allButtons = [answer0, answer1, answer2, answer3]
        timer.invalidate()
        timerLabel.text = "30"
        secondsPassed = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
        let url = Bundle.main.url(forResource: "zvukTikanya", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    @objc func updateTimer() {
        if timeToAnswer > 0 {
            timerLabel.text = "\(timeToAnswer)"
            print("\(timeToAnswer)")
            timeToAnswer -= 1
            
        }
    }
}
