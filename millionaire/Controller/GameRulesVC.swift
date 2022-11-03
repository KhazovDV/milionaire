import UIKit

class GameRulesVC: UIViewController {

    var scrollView = UIScrollView()
    var label = UILabel()
    var button = UIButton()
    
    let backgroundColor = UIColor(red: 0.0/255.0, green: 173/255, blue: 181/255, alpha: 1.0)
    let textColor = UIColor(red: 238, green: 238, blue: 238, alpha: 1)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(label)
        scrollView.addSubview(button)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.backgroundColor = backgroundColor
        self.view.backgroundColor = backgroundColor
        label.textColor = textColor
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            
            label.topAnchor.constraint(equalTo: scrollView.topAnchor),
            label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            label.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
        ])
        
        label.numberOfLines = 0
        label.textAlignment = .center
        
        
        let boldText = "\nПравила:\n\n"
        let boldText2 = "\n\nПодсказки:\n\n"
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 30)]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        let attributedString2 = NSMutableAttributedString(string:boldText2, attributes:attrs)

        let normalText = "Для того, чтобы заработать 1 миллион долларов, необходимо правильно ответить на 15 вопросов из различных областей знаний. Каждый вопрос имеет 4 варианта ответа, из которых только один является верным. Каждый вопрос имеет конкретную стоимость. Все суммы являются заменяемыми, то есть после ответа на следующий вопрос не суммируются с суммой за ответ на предыдущий."
        let normalString = NSMutableAttributedString(string:normalText)
        
        let normalText2 = "• «50 на 50» — компьютер убирает два неправильных ответа, предоставляя игроку выбор из оставшихся двух вариантов ответа. \n\n• «Звонок другу» — в течение 30 секунд игрок может посоветоваться либо с другом по видеосвязи, либо лично с болельщиком в студии. \n\n• «Право на ошибку» — игрок имеет право дать два варианта ответа, но только один раз за игру. Использование этой подсказки после подсказки «50 на 50» даёт 100%-е прохождение вопроса.\nЕсли игрок берёт эту подсказку на каком-то из вопросов, то после её выбора он не может на этом же вопросе взять другие подсказки, а также забрать выигранные деньги.\n"
        let normalString2 = NSMutableAttributedString(string:normalText2)

        attributedString.append(normalString)
        attributedString.append(attributedString2)
        attributedString.append(normalString2)
        label.attributedText = attributedString
        
    }
}

