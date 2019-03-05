//
//  UITableView+.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 3/5/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit

extension UITableView {
    open override func awakeFromNib() {
        super.awakeFromNib()
        contentInsetAdjustmentBehavior = .never
    }
}
