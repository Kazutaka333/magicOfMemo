//
//  UINavigationBar+Shadow.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/26/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit

extension UINavigationBar {
    open override func awakeFromNib() {
        super.awakeFromNib()
        shadowImage = UIImage()
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.3
        layer.masksToBounds = false
    }
}
