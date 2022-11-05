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
    
    
    var levels = [LevelMoneyGuaranteeWin]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(levels)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
