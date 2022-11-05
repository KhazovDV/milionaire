import Foundation

class QuestionsLevel {
    
    //хранилище вопросов
    //var dataQuestionsAnswers = [QuestionsAnswer]()
    private var dataQuestionsAnswers: [QuestionsAnswer]
    var currentQuestion: QuestionsAnswer?
    
    //метод возвращает неиспользованные вопросы
    func getQuestion(){
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
            QuestionsAnswer(question: "Что сочиняют спецагентам, отправляя их на задание?", answers: ["Сказку", "Былину", "Легенду", "Притчу"], correctAnswer: "Легенду"),
            QuestionsAnswer(question: "Как водители-профессионалы называют автомобильный руль?", answers: ["Бублик", "Сушка", "Рогалик", "Баранка"], correctAnswer: "Баранка"),
            QuestionsAnswer(question: "На чем летает ведьма?", answers: ["На венике", "На швабре", "На метле", "На пылесосе «Ракета»",], correctAnswer: "На метле"),
            QuestionsAnswer(question: "С чего начинается театр?", answers: ["С буфета", "С афиши", "С фойе", "С вешалки"], correctAnswer: "С вешалки"),
            QuestionsAnswer(question: "Как называется торжественная процедура вступления в должность главы государства?", answers: ["Интервенция", "Инаугурация", "Имплантация", "Импичмент"], correctAnswer: "Инаугурация"),
            QuestionsAnswer(question: "Автором какой из перечисленных композиций является БГ?", answers: ["Миллион алых роз", "Гарсон №2", "Стена", "Ветер перемен"], correctAnswer: "Гарсон №2"),
            QuestionsAnswer(question: "Название какого музыкального инструмента совпадает с названием геометрической фигуры?", answers: ["Круг", "Треугольник", "Четырехугольник", "Квадрат"], correctAnswer: "Треугольник"),
            QuestionsAnswer(question: "Кто является лидером известной рок-группы 'АЛИСА'?", answers: ["Джагер", "Рурк", "Кинчев", "Гребенщиков"], correctAnswer: "Кинчев"),
            QuestionsAnswer(question: "Какое звание является наивысшим в научной иерархии?", answers: ["Доцент", "Профессор", "Магистр", "Академик"], correctAnswer: "Академик"),
            QuestionsAnswer(question: "Как называется революционный роман Максима Горького?", answers: ["Мать", "Чапаев", "Молодая гвардия", "Как закалялась сталь"], correctAnswer: "Мать")
        ].shuffled()
                   )
    }
}


class MediumQuestions: QuestionsLevel {
    init() {
        super.init(dataForQuestions: [
            QuestionsAnswer(question: "В какой из этих игр используется мяч наибольшей величины?", answers: ["Баскетбол", "Футбол", "Волейбол", "Водное поло"], correctAnswer: "Баскетбол", used: false),
            QuestionsAnswer(question: "В какой стране находится город Антверпен?", answers: ["Бельгия", "Голландия", "Франция", "Германия"], correctAnswer: "Бельгия", used: false),
            QuestionsAnswer(question: "Какое из этих названий не является синонимом трех остальных?", answers: ["Барс", "Ягуар", "Пантера", "Леопард",], correctAnswer: "Ягуар", used: false),
            QuestionsAnswer(question: "Кто был одним из создателей фотографии?", answers: ["Эдисон", "Братья Люмьер", "Дагер", "Ломоносов",], correctAnswer: "Дагер", used: false),
            QuestionsAnswer(question: "Как назывался первый советский пленочный фотоаппарат?", answers: ["Зенит", "Смена", "Зоркий", "ФЭД",], correctAnswer: "ФЭД", used: false),
            QuestionsAnswer(question: "Какая из этих стран имеет наибольшую площадь?", answers: ["Австралия", "Китай", "США", "Канада",], correctAnswer: "Канада", used: false),
            QuestionsAnswer(question: "Сколько сантиметров в 1 ярде?", answers: ["30,48", "81,44", "91,44", "96,84",], correctAnswer: "91,44", used: false),
            QuestionsAnswer(question: "Назовите год отмены в России крепостного права.", answers: ["1871", "1861", "1864", "1854",], correctAnswer: "1861", used: false),
            QuestionsAnswer(question: "Сколько километров, согласно газетам, пробегал бразильский футболист Рональдо?", answers: ["2000 км", "12000 км", "11000 км", "10000 км",], correctAnswer: "12000 км", used: false),
            QuestionsAnswer(question: "Температура в 86 градусов по Фаренгейту соответствует по Цельсию температуре в:", answers: ["30 градусов", "36 градусов", "40 градусов", "50 градусов",], correctAnswer: "30 градусов", used: false),
            QuestionsAnswer(question: "Кто был в главной роли в фильме 'Изо всех сил'?", answers: ["Майкл Дудиков", "Сильвестер Сталонне", "Арнольд Шварцнегер", "Джон Траволта",], correctAnswer: "Сильвестер Сталонне", used: false)
        ].shuffled()
                   )
    }
}

class HardQuestions: QuestionsLevel {
    init() {
        super.init(dataForQuestions: [
            QuestionsAnswer(question: "Какой из этих российских орденов был 'младше' остальных?", answers: ["Станислав 2-й степени", "Анна 2-й степени", "Владимир 4-й степени", "Белый Орел"], correctAnswer: "Станислав 2-й степени", used: false),
            QuestionsAnswer(question: "Какой минерал был назван в честь наследника российского престола?", answers: ["Петрит", "Александрит", "Иванит", "Дмитрит"], correctAnswer: "Александрит", used: false),
            QuestionsAnswer(question: "Какая страна - родина бейсбола?", answers: ["США", "Англия", "Австралия", "Ирландия"], correctAnswer: "Англия", used: false),
            QuestionsAnswer(question: "Назовите  столицу Ботсваны", answers: ["Манагуа", "Парамарибо", "Габороне", "Гавана"], correctAnswer: "Габороне", used: false),
            QuestionsAnswer(question: "Как следовало обращаться к статскому советнику?", answers: ["Ваше Высокоблагородие", "Ваше Превосходительство", "Ваше Высокородие", "Ваше Благородие"], correctAnswer: "Ваше Высокородие", used: false),
            QuestionsAnswer(question: "В каком языке больше всего падежей?", answers: ["Удмуртский", "Финский", "Вепсский", "Табасаранский"], correctAnswer: "Табасаранский", used: false),
            QuestionsAnswer(question: "Какая из этих лесных ягод считается несъедобной?", answers: ["Морошка", "Гонобобель", "Воронец", "Земляника"], correctAnswer: "Воронец", used: false),
            QuestionsAnswer(question: "Какая из этих звезд входит в так называемый большой летний треугольник?", answers: ["Канопус", "Антарес", "Альтаир", "Спика"], correctAnswer: "Альтаир", used: false),
            QuestionsAnswer(question: "Какой знаменитый мореплаватель основал город Петропавловск-Камчатский?", answers: ["Беринг", "Баренц", "Крузенштерн", "Беллинсгаузен"], correctAnswer: "Беринг", used: false),
            QuestionsAnswer(question: "Кто такой 'молотоглав'?", answers: ["Рыба", "Птица", "Змея", "Насекомое"], correctAnswer: "Птица", used: false),
            QuestionsAnswer(question: "Какой из учебных предметов не входит в КВАДРИВИУМ - следовавший за тривиумом повышенный цикл обучения в средние века?", answers: ["Арифметика", "Диалектика", "Геометрия", "Музыка",], correctAnswer: "war3", used: false)
        ].shuffled()
                   )
    }
}
