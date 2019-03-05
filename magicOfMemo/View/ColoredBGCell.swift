//
//  ColoredBGCell.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/26/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit

class ColoredBGCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    var indexPath : IndexPath? {
        didSet {
            indexPathDidSet()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgView.layer.cornerRadius = bgView.frame.height/4
        bgView.clipsToBounds = true
    }
    
    func indexPathDidSet() {
        guard let row = indexPath?.row else { return }
        let index = row % BG_COLORS.count
        bgView.backgroundColor = BG_COLORS[index]
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        let currentColor = bgView.backgroundColor
        var hue : CGFloat = 0
        var saturation : CGFloat = 0
        var brightness : CGFloat = 0
        var alpha : CGFloat = 0
        if highlighted {
            guard currentColor?.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) ?? false else { return }
            let darkerColor = UIColor(hue: hue, saturation: saturation, brightness: brightness*0.8, alpha: alpha)
            bgView.backgroundColor = darkerColor
        } else {
            guard let row = indexPath?.row else {return}
            bgView.backgroundColor = BG_COLORS[row % 8]
        }
    }
}
