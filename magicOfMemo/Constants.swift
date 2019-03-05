//
//  Constants.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/22/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import Foundation
import UIKit

let CELL_HEIGHT = CGFloat(90)

let BG_COLORS : [UIColor] = [UIColor(red:1.00, green:0.99, blue:0.87, alpha:1.0),
                            UIColor(red:1.00, green:0.96, blue:0.87, alpha:1.0),
                            UIColor(red:1.00, green:0.93, blue:0.80, alpha:1.0),
                            UIColor(red:1.00, green:0.88, blue:0.84, alpha:1.0),
                            UIColor(red:1.00, green:0.80, blue:0.84, alpha:1.0),
                            UIColor(red:1.00, green:0.89, blue:0.93, alpha:1.0),
                            UIColor(red:0.96, green:0.85, blue:0.96, alpha:1.0),
                            UIColor(red:0.90, green:0.85, blue:0.96, alpha:1.0)]
let TINT_COLORS : [UIColor] = [UIColor(red:1.00, green:0.96, blue:0.38, alpha:1.0),
                                  UIColor(red:1.00, green:0.80, blue:0.35, alpha:1.0),
                                  UIColor(red:1.00, green:0.65, blue:0.00, alpha:1.0),
                                  UIColor(red:1.00, green:0.39, blue:0.17, alpha:1.0),
                                  UIColor(red:1.00, green:0.00, blue:0.12, alpha:1.0),
                                  UIColor(red:1.00, green:0.45, blue:0.65, alpha:1.0),
                                  UIColor(red:0.79, green:0.28, blue:0.80, alpha:1.0),
                                  UIColor(red:0.47, green:0.20, blue:0.72, alpha:1.0)]

let ADMOB_APP_ID = "ca-app-pub-5469649181550273~7797734165"
let ADMOB_TEST_AD_UNIT_ID = ""
let AD_VIEW_HEIGHT = CGFloat(50)

enum Stage {
    case deploy
    case development
}
let stage = Stage.development
