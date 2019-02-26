//
//  QuestionTableViewCell.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/11/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit
import BEMCheckBox

class QuestionCell: ColoredBGCell {
    
    @IBOutlet weak var checkBox: BEMCheckBox!
    @IBOutlet weak var questionLabel: UILabel!

    var question: Question! {
        didSet{
            questionLabel.text = question.text
            checkBox.on = question.isDone
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkBox.animationDuration = 0.2
    }
    
    override func indexPathDidSet() {
        super.indexPathDidSet()
        guard let row = indexPath?.row else {return}
        checkBox.onFillColor = TINT_COLORS[row%TINT_COLORS.count]
    }
    
}

extension QuestionCell : BEMCheckBoxDelegate {    
    func animationDidStop(for checkBox: BEMCheckBox) {
        question.isDone = checkBox.on
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let moc = delegate.persistentContainer.viewContext
        do {
            try moc.save()
        } catch {
            question.isDone = !(question.isDone)
            checkBox.on = !(checkBox.on)
            fatalError("Failure to save context: \(error)")
        }
    }
}
