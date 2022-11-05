//
//  GameScoreVC.swift
//  millionaire
//
//  Created by vaslobas on 05.11.2022.
//

import UIKit

class GameScoreVC: UIViewController {
    
    @IBOutlet weak var level1: UILabel!
    @IBOutlet weak var level2: UILabel!
    @IBOutlet weak var level3: UILabel!
    @IBOutlet weak var level4: UILabel!
    @IBOutlet weak var level5: UILabel!
    @IBOutlet weak var level6: UILabel!
    @IBOutlet weak var level7: UILabel!
    @IBOutlet weak var level8: UILabel!
    @IBOutlet weak var level9: UILabel!
    @IBOutlet weak var level10: UILabel!
    @IBOutlet weak var level11: UILabel!
    @IBOutlet weak var level12: UILabel!
    @IBOutlet weak var level13: UILabel!
    @IBOutlet weak var level14: UILabel!
    @IBOutlet weak var level15: UILabel!
    
    @IBOutlet weak var nextQuestion: UIButton!
    
    var levels = [LevelMoneyGuaranteeWin]()
    
    var allLabels = [UILabel]()
    
    let brain = Brain.brainStart
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        levels = brain.levels
        
        allLabels.append(contentsOf:[level1, level2, level3, level4, level5, level6, level7, level8, level9, level10, level11, level12, level13, level14, level15])
        
        for (i, label) in allLabels.enumerated() {
            label.text = levels[i].money
            label.backgroundColor = levels[i].currentQuestion ? UIColor.green : .clear
            label.textColor = levels[i].guaranteedLevel ? UIColor.blue : UIColor.black
            label.text = (levels[i].win ? "⭐ " : "") + label.text!
        }
                
        nextQuestion.isHidden = brain.currentGame == .loose ? true : false
        
    }
    
}
