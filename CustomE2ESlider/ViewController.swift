//
//  ViewController.swift
//  CustomE2ESlider
//
//  Created by David Ilenwabor on 19/07/2020.
//  Copyright © 2020 Davidemi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let rangeSlider = RangeSlider(frame: .zero)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        rangeSlider.backgroundColor = .red
        view.addSubview(rangeSlider)
        rangeSlider.addTarget(self, action: #selector(rangeSliderValueChanged), for: .valueChanged)
    }
    
    override func viewDidLayoutSubviews() {
        let margin: CGFloat = 2.0
        let width = view.bounds.width - 2.0 * margin
        rangeSlider.frame = CGRect(x: margin, y: margin + view.safeAreaInsets.top, width: width, height: 31)
    }
    
    @objc func rangeSliderValueChanged(rangeSlider: RangeSlider){
        print("Range slider value has changed: \(rangeSlider.lowerValue) / \(rangeSlider.upperValue)")
    }


}

