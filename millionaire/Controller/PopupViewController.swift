import UIKit

class PopupViewController: UIViewController {
   // @IBOutlet weak var popupView: UIView!

    @IBOutlet weak var popupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        popupView.layer.cornerRadius = 16
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)

        moveIn()
    }

    @IBAction func closePressed(_ sender: UIButton) {
        moveOut()
    }


    func moveIn() {
        self.view.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
        self.view.alpha = 0.0

        UIView.animate(withDuration: 0.24) {
            self.view.transform = CGAffineTransform.identity
            self.view.alpha = 1.0
        }
    }

    func moveOut() {
        UIView.animate(withDuration: 0.24, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
            self.view.alpha = 0.0
        }) { _ in
            self.view.removeFromSuperview()
        }
    }

}
