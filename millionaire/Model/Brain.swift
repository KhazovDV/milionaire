import Foundation

class Brain {
    
    static var brainStart = Brain()
    
    static func resetGame() {
        brainStart = Brain()
    }
    
    //на каких уровнях какие по сложности вопросы
    private let easyLevel = 5
    private let mediumLevel = 10
    private let finalLevel = 15
    
    var currentLevel = 0
    
    //паки вопросы/ответы для разных уровней сложности
    private let easyQuestionsData = EasyQuestions()
    private let mediumQuestionsData = MediumQuestions()
    private let hardQuestuinsData = HardQuestions()
    
    
    //какой пак сложности сейчас используется
    private var currentQuestionPack: QuestionsLevel {
        if currentLevel <= easyLevel {
            return easyQuestionsData
        }
        else if currentLevel <= mediumLevel {
            return mediumQuestionsData
        }
        else {
            return hardQuestuinsData
        }
    }
    
    enum GameState: String {
        case win = "You are winner! Congratulations"
        case loose = "You have loose :("
        case playing = "Playing right now"
    }
    
    var currentGame: GameState = .playing
    
    var levels = [
        //LevelMoneyGuaranteeWin(level: 0, money: "Start of game"),
        LevelMoneyGuaranteeWin(level: 1, money: "100₽"),
        LevelMoneyGuaranteeWin(level: 2, money: "200₽"),
        LevelMoneyGuaranteeWin(level: 3, money: "300₽"),
        LevelMoneyGuaranteeWin(level: 4, money: "500₽"),
        LevelMoneyGuaranteeWin(level: 5, money: "1000₽", guaranteedLevel: true),
        LevelMoneyGuaranteeWin(level: 6, money: "2000₽"),
        LevelMoneyGuaranteeWin(level: 7, money: "4000₽"),
        LevelMoneyGuaranteeWin(level: 8, money: "8000₽"),
        LevelMoneyGuaranteeWin(level: 9, money: "16,000₽"),
        LevelMoneyGuaranteeWin(level: 10, money: "32,000₽", guaranteedLevel: true),
        LevelMoneyGuaranteeWin(level: 11, money: "64,000₽"),
        LevelMoneyGuaranteeWin(level: 12, money: "125,000₽"),
        LevelMoneyGuaranteeWin(level: 13, money: "250,000₽"),
        LevelMoneyGuaranteeWin(level: 14, money: "500,000₽"),
        LevelMoneyGuaranteeWin(level: 15, money: "1,000,000₽", win: true)

    ]
    
    var lifeLines = (fifty:LifeLine(name: .fiftyFifty),
                  audience: LifeLine(name: .askTheAudience),
               makeMistake:LifeLine(name: .rightToMakeMistakes),
                     moneyNow: LifeLine(name: .takeMoneyNow)
        )
    
    
    //это конечно полный фейл и нужно было делать через структуру и энум
    func fiftyFifty() {
        //var allAnswers = currentQuestionPack.currentQuestion!.answers
        let correctAnswer = currentQuestionPack.currentQuestion!.correctAnswer
        let oneIncorectAnswer =  currentQuestionPack.currentQuestion!.answers.filter {$0 != correctAnswer}.randomElement()!
        
        for (i, answer) in currentQuestionPack.currentQuestion!.answers.enumerated() where answer != oneIncorectAnswer && answer != correctAnswer {
            currentQuestionPack.currentQuestion!.answers[i] = ""
        }
        
        lifeLines.fifty.activeNow = true
        lifeLines.fifty.available = .notAvailable
    }
    
    func askAudience() {
        lifeLines.audience.activeNow = true
        lifeLines.audience.available = .notAvailable
    }
    
    func takeMoney() {
        currentGame = .loose
    }
    
    func makeMistake() {
        lifeLines.makeMistake.activeNow = true
        lifeLines.makeMistake.available = .notAvailable
    }
    
    
    /*
     почему тут не срабатывает строка lifeLines.audience.available = .notAvailable ?
     Если я ее сюда добавляю
     
     */
    var audienceChoice: String {
        let hardQuestionPercent = 50
        let otherQuestionPercent = 70
        let correctAnswer = currentQuestionPack.currentQuestion!.correctAnswer
        var allAnswers = currentQuestionPack.currentQuestion!.answers
        allAnswers.removeAll{$0 == correctAnswer}
        allAnswers.removeAll{$0 == ""}
        
        let currentPercent = currentQuestionPack === hardQuestuinsData ? hardQuestionPercent : otherQuestionPercent
        let result = arc4random_uniform(100) > currentPercent ? allAnswers.randomElement()! : correctAnswer
        
        return result
    }
        

    
    //возвращает следующий вопрос/ответ для текущего уровня сложности
    private func goNextQuestion() {
        currentQuestionPack.getQuestion()
    }

    //возвращает сколько денег сейчас у игрока
    func getCurrentMoney() -> String {
        levels[currentLevel].money
    }
    
    func getCurrentQuestionPack() -> QuestionsAnswer {
        if currentQuestionPack.currentQuestion != nil {
            return currentQuestionPack.currentQuestion!
        }
        else {
            goNextQuestion()
            return currentQuestionPack.currentQuestion!
        }
        
    }
    
    //переводит игрока на след уровень
    func gotoNextLevel() {
        if currentLevel != 0 {
            levels[currentLevel-1].currentQuestion = false
        }
        levels[currentLevel].currentQuestion = true
        currentLevel += 1
        goNextQuestion()
    }

    
    //проверяет ответ игрока
    func checkAnswer(forAnswer userAnswer: String) -> (isUserAnswerCorrect: Bool, answer: String) {
        let isUserRight = userAnswer == currentQuestionPack.currentQuestion!.correctAnswer
        let answer = currentQuestionPack.currentQuestion!.correctAnswer
        
        isUserRight ? correctAnswer() : wrongAnswer()
        
        lifeLines.makeMistake.activeNow = false
        return(isUserRight, answer)
    }
    
    //если игрок ответил не верно
    private func wrongAnswer() {
        let userCanMistake = lifeLines.makeMistake.activeNow
        
        currentGame = userCanMistake ? .playing : .loose
    }
    
    //игрок ответил верно
    private func correctAnswer() {
        if levels[currentLevel].win {currentGame = .win}
        gotoNextLevel()
    }
}


