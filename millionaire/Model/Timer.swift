//
//  Timer.swift
//  millionaire
//
//  Created by garpun on 05.11.2022.
//
 import UIKit
//
//class ViewController : UIViewController {
//
//    var counter = 0
//    var timer = Timer()
//
//    @IBOutlet weak var label: UILabel!
//
//    // start timer
//    @IBAction func startTimerButtonTapped(sender: UIButton) {
//        timer.invalidate() // just in case this button is tapped multiple times
//
//        // start the timer
//        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
//    }
//
//    // stop timer
//    @IBAction func cancelTimerButtonTapped(sender: UIButton) {
//        timer.invalidate()
//    }
//
//    // called every time interval from the timer
//    func timerAction() {
//        counter += 1
//        label.text = "\(counter)"

import Foundation
import AVFoundation

var counter = 0
var timer = Timer()
var timeToAnswer = 30
var secondsPassed = 30
var totalTime = 0
var player: AVAudioPlayer!
