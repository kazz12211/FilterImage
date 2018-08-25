//
//  CIColorControlsParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/25.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CIColorControlsParamView: FilterParamView {

    var inputSaturationSlider: UISlider!
    var inputSaturationValueLabel: UILabel!
    var inputBrightnessSlider: UISlider!
    var inputBrightnessValueLabel: UILabel!
    var inputContrastSlider: UISlider!
    var inputContrastValueLabel: UILabel!
    
    var saturation: Float = 1.0     // 0 - 2
    var brightness: Float = 0.0     // -1 - 1
    var contrast: Float = 1.0       // 0.25 - 4
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setupSubviews() {
        var rect = CGRect(x: 4, y: 4, width: 100, height: 29)
        let satulationLabel = UILabel(frame: rect)
        satulationLabel.textColor = .white
        satulationLabel.text = "Saturation"
        addSubview(satulationLabel)
        
        rect = CGRect(x: 4, y: satulationLabel.frame.origin.y + satulationLabel.frame.height + 16, width: 100, height: 29)
        let brightnessLabel = UILabel(frame: rect)
        brightnessLabel.textColor = .white
        brightnessLabel.text = "Brightness"
        addSubview(brightnessLabel)
        
        rect = CGRect(x: 4, y: brightnessLabel.frame.origin.y + brightnessLabel.frame.height + 16, width: 100, height: 29)
        let contractLabel = UILabel(frame: rect)
        contractLabel.textColor = .white
        contractLabel.text = "Contrast"
        addSubview(contractLabel)
        
        rect = CGRect(x: satulationLabel.frame.origin.x + satulationLabel.frame.width, y: satulationLabel.frame.origin.y, width: 200, height: 29)
        inputSaturationSlider = UISlider(frame: rect)
        inputSaturationSlider.minimumValue = 0
        inputSaturationSlider.maximumValue = 2
        addSubview(inputSaturationSlider)

        rect = CGRect(x: brightnessLabel.frame.origin.x + brightnessLabel.frame.width, y: brightnessLabel.frame.origin.y, width: 200, height: 29)
        inputBrightnessSlider = UISlider(frame: rect)
        inputBrightnessSlider.minimumValue = -1
        inputBrightnessSlider.maximumValue = 1
        addSubview(inputBrightnessSlider)
        
        rect = CGRect(x: contractLabel.frame.origin.x + contractLabel.frame.width, y: contractLabel.frame.origin.y, width: 200, height: 29)
        inputContrastSlider = UISlider(frame: rect)
        inputContrastSlider.minimumValue = 0.25
        inputContrastSlider.maximumValue = 4
        addSubview(inputContrastSlider)
        
        rect = CGRect(x: inputSaturationSlider.frame.origin.x + inputSaturationSlider.frame.width + 4, y: inputSaturationSlider.frame.origin.y, width: 44, height: 29)
        inputSaturationValueLabel = UILabel(frame: rect)
        inputSaturationValueLabel.textColor = .white
        inputSaturationValueLabel.textAlignment = .center
        addSubview(inputSaturationValueLabel)

        rect = CGRect(x: inputBrightnessSlider.frame.origin.x + inputBrightnessSlider.frame.width + 4, y: inputBrightnessSlider.frame.origin.y, width: 44, height: 29)
        inputBrightnessValueLabel = UILabel(frame: rect)
        inputBrightnessValueLabel.textColor = .white
        inputBrightnessValueLabel.textAlignment = .center
        addSubview(inputBrightnessValueLabel)

        rect = CGRect(x: inputContrastSlider.frame.origin.x + inputContrastSlider.frame.width + 4, y: inputContrastSlider.frame.origin.y, width: 44, height: 29)
        inputContrastValueLabel = UILabel(frame: rect)
        inputContrastValueLabel.textColor = .white
        inputContrastValueLabel.textAlignment = .center
        addSubview(inputContrastValueLabel)
        
        inputSaturationSlider.addTarget(self, action: #selector(saturationChanged(_:)), for: .valueChanged)
        inputBrightnessSlider.addTarget(self, action: #selector(brightnessChanged(_:)), for: .valueChanged)
        inputContrastSlider.addTarget(self, action: #selector(contrastChanged(_:)), for: .valueChanged)
        
        if let param = filter.inputParam(name: "inputSaturation") {
            let value = param.value as! NSNumber
            saturation = Float(truncating: value)
        }
        inputSaturationValueLabel.text = "".appendingFormat("%.2f", saturation)
        inputSaturationSlider.value = saturation
        
        if let param = filter.inputParam(name: "inputBrightness") {
            let value = param.value as! NSNumber
            brightness = Float(truncating: value)
        }
        inputBrightnessValueLabel.text = "".appendingFormat("%.2f", brightness)
        inputBrightnessSlider.value = brightness
        
        if let param = filter.inputParam(name: "inputContrast") {
            let value = param.value as! NSNumber
            contrast = Float(truncating: value)
        }
        inputContrastValueLabel.text = "".appendingFormat("%.2f", contrast)
        inputContrastSlider.value = contrast
    }
    
    @objc func saturationChanged(_ sender: UISlider) {
        saturation = sender.value
        inputSaturationValueLabel.text = "".appendingFormat("%.2f", saturation)
    }
    
    @objc func brightnessChanged(_ sender: UISlider) {
        brightness = sender.value
        inputBrightnessValueLabel.text = "".appendingFormat("%.2f", brightness)
    }
    
    @objc func contrastChanged(_ sender: UISlider) {
        contrast = sender.value
        inputContrastValueLabel.text = "".appendingFormat("%.2f", contrast)
    }
    
    override func applyChanges() {
        let saturationParam = FilterParam(name: "inputSaturation", type: .number, value: saturation)
        filter.addInputParam(saturationParam)
        let brightnessParam = FilterParam(name: "inputBrightness", type: .number, value: brightness)
        filter.addInputParam(brightnessParam)
        let contrastParam = FilterParam(name: "inputContrast", type: .number, value: contrast)
        filter.addInputParam(contrastParam)
    }
}
