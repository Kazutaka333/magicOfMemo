//
//  TitleLabel.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 3/5/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit

class TitleLabel: UILabel {

    convenience init(frame: CGRect, text: String) {
        self.init(frame: frame)
        self.text = text
        textColor = UIColor.darkGray
        font = UIFont.systemFont(ofSize: 22)
        adjustsFontSizeToFitWidth = true
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
