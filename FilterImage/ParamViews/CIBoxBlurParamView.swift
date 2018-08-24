//
//  CIBoxBlurParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/24.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CIBoxBlurParamView: FilterParamView {

    var inputRadiusLabel: UILabel!
    var inputRadiusSlider: UISlider!
    var inputRadiusValueLabel: UILabel!
    var radius: Float = 6.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        var rect = CGRect(x: 4, y: 4, width: 100, height: 29)
        inputRadiusLabel = UILabel(frame: rect)
        inputRadiusLabel?.textColor = .white
        inputRadiusLabel?.text = "Radius"
        self.addSubview(inputRadiusLabel)
        
        rect = CGRect(
            x: inputRadiusLabel.frame.origin.x + inputRadiusLabel.frame.width,
            y: inputRadiusLabel.frame.origin.y,
            width: self.frame.width - (inputRadiusLabel.frame.origin.x + inputRadiusLabel.frame.width + 44),
            height: 29
        )
        inputRadiusSlider = UISlider(frame: rect)
        inputRadiusSlider.minimumValue = 1
        inputRadiusSlider.maximumValue = 100
        if let param = filter.inputParam(name: "inputRadius") {
            let value = param.value as! NSNumber
            radius = Float(truncating: value)
        }
        inputRadiusSlider.value = radius
        addSubview(inputRadiusSlider)
        
        rect = CGRect(
            x: inputRadiusSlider.frame.origin.x + inputRadiusSlider.frame.width,
            y: inputRadiusLabel.frame.origin.y,
            width: 44,
            height: 29
        )
        inputRadiusValueLabel = UILabel(frame: rect)
        inputRadiusValueLabel.textColor = .white
        inputRadiusValueLabel.textAlignment = .center
        inputRadiusValueLabel.text = "".appendingFormat("%.1f", radius)
        addSubview(inputRadiusValueLabel)
        
        inputRadiusSlider.addTarget(self, action: #selector(radiusChanged(_:)), for: .valueChanged)
        
    }
    
    @objc func radiusChanged(_ sender: Any) {
        radius = inputRadiusSlider.value
        inputRadiusValueLabel.text = "".appendingFormat("%.1f", radius)
    }
    
    override func applyChanges() {
        let radiusParam = FilterParam(name: "inputRadius", type: .number, value: radius)
        filter.addInputParam(radiusParam)
    }

}
