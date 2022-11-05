import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var popupView: UIView!
    
    var answer = String()
    
    @IBOutlet weak var audienceChoice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        
        popupView.layer.cornerRadius = 16
        
        audienceChoice.text = answer
        
    }
         

}
