//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var smileLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: - Public properties
    
    var answer = [Answer]()
    
    // MARK: - Private properties
    private var randomAnswer: Answer?
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showResult()
        
        navigationItem.hidesBackButton = true
    }
}

// MARK: - Private methods

extension ResultViewController {
    private func showResult() {
        answer.forEach { animalAnswer in
            if answer.filter({ $0.animal == animalAnswer.animal }).count > 1 {
                smileLabel.text = "Вы - \(animalAnswer.animal.rawValue)"
                resultLabel.text = animalAnswer.animal.definition
            } else {
                randomAnswer = answer.randomElement()
                guard let randomAnswer = randomAnswer?.animal else { return }
                smileLabel.text = "Вы - \(randomAnswer.rawValue)"
                resultLabel.text = randomAnswer.definition
            }
        }
    }
}
