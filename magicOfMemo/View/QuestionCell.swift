//
//  QuestionTableViewCell.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/11/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit
import BEMCheckBox

class QuestionCell: UITableViewCell {
    
    @IBOutlet weak var checkBox: BEMCheckBox!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var bgView: UIView!

    var indexPath : IndexPath! {
        didSet {
            let index = indexPath.row % 8
            bgView.backgroundColor = BG_COLORS[index]
            checkBox.onFillColor = TINT_COLORS[index]
        }
    }
    var question: Question! {
        didSet{
            questionLabel.text = question.text
            checkBox.on = question.isDone
        }
    }
    
    var isDone: Bool! {
        didSet {
            question.isDone = isDone
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = bgView.frame.height/4
        bgView.clipsToBounds = true
        checkBox.animationDuration = 0.2
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
