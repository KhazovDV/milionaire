import Foundation

class QuestionsLevel {
    
    //хранилище вопросов
    //var dataQuestionsAnswers = [QuestionsAnswer]()
    private var dataQuestionsAnswers: [QuestionsAnswer]
    var currentQuestion: QuestionsAnswer?
    
    //метод возвращает неиспользованные вопросы
    func getQuestion() -> QuestionsAnswer{
        var unusedQuestion: QuestionsAnswer?
                
        for (i, question) in dataQuestionsAnswers.enumerated() {
            if !question.used {
                unusedQuestion = question
                dataQuestionsAnswers[i].used = true
                break
            }
        }
        
        let choosedQuestion = unusedQuestion != nil ? unusedQuestion! : QuestionsAnswer(question: "No more Questions", answers: ["No more Questions", "No more Questions", "No more Questions", "No more Questions"], correctAnswer: "No more Questions", used: false)
        currentQuestion = choosedQuestion
        
        return choosedQuestion
    }
    
    func getCurrentQuestionData() -> QuestionsAnswer {
        currentQuestion ?? QuestionsAnswer(question: "Error in \(#function)", answers: ["Error in \(#function)", "Error in \(#function)", "Error in \(#function)", "Error in \(#function)"], correctAnswer: "Error in \(#function)", used: false)
    }
    
    init(dataForQuestions: [QuestionsAnswer] = [QuestionsAnswer]() ) {
        dataQuestionsAnswers = dataForQuestions
    }
}



class EasyQuestions: QuestionsLevel {
    init() {
        super.init(dataForQuestions: [
            QuestionsAnswer(question: "My country name?", answers: ["1", "2", "3", "4"], correctAnswer: "1", used: false),
            QuestionsAnswer(question: "My age?", answers: ["10", "11", "12", "13"], correctAnswer: "10", used: false),
            QuestionsAnswer(question: "Who is ur daddy?", answers: ["war3", "q3", "dota", "wow",], correctAnswer: "war3", used: false)
        ].shuffled()
                   )
    }
}


class MediumQuestions: QuestionsLevel {
    init() {
        super.init(dataForQuestions: [
            QuestionsAnswer(question: "Medium - My country name?", answers: ["1", "2", "3", "4"], correctAnswer: "1", used: false),
            QuestionsAnswer(question: "Medium - My age?", answers: ["10", "11", "12", "13"], correctAnswer: "10", used: false),
            QuestionsAnswer(question: "Medium - Who is ur daddy?", answers: ["war3", "q3", "dota", "wow",], correctAnswer: "war3", used: false)
        ].shuffled()
                   )
    }
}

class HardQuestions: QuestionsLevel {
    init() {
        super.init(dataForQuestions: [
            QuestionsAnswer(question: "HARD - My country name?", answers: ["1", "2", "3", "4"], correctAnswer: "1", used: false),
            QuestionsAnswer(question: "HARD - My age?", answers: ["10", "11", "12", "13"], correctAnswer: "10", used: false),
            QuestionsAnswer(question: "HARD - Who is ur daddy?", answers: ["war3", "q3", "dota", "wow",], correctAnswer: "war3", used: false)
        ].shuffled()
                   )
    }
}
