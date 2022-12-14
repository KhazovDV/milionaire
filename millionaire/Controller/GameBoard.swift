//
//  ViewControllerTest3.swift
//  millionaire
//
//  Created by garpun on 04.11.2022.
//

import UIKit
import AVFoundation

class GameBoard: UIViewController {
    
    let brain = Brain.brainStart
    let gameSound = GameSound()
    let gameTimer = GameTimer.startTimer
        
    var player: AVAudioPlayer!
    
    var timer = Timer()
    
    @IBOutlet weak var question: UITextView!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var fiftyFifty: UIButton!
    @IBOutlet weak var askTheAudience: UIButton!
    @IBOutlet weak var rightToMakeMistakes: UIButton!
    @IBOutlet weak var takeMoneyNow: UIButton!
    
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    
    @IBAction func fiftyFiftyPressed(_ sender: UIButton) {
        brain.fiftyFifty()
        updateUI()
    }
    
    @IBAction func askAudience(_ sender: UIButton) {
        brain.askAudience()
        updateUI()
    }
        
    @IBAction func makeMistakePressed(_ sender: UIButton) {
        brain.makeMistake()
        updateUI()
        
    }
    
    @IBAction func takeMoneyPressed(_ sender: UIButton) {
        brain.takeMoney()
        performSegue(withIdentifier: "fromGameToScoreBoard", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameTimer.stop()
        
        timer.invalidate()
        
        updateUI()
        gameSound.playingGame()
        
        gameTimer.start()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if gameTimer.totalTime >= 0 {
            timerLabel.text = "\(gameTimer.totalTime)"
        } else {
            timer.invalidate()
            gameTimer.stop()
            brain.instantLoose()
            performSegue(withIdentifier: "fromGameToScoreBoard", sender: nil)
        }
    }
    
    
    @IBAction func answerButton(_ sender: UIButton) {
        let allButtons = [answer0, answer1, answer2, answer3]
        
        let userAnswer = brain.checkAnswer(forAnswer: sender.currentTitle!)
        
        gameSound.userChoice()
                
        sleep(5)
                
        sender.backgroundColor = userAnswer.isUserAnswerCorrect ? .green : .red
        

        for button in allButtons {
            if button!.currentTitle == brain.getCurrentQuestionPack().correctAnswer {
                if brain.lifeLines.makeMistake.activeNow != true {
                    button!.backgroundColor = .green
                }
            }
        }
                
        
        performSegue(withIdentifier: "fromGameToScoreBoard", sender: nil)
         
    }
    
    
    @objc func updateUI() {
        
        let currentQuestion = brain.getCurrentQuestionPack()
        let lifeLines = brain.lifeLines
        
        
        question.text = currentQuestion.question
        
        
        answer0.setTitle(currentQuestion.answers[0], for: .normal)
        answer1.setTitle(currentQuestion.answers[1], for: .normal)
        answer2.setTitle(currentQuestion.answers[2], for: .normal)
        answer3.setTitle(currentQuestion.answers[3], for: .normal)
        
        answer0.isHidden = currentQuestion.answers[0] == "" ? true : false
        answer1.isHidden = currentQuestion.answers[1] == "" ? true : false
        answer2.isHidden = currentQuestion.answers[2] == "" ? true : false
        answer3.isHidden = currentQuestion.answers[3] == "" ? true : false
        
        
        
        answer0.backgroundColor = .clear
        answer1.backgroundColor = .clear
        answer2.backgroundColor = .clear
        answer3.backgroundColor = .clear
    
        
        fiftyFifty.setTitle(lifeLines.fifty.name.rawValue, for: .normal)
        fiftyFifty.backgroundColor = lifeLines.fifty.available == .available ? .clear : .gray
        fiftyFifty.isUserInteractionEnabled = lifeLines.fifty.available == .available ? true : false
        
        
        askTheAudience.setTitle(lifeLines.audience.name.rawValue, for: .normal)
        askTheAudience.backgroundColor = lifeLines.audience.available == .available ? .clear : .gray
        askTheAudience.isUserInteractionEnabled = lifeLines.audience.available == .available ? true : false
        
        
        rightToMakeMistakes.setTitle(lifeLines.makeMistake.name.rawValue, for: .normal)
        rightToMakeMistakes.backgroundColor = lifeLines.makeMistake.available == .available ? .clear : .gray
        rightToMakeMistakes.isUserInteractionEnabled = lifeLines.makeMistake.available == .available ? true : false
        
        takeMoneyNow.setTitle(lifeLines.moneyNow.name.rawValue, for: .normal)
        
    }
     
}
