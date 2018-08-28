//
//  CIEdgesParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/28.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CIEdgesParamView: FilterParamView {

    var inputIntensitySlider: UISlider!
    var inputIntensityValueLabel: UILabel!
    
    var intensity: Float = 1.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        self.backgroundColor = .clear
        
        var rect = CGRect(x:4, y: 4, width: 100, height: 20);
        let inputIntensityLabel = UILabel(frame: rect)
        inputIntensityLabel.textColor = .white
        inputIntensityLabel.text = "Intensity"
        self.addSubview(inputIntensityLabel)
        
        rect = CGRect(x: inputIntensityLabel.frame.origin.x + inputIntensityLabel.frame.width, y: inputIntensityLabel.frame.origin.y, width: self.frame.width - (inputIntensityLabel.frame.origin.x + inputIntensityLabel.frame.width + 44), height: 29)
        inputIntensitySlider = UISlider(frame: rect)
        inputIntensitySlider.minimumValue = 0
        inputIntensitySlider.maximumValue = 10
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
        
        inputIntensitySlider.addTarget(self, action: #selector(intensityChanged(_:)), for: .valueChanged)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    @objc func intensityChanged(_ sender: Any) {
        intensity = inputIntensitySlider.value
        inputIntensityValueLabel.text = "".appendingFormat("%.1f", intensity)
    }
    
    override func applyChanges() {
        let intensityParam = FilterParam(name: "inputIntensity", type: .number, value: intensity)
        filter.addInputParam(intensityParam)
    }

}
