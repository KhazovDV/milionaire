//
//  TestVC.swift
//  millionaire
//
//  Created by vaslobas on 04.11.2022.
//

import UIKit

class TestVC: UIViewController {
        
    
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var money: UILabel!
    
    
    @IBOutlet weak var fiftyFifty: UIButton!
    @IBOutlet weak var askTheAudience: UIButton!
    @IBOutlet weak var rightToMakeMistakes: UIButton!
    @IBOutlet weak var takeMoneyNow: UIButton!
    
    let brain = Brain.brainStart
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func fiftyFiftyPressed(_ sender: UIButton) {
        brain.fiftyFifty()
        updateUI()
    }
    
    @IBAction func askAudience(_ sender: UIButton) {
        brain.askAudience()
        updateUI()
    }
    
    @IBAction func allButton(_ sender: UIButton) {
        let allButtons = [answer0, answer1, answer2, answer3]
        
        
        let userAnswer = brain.checkAnswer(forAnswer: sender.currentTitle!)
        print(userAnswer, brain.currentLevel)
                
        sender.backgroundColor = userAnswer.isUserAnswerCorrect ? UIColor.green : UIColor.red
        
        for button in allButtons {
            button!.backgroundColor = button!.currentTitle == userAnswer.answer ? UIColor.green : UIColor.red
        }
        
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    @objc func updateUI() {
        let currentQuestion = brain.getCurrentQuestionPack()
        let lifeLines = brain.lifeLines
                
        question.text = currentQuestion.question
        
        money.text = brain.getCurrentMoney()
        
        answer0.setTitle(currentQuestion.answers[0], for: .normal)
        answer1.setTitle(currentQuestion.answers[1], for: .normal)
        answer2.setTitle(currentQuestion.answers[2], for: .normal)
        answer3.setTitle(currentQuestion.answers[3], for: .normal)
        
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
        
        takeMoneyNow.setTitle(lifeLines.moneyNow.name.rawValue, for: .normal)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let popUpView = segue.destination as? PopupViewController {
            popUpView.answer = brain.audienceChoice
        }
        if let gameScoreView = segue.destination as? GameScoreVC {
            gameScoreView.levels = brain.levels
        }
    }
    
     
}
