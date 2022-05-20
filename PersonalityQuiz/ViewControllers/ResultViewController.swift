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
    
    var answer: [Answer]!
    
    // MARK: - Private properties
    private var randomAnswer: Answer?
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateResult()
        
        navigationItem.hidesBackButton = true
    }
}

// MARK: - Private methods

extension ResultViewController {
    private func updateResult() {
        answer.forEach { animalAnswer in
            if answer.filter({ $0.animal == animalAnswer.animal }).count > 1 {
                updateUI(animalAnswer)
            } else {
                randomAnswer = answer.randomElement()
                guard let randomAnswer = randomAnswer else { return }
                updateUI(randomAnswer)
            }
        }
    }
    
    private func updateUI(_ answer: Answer) {
        smileLabel.text = String(answer.animal.rawValue)
        resultLabel.text = answer.animal.definition
    }
}
