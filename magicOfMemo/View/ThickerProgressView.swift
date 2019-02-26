//
//  ThickerProgressView.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/22/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit

class ThickerProgressView: UIProgressView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // make the edge of bar round
        let maskLayerPath = UIBezierPath(roundedRect: bounds, cornerRadius: 3.0)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskLayerPath.cgPath
        layer.mask = maskLayer
        
    }
}
