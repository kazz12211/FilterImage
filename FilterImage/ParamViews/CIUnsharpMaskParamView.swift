//
//  CIUnsharpMaskParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/28.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CIUnsharpMaskParamView: FilterParamView {

    var inputRadiusSlider: UISlider!
    var inputRadiusValueLabel: UILabel!
    var inputIntensitySlider: UISlider!
    var inputIntensityValueLabel: UILabel!
    
    var radius: Float = 1.0
    var intensity: Float = 1.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        self.backgroundColor = .clear
        
        var rect = CGRect(x:4, y: 0, width: 100, height: 20);
        let inputRadiusLabel = UILabel(frame: rect)
        inputRadiusLabel.textColor = .white
        inputRadiusLabel.text = "Radius"
        self.addSubview(inputRadiusLabel)
        
        rect = CGRect(x: inputRadiusLabel.frame.origin.x + inputRadiusLabel.frame.width, y: inputRadiusLabel.frame.origin.y, width: self.frame.width - (inputRadiusLabel.frame.origin.x + inputRadiusLabel.frame.width + 44), height: 29)
        inputRadiusSlider = UISlider(frame: rect)
        inputRadiusSlider.minimumValue = 0
        inputRadiusSlider.maximumValue = 100
        if let param = filter.inputParam(name: "inputRadius") {
            let value = param.value as! NSNumber
            radius = Float(truncating: value)
        }
        inputRadiusSlider.value = radius
        self.addSubview(inputRadiusSlider)
        
        rect = CGRect(x: inputRadiusSlider.frame.origin.x + inputRadiusSlider.frame.width, y: inputRadiusLabel.frame.origin.y, width: 44, height: 29)
        inputRadiusValueLabel = UILabel(frame: rect)
        inputRadiusValueLabel.textColor = .white
        inputRadiusValueLabel.textAlignment = .center
        inputRadiusValueLabel.text = "".appendingFormat("%.1f", radius)
        self.addSubview(inputRadiusValueLabel)
        
        
        rect = CGRect(x:4, y: inputRadiusLabel.frame.origin.y + inputRadiusLabel.frame.height + 16, width: 100, height: 20);
        let inputIntensityLabel = UILabel(frame: rect)
        inputIntensityLabel.textColor = .white
        inputIntensityLabel.text = "Intensity"
        self.addSubview(inputIntensityLabel)
        
        rect = CGRect(x: inputIntensityLabel.frame.origin.x + inputIntensityLabel.frame.width, y: inputIntensityLabel.frame.origin.y, width: self.frame.width - (inputIntensityLabel.frame.origin.x + inputIntensityLabel.frame.width + 44), height: 29)
        inputIntensitySlider = UISlider(frame: rect)
        inputIntensitySlider.minimumValue = 0
        inputIntensitySlider.maximumValue = 1
        if let param = filter.inputParam(name: "inputIntensity") {
            let value = param.value as! NSNumber
            intensity = Float(truncating: value)
        }
        inputIntensitySlider.value = intensity
        self.addSubview(inputIntensitySlider)
        
        rect = CGRect(x: inputIntensitySlider.frame.origin.x + inputIntensitySlider.frame.width, y: inputIntensityLabel.frame.origin.y, width: 44, height: 29)
        inputIntensityValueLabel = UILabel(frame: rect)
        inputIntensityValueLabel.textColor = .white
        inputIntensityValueLabel.textAlignment = .center
        inputIntensityValueLabel.text = "".appendingFormat("%.1f", intensity)
        self.addSubview(inputIntensityValueLabel)
        
        inputRadiusSlider.addTarget(self, action: #selector(radiusChanged(_:)), for: .valueChanged)
        inputIntensitySlider.addTarget(self, action: #selector(intensityChanged(_:)), for: .valueChanged)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    @objc func radiusChanged(_ sender: Any) {
        radius = inputRadiusSlider.value
        inputRadiusValueLabel.text = "".appendingFormat("%.1f", radius)
    }
    
    @objc func intensityChanged(_ sender: Any) {
        intensity = inputIntensitySlider.value
        inputIntensityValueLabel.text = "".appendingFormat("%.1f", intensity)
    }
    
    override func applyChanges() {
        let radiusParam = FilterParam(name: "inputRadius", type: .number, value: radius)
        filter.addInputParam(radiusParam)
        let intensityParam = FilterParam(name: "inputIntensity", type: .number, value: intensity)
        filter.addInputParam(intensityParam)
    }

}
