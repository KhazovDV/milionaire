//
//  ViewController.swift
//  millionaire
//
//  Created by garpun on 31.10.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func gameRullesButton(_ sender: Any) {
        let gameRulesVC = GameRulesVC()
        self.present(gameRulesVC, animated: true)
    }
    
}
