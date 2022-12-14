import Foundation

class GameTimer {
    
    static var startTimer = GameTimer()
    
    var timer = Timer()
    
    var totalTime = 30
    
    
    func start(){
    timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(update), userInfo:nil, repeats: true)
    }
    
    func stop() {
        totalTime = 30
        timer.invalidate()
    }
    
    @objc func update() -> Void {
        if totalTime > -1 {
            totalTime -= 1
        }
    }
}
