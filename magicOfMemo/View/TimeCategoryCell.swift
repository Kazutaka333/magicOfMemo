//
//  TimeCategoryCell.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/18/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit

class TimeCategoryCell: ProgressBarCell {

    var questions : [Question]! {
        didSet {
            var doneCount = 0
            for q in questions {
                if q.isDone {doneCount += 1}
            }
            progressLabel.text = "\(doneCount)/\(questions.count)"
        }
    }
    

}
