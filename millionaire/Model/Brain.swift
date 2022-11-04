import Foundation

class Brain {
    
    
    //на каких уровнях какие по сложности вопросы
    private let easyLevel = 5
    private let mediumLevel = 10
    private let finalLevel = 15
    
    var currentLevel = 1
    
    //паки вопросы/ответы для разных уровней сложности
    private let easyQuestionsData = EasyQuestions()
    private let mediumQuestionsData = MediumQuestions()
    private let hardQuestuinsData = HardQuestions()
    
    
    //какой пак сложности сейчас используется
    private var currentQuestionPack: QuestionsLevel {
        if currentLevel <= easyLevel {
            return EasyQuestions()
        }
        else if currentLevel <= mediumLevel {
            return MediumQuestions()
        }
        else {
            return HardQuestions()
        }
    }
    
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
    
    var lifeLines = [
        LifeLine(name: .fiftyFifty, percents: 50),
        LifeLine(name: .askTheAudience, percents: 70),
        LifeLine(name: .rightToMakeMistakes, percents: 100)
        ]
    
    
    func activateLifeLine(userChoose lifelineChoosen: LifeLine) {
        for (i, currentLifeline) in lifeLines.enumerated() {
            if currentLifeline.name == lifelineChoosen.name {
                lifeLines[i].activeNow = true
                lifeLines[i].available = .notAvailable
            }
        }
    }
    
    func fiftyFifty() -> QuestionsAnswer {
        var allAnswers = currentQuestionPack.currentQuestion!.answers
        let correctAnswer = currentQuestionPack.currentQuestion!.correctAnswer
        let oneIncorectAnswer =  allAnswers.filter {$0 != correctAnswer}.randomElement()!
        
        for (i, answer) in allAnswers.enumerated() where answer != oneIncorectAnswer && answer != correctAnswer {
            allAnswers[i] = ""
        }
        return currentQuestionPack.currentQuestion!
    }
        

    
    //возвращает следующий вопрос/ответ для текущего уровня сложности
    private func getNextQuestion() -> QuestionsAnswer {
        return currentQuestionPack.getQuestion()
    }

    //возвращает сколько денег сейчас у игрока
    func getCurrentMoney() -> String {
        levels[currentLevel].money
    }
    
    func getCurrentQuestionPack() -> QuestionsAnswer {
        currentQuestionPack.currentQuestion ?? getNextQuestion()
        
    }
    
    //переводит игрока на след уровень
    private func gotoNextLevel() {
        if currentLevel != 0 {
            levels[currentLevel-1].currentQuestion = false
        }
        levels[currentLevel].currentQuestion = true
        currentLevel += 1
    }
    
    
    //проверяет ответ игрока
    func checkAnswer(forAnswer userAnswer: String) -> (isUserAnswerCorrect: Bool, answer: String) {
        let isUserRight = userAnswer == currentQuestionPack.currentQuestion!.correctAnswer
        let answer = currentQuestionPack.currentQuestion!.correctAnswer
        
        isUserRight ? correctAnswer() : wrongAnswer()
        
        return(isUserRight, answer)
    }
    
    //если игрок ответил не верно
    private func wrongAnswer() {
        
    }
    
    //игрок ответил верно
    private func correctAnswer() {
        gotoNextLevel()
    }
}


