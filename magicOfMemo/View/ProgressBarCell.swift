//
//  ProgressBarCell.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/22/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit

class ProgressBarCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var bgView: UIView!
    var indexPath: IndexPath! {
        didSet {
            let index = indexPath.row % 8
            bgView.backgroundColor = bgColors[index]
            progressBar.progressTintColor = progressBarColors[index]
        }
    }
    
    var bgColors : [UIColor] = [UIColor(red:1.00, green:0.99, blue:0.87, alpha:1.0),
                                UIColor(red:1.00, green:0.96, blue:0.87, alpha:1.0),
                                UIColor(red:1.00, green:0.93, blue:0.80, alpha:1.0),
                                UIColor(red:1.00, green:0.88, blue:0.84, alpha:1.0),
                                UIColor(red:1.00, green:0.80, blue:0.84, alpha:1.0),
                                UIColor(red:1.00, green:0.89, blue:0.93, alpha:1.0),
                                UIColor(red:0.96, green:0.85, blue:0.96, alpha:1.0),
                                UIColor(red:0.90, green:0.85, blue:0.96, alpha:1.0)]
    var progressBarColors : [UIColor] = [UIColor(red:1.00, green:0.96, blue:0.38, alpha:1.0),
                                         UIColor(red:1.00, green:0.80, blue:0.35, alpha:1.0),
                                         UIColor(red:1.00, green:0.65, blue:0.00, alpha:1.0),
                                         UIColor(red:1.00, green:0.39, blue:0.17, alpha:1.0),
                                         UIColor(red:1.00, green:0.00, blue:0.12, alpha:1.0),
                                         UIColor(red:1.00, green:0.45, blue:0.65, alpha:1.0),
                                         UIColor(red:0.79, green:0.28, blue:0.80, alpha:1.0),
                                         UIColor(red:0.47, green:0.20, blue:0.72, alpha:1.0)]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgView.layer.cornerRadius = bgView.frame.height/6
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 3)
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
