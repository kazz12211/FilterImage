//
//  CICircularScreenParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/30.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CICircularScreenParamView: FilterParamView {

    var inputCenterXField: UITextField!
    var inputCenterYField: UITextField!
    var inputWidthSlider: UISlider!
    var inputWidthValueLabel: UILabel!
    var inputSharpnessSlider: UISlider!
    var inputSharpnessValueLabel: UILabel!
    var inputCenter: CGPoint = CGPoint(x: 150, y: 150)
    var width: Float = 6
    var sharpness: Float = 0.7
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        var rect = CGRect(x: 4, y: 4, width: 100, height: 29)
        let inputCenterLabel = UILabel(frame: rect)
        inputCenterLabel.textColor = .white
        inputCenterLabel.text = "Center"
        self.addSubview(inputCenterLabel)
        
        rect = CGRect(
            x: inputCenterLabel.frame.origin.x + inputCenterLabel.frame.width,
            y: inputCenterLabel.frame.origin.y,
            width: 50,
            height: 29
        )
        inputCenterXField = UITextField(frame: rect)
        inputCenterXField.textAlignment = .center
        inputCenterXField.keyboardType = .decimalPad
        inputCenterXField.backgroundColor = .white
        addSubview(inputCenterXField)
        
        rect = CGRect(
            x: inputCenterXField.frame.origin.x + inputCenterXField.frame.width + 16,
            y: inputCenterXField.frame.origin.y,
            width: 50,
            height: 29
        )
        inputCenterYField = UITextField(frame: rect)
        inputCenterYField.textAlignment = .center
        inputCenterYField.keyboardType = .decimalPad
        inputCenterYField.backgroundColor = .white
        addSubview(inputCenterYField)
        
        if let param = filter.inputParam(name: "inputCenter") {
            let value = param.value as! CIVector
            inputCenter = value.cgPointValue
        }
        inputCenterXField.text = "".appendingFormat("%.0f", inputCenter.x)
        inputCenterYField.text = "".appendingFormat("%.0f", inputCenter.y)
        
        
        
        rect = CGRect(x: 4, y: inputCenterLabel.frame.origin.y + inputCenterLabel.frame.height + 16, width: 100, height: 29)
        let inputWidthLabel = UILabel(frame: rect)
        inputWidthLabel.textColor = .white
        inputWidthLabel.text = "Width"
        self.addSubview(inputWidthLabel)
        
        rect = CGRect(
            x: inputWidthLabel.frame.origin.x + inputWidthLabel.frame.width,
            y: inputWidthLabel.frame.origin.y,
            width: self.frame.width - (inputWidthLabel.frame.origin.x + inputWidthLabel.frame.width + 56),
            height: 29
        )
        inputWidthSlider = UISlider(frame: rect)
        inputWidthSlider.minimumValue = 2
        inputWidthSlider.maximumValue = 50
        if let param = filter.inputParam(name: "inputWidth") {
            let value = param.value as! NSNumber
            width = Float(truncating: value)
        }
        inputWidthSlider.value = width
        addSubview(inputWidthSlider)
        
        rect = CGRect(
            x: inputWidthSlider.frame.origin.x + inputWidthSlider.frame.width,
            y: inputWidthLabel.frame.origin.y,
            width: 56,
            height: 29
        )
        inputWidthValueLabel = UILabel(frame: rect)
        inputWidthValueLabel.textColor = .white
        inputWidthValueLabel.textAlignment = .center
        inputWidthValueLabel.text = "".appendingFormat("%.1f", width)
        addSubview(inputWidthValueLabel)
        
        inputWidthSlider.addTarget(self, action: #selector(widthChanged(_:)), for: .valueChanged)
        
        rect = CGRect(x: 4, y: inputWidthLabel.frame.origin.y + inputWidthLabel.frame.height + 16, width: 100, height: 29)
        let inputSharpnessLabel = UILabel(frame: rect)
        inputSharpnessLabel.textColor = .white
        inputSharpnessLabel.text = "Sharpness"
        self.addSubview(inputSharpnessLabel)
        
        rect = CGRect(
            x: inputSharpnessLabel.frame.origin.x + inputSharpnessLabel.frame.width,
            y: inputSharpnessLabel.frame.origin.y,
            width: self.frame.width - (inputSharpnessLabel.frame.origin.x + inputSharpnessLabel.frame.width + 56),
            height: 29
        )
        inputSharpnessSlider = UISlider(frame: rect)
        inputSharpnessSlider.minimumValue = 0
        inputSharpnessSlider.maximumValue = 1
        if let param = filter.inputParam(name: "inputSharpness") {
            let value = param.value as! NSNumber
            sharpness = Float(truncating: value)
        }
        inputSharpnessSlider.value = sharpness
        addSubview(inputSharpnessSlider)
        
        rect = CGRect(
            x: inputSharpnessSlider.frame.origin.x + inputSharpnessSlider.frame.width,
            y: inputSharpnessLabel.frame.origin.y,
            width: 56,
            height: 29
        )
        inputSharpnessValueLabel = UILabel(frame: rect)
        inputSharpnessValueLabel.textColor = .white
        inputSharpnessValueLabel.textAlignment = .center
        inputSharpnessValueLabel.text = "".appendingFormat("%.2f", sharpness)
        addSubview(inputSharpnessValueLabel)
        
        inputSharpnessSlider.addTarget(self, action: #selector(sharpnessChanged(_:)), for: .valueChanged)
        
    }
    
    @objc func widthChanged(_ sender: Any) {
        width = inputWidthSlider.value
        inputWidthValueLabel.text = "".appendingFormat("%.1f", width)
    }
    @objc func sharpnessChanged(_ sender: Any) {
        sharpness = inputSharpnessSlider.value
        inputSharpnessValueLabel.text = "".appendingFormat("%.2f", sharpness)
    }

    override func applyChanges() {
        inputCenter.x = getFieldValue(textField: inputCenterXField, defaultValue: 150)
        inputCenter.y = getFieldValue(textField: inputCenterYField, defaultValue: 150)
        let centerParam = FilterParam(name: "inputCenter", type: .number, value: CIVector(cgPoint: inputCenter))
        filter.addInputParam(centerParam)
        let widthParam = FilterParam(name: "inputWidth", type: .number, value: width)
        filter.addInputParam(widthParam)
        let sharpnessParam = FilterParam(name: "inputSharpness", type: .number, value: sharpness)
        filter.addInputParam(sharpnessParam)
   }

}
