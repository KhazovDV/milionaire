//
//  ViewController.swift
//  millionaire
//
//  Created by garpun on 31.10.2022.
//

import UIKit

class StartVC: UIViewController {
    

    
    let brainReset: () = Brain.resetGame()
    let brain = Brain.brainStart
    let gameSound = GameSound()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        gameSound.playIntro()
        
    }

    @IBAction func gameRullesButton(_ sender: Any) {
        let gameRulesVC = GameRulesVC()
        self.present(gameRulesVC, animated: true)
    }
}
