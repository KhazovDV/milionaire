import Foundation

struct QuestionsAnswer {
    
    //была идея не использовать тут флаг used, а в QuestionsAnswerData сделать из этой структуры словарь, где ключ эта структура, а значение bool (использован, не использован). хз как лучше
    let question: String
    var answers: [String]
    let correctAnswer: String
    var used = false
}
