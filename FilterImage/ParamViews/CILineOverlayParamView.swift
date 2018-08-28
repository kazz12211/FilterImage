//
//  CILineOverlayParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/28.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CILineOverlayParamView: FilterParamView {

    var inputNRNoiseLevelSlider: UISlider!
    var inputNRNoiseLevelValueLabel: UILabel!
    var inputNRSharpnessSlider: UISlider!
    var inputNRSharpnessValueLabel: UILabel!
    var inputEdgeIntensitySlider: UISlider!
    var inputEdgeIntensityValueLabel: UILabel!
    var inputThresholdSlider: UISlider!
    var inputThresholdValueLabel: UILabel!
    var inputContrastSlider: UISlider!
    var inputContrastValueLabel: UILabel!

    var noiseLevel: Float = 0.07
    var sharpness: Float = 0.71
    var intensity: Float = 1.00
    var threshold: Float = 0.00
    var contrast: Float = 50.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        self.backgroundColor = .clear
        
        var rect = CGRect(x:4, y: 4, width: 100, height: 20);
        let inputNRNoiseLevelLabel = UILabel(frame: rect)
        inputNRNoiseLevelLabel.textColor = .white
        inputNRNoiseLevelLabel.text = "Noise Level"
        self.addSubview(inputNRNoiseLevelLabel)
        
        rect = CGRect(x: inputNRNoiseLevelLabel.frame.origin.x + inputNRNoiseLevelLabel.frame.width, y: inputNRNoiseLevelLabel.frame.origin.y, width: self.frame.width - (inputNRNoiseLevelLabel.frame.origin.x + inputNRNoiseLevelLabel.frame.width + 60), height: 29)
        inputNRNoiseLevelSlider = UISlider(frame: rect)
        inputNRNoiseLevelSlider.minimumValue = 0
        inputNRNoiseLevelSlider.maximumValue = 0.1
        if let param = filter.inputParam(name: "inputNRNoiseLevel") {
            let value = param.value as! NSNumber
            noiseLevel = Float(truncating: value)
        }
        inputNRNoiseLevelSlider.value = noiseLevel
        self.addSubview(inputNRNoiseLevelSlider)
        
        rect = CGRect(x: inputNRNoiseLevelSlider.frame.origin.x + inputNRNoiseLevelSlider.frame.width, y: inputNRNoiseLevelLabel.frame.origin.y, width: 60, height: 29)
        inputNRNoiseLevelValueLabel = UILabel(frame: rect)
        inputNRNoiseLevelValueLabel.textColor = .white
        inputNRNoiseLevelValueLabel.textAlignment = .center
        inputNRNoiseLevelValueLabel.text = "".appendingFormat("%.2f", noiseLevel)
        self.addSubview(inputNRNoiseLevelValueLabel)
        
        rect = CGRect(x:4, y: inputNRNoiseLevelLabel.frame.origin.y + inputNRNoiseLevelLabel.frame.height + 16, width: 100, height: 20);
        let inputNRSharpnessLabel = UILabel(frame: rect)
        inputNRSharpnessLabel.textColor = .white
        inputNRSharpnessLabel.text = "Sharpness"
        self.addSubview(inputNRSharpnessLabel)
        
        rect = CGRect(x: inputNRSharpnessLabel.frame.origin.x + inputNRSharpnessLabel.frame.width, y: inputNRSharpnessLabel.frame.origin.y, width: self.frame.width - (inputNRSharpnessLabel.frame.origin.x + inputNRSharpnessLabel.frame.width + 60), height: 29)
        inputNRSharpnessSlider = UISlider(frame: rect)
        inputNRSharpnessSlider.minimumValue = 0
        inputNRSharpnessSlider.maximumValue = 2
        if let param = filter.inputParam(name: "inputNRSharpness") {
            let value = param.value as! NSNumber
            sharpness = Float(truncating: value)
        }
        inputNRSharpnessSlider.value = sharpness
        self.addSubview(inputNRSharpnessSlider)
        
        rect = CGRect(x: inputNRSharpnessSlider.frame.origin.x + inputNRSharpnessSlider.frame.width, y: inputNRSharpnessLabel.frame.origin.y, width: 60, height: 29)
        inputNRSharpnessValueLabel = UILabel(frame: rect)
        inputNRSharpnessValueLabel.textColor = .white
        inputNRSharpnessValueLabel.textAlignment = .center
        inputNRSharpnessValueLabel.text = "".appendingFormat("%.2f", sharpness)
        self.addSubview(inputNRSharpnessValueLabel)
        
        rect = CGRect(x:4, y: inputNRSharpnessLabel.frame.origin.y + inputNRSharpnessLabel.frame.height + 16, width: 100, height: 20);
        let inputEdgeIntensityLabel = UILabel(frame: rect)
        inputEdgeIntensityLabel.textColor = .white
        inputEdgeIntensityLabel.text = "Edge"
        self.addSubview(inputEdgeIntensityLabel)
        
        rect = CGRect(x: inputEdgeIntensityLabel.frame.origin.x + inputEdgeIntensityLabel.frame.width, y: inputEdgeIntensityLabel.frame.origin.y, width: self.frame.width - (inputEdgeIntensityLabel.frame.origin.x + inputEdgeIntensityLabel.frame.width + 60), height: 29)
        inputEdgeIntensitySlider = UISlider(frame: rect)
        inputEdgeIntensitySlider.minimumValue = 0
        inputEdgeIntensitySlider.maximumValue = 200
        if let param = filter.inputParam(name: "inputEdgeIntensity") {
            let value = param.value as! NSNumber
            intensity = Float(truncating: value)
        }
        inputEdgeIntensitySlider.value = intensity
        self.addSubview(inputEdgeIntensitySlider)
        
        rect = CGRect(x: inputEdgeIntensitySlider.frame.origin.x + inputEdgeIntensitySlider.frame.width, y: inputEdgeIntensityLabel.frame.origin.y, width: 60, height: 29)
        inputEdgeIntensityValueLabel = UILabel(frame: rect)
        inputEdgeIntensityValueLabel.textColor = .white
        inputEdgeIntensityValueLabel.textAlignment = .center
        inputEdgeIntensityValueLabel.text = "".appendingFormat("%.1f", intensity)
        self.addSubview(inputEdgeIntensityValueLabel)
        
        rect = CGRect(x:4, y: inputEdgeIntensityLabel.frame.origin.y + inputEdgeIntensityLabel.frame.height + 16, width: 100, height: 20);
        let inputThresholdLabel = UILabel(frame: rect)
        inputThresholdLabel.textColor = .white
        inputThresholdLabel.text = "Threshold"
        self.addSubview(inputThresholdLabel)
        
        rect = CGRect(x: inputThresholdLabel.frame.origin.x + inputThresholdLabel.frame.width, y: inputThresholdLabel.frame.origin.y, width: self.frame.width - (inputThresholdLabel.frame.origin.x + inputThresholdLabel.frame.width + 60), height: 29)
        inputThresholdSlider = UISlider(frame: rect)
        inputThresholdSlider.minimumValue = 0
        inputThresholdSlider.maximumValue = 1
        if let param = filter.inputParam(name: "inputThreshold") {
            let value = param.value as! NSNumber
            threshold = Float(truncating: value)
        }
        inputThresholdSlider.value = threshold
        self.addSubview(inputThresholdSlider)
        
        rect = CGRect(x: inputThresholdSlider.frame.origin.x + inputThresholdSlider.frame.width, y: inputThresholdSlider.frame.origin.y, width: 60, height: 29)
        inputThresholdValueLabel = UILabel(frame: rect)
        inputThresholdValueLabel.textColor = .white
        inputThresholdValueLabel.textAlignment = .center
        inputThresholdValueLabel.text = "".appendingFormat("%.2f", threshold)
        self.addSubview(inputThresholdValueLabel)
        
        rect = CGRect(x:4, y: inputThresholdLabel.frame.origin.y + inputThresholdLabel.frame.height + 16, width: 100, height: 20);
        let inputContrastLabel = UILabel(frame: rect)
        inputContrastLabel.textColor = .white
        inputContrastLabel.text = "Contrast"
        self.addSubview(inputContrastLabel)
        
        rect = CGRect(x: inputContrastLabel.frame.origin.x + inputContrastLabel.frame.width, y: inputContrastLabel.frame.origin.y, width: self.frame.width - (inputContrastLabel.frame.origin.x + inputContrastLabel.frame.width + 60), height: 29)
        inputContrastSlider = UISlider(frame: rect)
        inputContrastSlider.minimumValue = 0.25
        inputContrastSlider.maximumValue = 200
        if let param = filter.inputParam(name: "inputContrast") {
            let value = param.value as! NSNumber
            contrast = Float(truncating: value)
        }
        inputContrastSlider.value = contrast
        self.addSubview(inputContrastSlider)
        
        rect = CGRect(x: inputContrastSlider.frame.origin.x + inputContrastSlider.frame.width, y: inputContrastSlider.frame.origin.y, width: 60, height: 29)
        inputContrastValueLabel = UILabel(frame: rect)
        inputContrastValueLabel.textColor = .white
        inputContrastValueLabel.textAlignment = .center
        inputContrastValueLabel.text = "".appendingFormat("%.2f", contrast)
        self.addSubview(inputContrastValueLabel)
        

        inputNRNoiseLevelSlider.addTarget(self, action: #selector(noiseLevelChanged(_:)), for: .valueChanged)
        inputNRSharpnessSlider.addTarget(self, action: #selector(sharpnessChanged(_:)), for: .valueChanged)
        inputEdgeIntensitySlider.addTarget(self, action: #selector(intensityChanged(_:)), for: .valueChanged)
        inputThresholdSlider.addTarget(self, action: #selector(thresholdChanged(_:)), for: .valueChanged)
        inputContrastSlider.addTarget(self, action: #selector(contrastChanged(_:)), for: .valueChanged)
    }
    
    @objc func noiseLevelChanged(_ sender: Any) {
        noiseLevel = inputNRNoiseLevelSlider.value
        inputNRNoiseLevelValueLabel.text = "".appendingFormat("%.2f", noiseLevel)
    }
    @objc func sharpnessChanged(_ sender: Any) {
        sharpness = inputNRSharpnessSlider.value
        inputNRSharpnessValueLabel.text = "".appendingFormat("%.2f", sharpness)
    }
    @objc func intensityChanged(_ sender: Any) {
        intensity = inputEdgeIntensitySlider.value
        inputEdgeIntensityValueLabel.text = "".appendingFormat("%.1f", intensity)
    }
    @objc func thresholdChanged(_ sender: Any) {
        threshold = inputThresholdSlider.value
        inputThresholdValueLabel.text = "".appendingFormat("%.2f", threshold)
    }
    @objc func contrastChanged(_ sender: Any) {
        contrast = inputContrastSlider.value
        inputContrastValueLabel.text = "".appendingFormat("%.2f", contrast)
    }

    override func applyChanges() {
        let noiseLevelParam = FilterParam(name: "inputNRNoiseLevel", type: .number, value: noiseLevel)
        filter.addInputParam(noiseLevelParam)
        let sharpnessParam = FilterParam(name: "inputNRSharpness", type: .number, value: sharpness)
        filter.addInputParam(sharpnessParam)
        let intensityParam = FilterParam(name: "inputEdgeIntensity", type: .number, value: intensity)
        filter.addInputParam(intensityParam)
        let thresholdParam = FilterParam(name: "inputThreshold", type: .number, value: threshold)
        filter.addInputParam(thresholdParam)
        let contrastParam = FilterParam(name: "inputContrast", type: .number, value: contrast)
        filter.addInputParam(contrastParam)
    }
    

}
