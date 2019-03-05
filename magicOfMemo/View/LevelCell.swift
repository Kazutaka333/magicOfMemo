//
//  LevelCell.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/22/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit

class LevelCell: ProgressBarCell {
    var level : Level! {
        didSet {
            titleLabel.text = level.title
            var doneCount = 0
            if let array = level.questions.array as? [Question] {
                for q in array{
                    if q.isDone {doneCount += 1}
                }
            }
            progressBar.setProgress(Float(doneCount)/Float(level.questions.count), animated: false)
            progressLabel.text = "\(doneCount)/\(level.questions.count)"

            progressLabel.sizeToFit()
        }
    }

}

