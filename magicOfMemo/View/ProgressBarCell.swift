//
//  ProgressBarCell.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/22/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit

class ProgressBarCell: ColoredBGCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgView.layer.cornerRadius = bgView.frame.height/6
    }
    
    override func indexPathDidSet() {
        super.indexPathDidSet()
        guard let row = indexPath?.row else {return}
        progressBar.progressTintColor = TINT_COLORS[row%TINT_COLORS.count]
    }
    
}
