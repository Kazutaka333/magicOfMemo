//
//  TimeCategoryCell.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/18/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit

class TimeCategoryCell: ProgressBarCell {

    var timeCategory : TimeCategory! {
        didSet {
            titleLabel.text = timeCategory.title
            var doneCount = 0
            if let qs = timeCategory.questions.array as? [Question] {
                for q in qs {
                    if q.isDone {doneCount += 1}
                }
            }
            progressLabel.text = "\(doneCount)/\(timeCategory.questions.count)"
            progressBar.setProgress(Float(doneCount)/Float(timeCategory.questions.count), animated: true)
        }
    }
}
