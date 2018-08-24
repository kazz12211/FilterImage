//
//  CINoiseReductionParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/24.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CINoiseReductionParamView: FilterParamView {

    var inputNoiseLevelLabel: UILabel!
    var inputNoiseLevelSlider: UISlider!
    var inputNoiseLevelValueLabel: UILabel!
    var inputSharpnessLabel: UILabel!
    var inputSharpnessSlider: UISlider!
    var inputSharpnessValueLabel: UILabel!
    
    var noiseLevel: Float!
    var sharpness: Float!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setupSubviews() {
        var rect = CGRect(
            x: 4,
            y: 4,
            width: 100,
            height: 29
        )
        inputNoiseLevelLabel = UILabel(frame: rect)
        inputNoiseLevelLabel?.textColor = .white
        inputNoiseLevelLabel?.text = "Noise Level"
        self.addSubview(inputNoiseLevelLabel)
        
        rect = CGRect(
            x: inputNoiseLevelLabel.frame.origin.x + inputNoiseLevelLabel.frame.width,
            y: inputNoiseLevelLabel.frame.origin.y,
            width: self.frame.width - (inputNoiseLevelLabel.frame.origin.x + inputNoiseLevelLabel.frame.width + 44),
            height: 29
        )
        inputNoiseLevelSlider = UISlider(frame: rect)
        inputNoiseLevelSlider.minimumValue = 0.0
        inputNoiseLevelSlider.maximumValue = 0.1
        if let param = filter.inputParam(name: "inputNoiseLevel") {
            let value = param.value as! NSNumber
            noiseLevel = Float(truncating: value)
        }
        inputNoiseLevelSlider.value = noiseLevel
        addSubview(inputNoiseLevelSlider)
        
        rect = CGRect(
            x: inputNoiseLevelSlider.frame.origin.x + inputNoiseLevelSlider.frame.width,
            y: inputNoiseLevelLabel.frame.origin.y,
            width: 44,
            height: 29
        )
        inputNoiseLevelValueLabel = UILabel(frame: rect)
        inputNoiseLevelValueLabel.textColor = .white
        inputNoiseLevelValueLabel.textAlignment = .center
        inputNoiseLevelValueLabel.text = "".appendingFormat("%.2f", noiseLevel)
        addSubview(inputNoiseLevelValueLabel)
        
        inputNoiseLevelSlider.addTarget(self, action: #selector(noiseLevelChanged(_:)), for: .valueChanged)

        rect = CGRect(
            x: 4,
            y: inputNoiseLevelLabel.frame.origin.y + inputNoiseLevelLabel.frame.height + 16,
            width: 100,
            height: 29
        )
        inputSharpnessLabel = UILabel(frame: rect)
        inputSharpnessLabel.textColor = .white
        inputSharpnessLabel.text = "Sharpness"
        addSubview(inputSharpnessLabel)
        
        rect = CGRect(
            x: inputSharpnessLabel.frame.origin.x + inputSharpnessLabel.frame.width,
            y: inputSharpnessLabel.frame.origin.y,
            width: self.frame.width - (inputSharpnessLabel.frame.origin.x + inputSharpnessLabel.frame.width + 44),
            height: 29
        )
        inputSharpnessSlider = UISlider(frame: rect)
        inputSharpnessSlider.minimumValue = 0.0
        inputSharpnessSlider.maximumValue = 2
        if let param = filter.inputParam(name: "inputSharpness") {
            let value = param.value as! NSNumber
            sharpness = Float(truncating: value)
        }
        inputSharpnessSlider.value = sharpness
        addSubview(inputSharpnessSlider)
        
        rect = CGRect(
            x: inputSharpnessSlider.frame.origin.x + inputSharpnessSlider.frame.width,
            y: inputSharpnessLabel.frame.origin.y,
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
    
    @objc func noiseLevelChanged(_ sender: Any) {
        noiseLevel = inputNoiseLevelSlider.value
        inputNoiseLevelValueLabel.text = "".appendingFormat("%.2f", noiseLevel)
    }
    
    @objc func sharpnessChanged(_ sender: Any) {
        sharpness = inputSharpnessSlider.value
        inputSharpnessValueLabel.text = "".appendingFormat("%.2f", sharpness)
    }
    
    override func applyChanges() {
        let noiseLevelParam = FilterParam(name: "inputNoiseLevel", type: .number, value: noiseLevel)
        filter.addInputParam(noiseLevelParam)
        let sharpnessParam = FilterParam(name: "inputSharpness", type: .number, value: sharpness)
        filter.addInputParam(sharpnessParam)
    }
}
