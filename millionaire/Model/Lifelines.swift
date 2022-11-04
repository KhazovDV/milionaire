import Foundation

struct LifeLine {
    enum used {
        case available
        case notAvailable
    }
    
    enum LifelinesName: String {
        case fiftyFifty = "50:50 (Fifty-Fifty): the game's computer eliminates two wrong answers from the current question, leaving behind the correct answer and one incorrect answer"
        case askTheAudience = "Ask the Audience: the audience takes voting pads attached to their seats and votes for the answer that they believe is correct. The computer tallies the results and displays them as percentages to the contestant"
        case rightToMakeMistakes = "The right to make a mistake gives you the opportunity to answer incorrectly and continue the game"
    }
    
    let name: LifelinesName
    var available = used.available
    let percents: Int
    var activeNow = false
    
    
    func getActiveLifeLines() -> Self? {
        if self.activeNow == true {
            return self
        }
        return nil
    }
}
