//
//  RangeSlider.swift
//  CustomE2ESlider
//
//  Created by David Ilenwabor on 19/07/2020.
//  Copyright © 2020 Davidemi. All rights reserved.
//

import UIKit
import QuartzCore

class RangeSlider: UIControl {
    var minimumValue = 0.0
    var maximumValue = 1.0
    var lowerValue = 0.2
    var upperValue = 0.8
    
    let trackLayer = CALayer()
    let lowerThumbLayer = CALayer()
    let upperThumbLayer = CALayer()

    var thumbWidth: CGFloat {
        return CGFloat(bounds.height)
    }
    
    override var frame: CGRect{
        didSet{
            updateLayerFrames()
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        trackLayer.backgroundColor = UIColor.blue.cgColor
        layer.addSublayer(trackLayer)
        
        lowerThumbLayer.backgroundColor = UIColor.green.cgColor
        layer.addSublayer(lowerThumbLayer)
        
        upperThumbLayer.backgroundColor = UIColor.green.cgColor
        layer.addSublayer(upperThumbLayer)
        
        updateLayerFrames()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func updateLayerFrames() {
        trackLayer.frame = bounds.insetBy(dx: 0.0, dy: bounds.height / 3)
        trackLayer.setNeedsDisplay()
        
        let lowerThumbCenter = CGFloat(positionForValue(value: lowerValue))
        
        lowerThumbLayer.frame = CGRect(x: lowerThumbCenter - thumbWidth / 2.0, y: 0.0,
          width: thumbWidth, height: thumbWidth)
        lowerThumbLayer.setNeedsDisplay()
        
        let upperThumbCenter = CGFloat(positionForValue(value: upperValue))
        upperThumbLayer.frame = CGRect(x: upperThumbCenter - thumbWidth / 2.0, y: 0.0,
            width: thumbWidth, height: thumbWidth)
        upperThumbLayer.setNeedsDisplay()
    }

    func positionForValue(value: Double) -> Double {
        return Double(bounds.width - thumbWidth) * (value - minimumValue) /
            (maximumValue - minimumValue) + Double(thumbWidth / 2.0)
    }

}
