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
            index = indexPath.row % 8
            bgView.backgroundColor = BG_COLORS[index]
            progressBar.progressTintColor = TINT_COLORS[index]
        }
    }
    var index : Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgView.layer.cornerRadius = bgView.frame.height/6
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        let currentColor = bgView.backgroundColor
        var hue : CGFloat = 0
        var saturation : CGFloat = 0
        var brightness : CGFloat = 0
        var alpha : CGFloat = 0
        if selected {
            if currentColor?.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) ?? false {
                let darkerColor = UIColor(hue: hue, saturation: saturation, brightness: brightness*0.6, alpha: alpha)
                bgView.backgroundColor = darkerColor
            }
        } else {
            bgView.backgroundColor = BG_COLORS[index]
        }
        
    }
    
}
