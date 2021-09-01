//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Александр on 30.08.21.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answersArray: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        identifyAnimals()
    }
    
    func identifyAnimals() {
        
        let frequencyOfAnswer = answersArray.reduce(into: [:]) { counts, answer in
            counts[answer.animal, default: 0] += 1
        }
        
        let currentAnswer = frequencyOfAnswer.sorted { $0.1 > $1.1 }.first!.key
        
        emojiLabel.text = "Вы - \(currentAnswer.rawValue)!"
        descriptionLabel.text = currentAnswer.definition
    }
}
