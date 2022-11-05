import Foundation

struct LifeLine {
    enum used {
        case available
        case notAvailable
    }
    
    enum LifelinesName: String {
        case fiftyFifty = "50:50"
        case askTheAudience = "Audience"
        case rightToMakeMistakes = "Mistake"
        case takeMoneyNow = "$$$"
    }
    
    let name: LifelinesName
    var available = used.available
    var activeNow = false
    
    
    func getActiveLifeLines() -> Self? {
        if self.activeNow == true {
            return self
        }
        return nil
    }
}
