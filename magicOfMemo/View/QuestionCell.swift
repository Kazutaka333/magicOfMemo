//
//  QuestionTableViewCell.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/11/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit

class QuestionCell: UITableViewCell {

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    var question: Question! {
        didSet{
            questionLabel.text = question.text
            isDone = question.isDone
        }
    }
    var isDone: Bool! {
        didSet {
            question.isDone = isDone
            if isDone {
                checkButton.setTitle("✅", for: .normal)
//                checkButton.setImage(UIImage(named: "checked"), for: .normal)
            } else {
                checkButton.setTitle("⏹", for: .normal)
//                checkButton.setImage(UIImage(named: "unchecked"), for: .normal)
            }
        }
    }
    
    @IBAction func checkBoxPressed(_ sender: Any) {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let moc = delegate.persistentContainer.viewContext
        isDone = !isDone
        do {
            try moc.save()
        } catch {
            question.isDone = !(question.isDone)
            fatalError("Failure to save context: \(error)")
        }
    }
    
}
