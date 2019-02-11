//
//  QuestionTableViewCell.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/11/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    var question: String! {
        didSet {
            questionLabel.text = question
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
