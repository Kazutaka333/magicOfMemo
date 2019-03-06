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
        contentView.removeConstraints(contentView.constraints)
        for subview in contentView.subviews {
            subview.removeFromSuperview()
        }
        contentView.addSubview(adView)
        contentView.centerXAnchor.constraint(equalTo: adView.centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: adView.centerYAnchor).isActive = true
    }
}
