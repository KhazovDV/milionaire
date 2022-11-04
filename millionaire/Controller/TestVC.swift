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
    
    
    let brain = Brain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentQuestion = brain.getCurrentQuestionPack()
        question.text = currentQuestion.question
        answer0.setTitle(currentQuestion.answers[0], for: .normal)
        answer1.setTitle(currentQuestion.answers[1], for: .normal)
        answer2.setTitle(currentQuestion.answers[2], for: .normal)
        answer3.setTitle(currentQuestion.answers[3], for: .normal)

        // Do any additional setup after loading the view.
    }
    @IBAction func answer0Button(_ sender: UIButton) {
       // brain.checkAnswer(forAnswer: String)
    }
    
    @IBAction func answer1Button(_ sender: UIButton) {
    }
    
    @IBAction func answer2Button(_ sender: UIButton) {
    }
    
    @IBAction func answer3Button(_ sender: UIButton) {
    }
    
}
