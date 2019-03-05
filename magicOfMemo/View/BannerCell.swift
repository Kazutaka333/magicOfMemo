//
//  BannerCell.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 3/5/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit
import GoogleMobileAds
class BannerCell: UITableViewCell {

    func load(adView: GADBannerView) {
        for subview in subviews {
            subview.removeFromSuperview()
        }
        addSubview(adView)
    }
}
