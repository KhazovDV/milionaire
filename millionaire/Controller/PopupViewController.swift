import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var popupView: UIView!
    
    let brain = Brain.brainStart
    var timer = Timer()
    let gameTimer = GameTimer.startTimer
    
    @IBOutlet weak var audienceChoice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        
        popupView.layer.cornerRadius = 16
        audienceChoice.text = brain.audienceChoice
                
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
       
    @objc func updateTimer() {
        print(gameTimer.totalTime)
        if gameTimer.totalTime == 1 {
            timer.invalidate()
            
            
            /*
            let vc = GameScoreVC()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
             */
             
            self.dismiss(animated: true)
        }
    }
}
