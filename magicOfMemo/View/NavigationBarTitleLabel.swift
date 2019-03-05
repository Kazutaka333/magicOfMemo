//
//  NavigationBarTitleLabel.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/26/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit

class NavigationBarTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        adjustsFontSizeToFitWidth = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
