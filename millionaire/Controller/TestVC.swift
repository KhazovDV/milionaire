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
    
    let brain = Brain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()

        // Do any additional setup after loading the view.
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
        
    }
     
}
