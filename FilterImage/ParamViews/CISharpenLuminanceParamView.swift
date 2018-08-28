//
//  CISharpenLuminanceParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/28.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CISharpenLuminanceParamView: FilterParamView {

    var inputSharpnessSlider: UISlider!
    var inputSharpnessValueLabel: UILabel!
    var sharpness: Float = 6.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        var rect = CGRect(x: 4, y: 4, width: 100, height: 29)
        let inputSharpnessLabel = UILabel(frame: rect)
        inputSharpnessLabel.textColor = .white
        inputSharpnessLabel.text = "Sharpness"
        self.addSubview(inputSharpnessLabel)
        
        rect = CGRect(
            x: inputSharpnessLabel.frame.origin.x + inputSharpnessLabel.frame.width,
            y: 4,
            width: self.frame.width - (inputSharpnessLabel.frame.origin.x + inputSharpnessLabel.frame.width + 44),
            height: 29
        )
        inputSharpnessSlider = UISlider(frame: rect)
        inputSharpnessSlider.minimumValue = 0
        inputSharpnessSlider.maximumValue = 2
        if let param = filter.inputParam(name: "inputSharpness") {
            let value = param.value as! NSNumber
            sharpness = Float(truncating: value)
        }
        inputSharpnessSlider.value = sharpness
        inputSharpnessSlider.isUserInteractionEnabled = true
        addSubview(inputSharpnessSlider)
        
        rect = CGRect(
            x: inputSharpnessSlider.frame.origin.x + inputSharpnessSlider.frame.width,
            y: 4,
            width: 44,
            height: 29
        )
        inputSharpnessValueLabel = UILabel(frame: rect)
        inputSharpnessValueLabel.textColor = .white
        inputSharpnessValueLabel.textAlignment = .center
        inputSharpnessValueLabel.text = "".appendingFormat("%.2f", sharpness)
        addSubview(inputSharpnessValueLabel)
        
        inputSharpnessSlider.addTarget(self, action: #selector(sharpnessChanged(_:)), for: .valueChanged)
        
    }
    
    @objc func sharpnessChanged(_ sender: Any) {
        sharpness = inputSharpnessSlider.value
        inputSharpnessValueLabel.text = "".appendingFormat("%.2f", sharpness)
    }
    
    override func applyChanges() {
        let sharpnessParam = FilterParam(name: "inputSharpness", type: .number, value: sharpness)
        filter.addInputParam(sharpnessParam)
    }
}
