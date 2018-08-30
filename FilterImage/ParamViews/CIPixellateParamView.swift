//
//  CIPixellateParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/28.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CIPixellateParamView: FilterParamView {

    var inputCenterXField: UITextField!
    var inputCenterYField: UITextField!
    var inputScaleSlider: UISlider!
    var inputScaleValueLabel: UILabel!
    var inputCenter: CGPoint = CGPoint(x: 150, y: 150)
    var scale: Float = 8
    
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
        let inputScaleLabel = UILabel(frame: rect)
        inputScaleLabel.textColor = .white
        inputScaleLabel.text = "Scale"
        self.addSubview(inputScaleLabel)
        
        rect = CGRect(
            x: inputScaleLabel.frame.origin.x + inputScaleLabel.frame.width,
            y: inputScaleLabel.frame.origin.y,
            width: self.frame.width - (inputScaleLabel.frame.origin.x + inputScaleLabel.frame.width + 56),
            height: 29
        )
        inputScaleSlider = UISlider(frame: rect)
        inputScaleSlider.minimumValue = 1
        inputScaleSlider.maximumValue = 100
        if let param = filter.inputParam(name: "inputScale") {
            let value = param.value as! NSNumber
            scale = Float(truncating: value)
        }
        inputScaleSlider.value = scale
        addSubview(inputScaleSlider)
        
        rect = CGRect(
            x: inputScaleSlider.frame.origin.x + inputScaleSlider.frame.width,
            y: inputScaleLabel.frame.origin.y,
            width: 56,
            height: 29
        )
        inputScaleValueLabel = UILabel(frame: rect)
        inputScaleValueLabel.textColor = .white
        inputScaleValueLabel.textAlignment = .center
        inputScaleValueLabel.text = "".appendingFormat("%.1f", scale)
        addSubview(inputScaleValueLabel)
        
        inputScaleSlider.addTarget(self, action: #selector(scaleChanged(_:)), for: .valueChanged)
        
    }
    
    @objc func scaleChanged(_ sender: Any) {
        scale = inputScaleSlider.value
        inputScaleValueLabel.text = "".appendingFormat("%.1f", scale)
    }
    
    override func applyChanges() {
        inputCenter.x = getFieldValue(textField: inputCenterXField, defaultValue: 150)
        inputCenter.y = getFieldValue(textField: inputCenterYField, defaultValue: 150)
        let centerParam = FilterParam(name: "inputCenter", type: .number, value: CIVector(cgPoint: inputCenter))
        filter.addInputParam(centerParam)
        let scaleParam = FilterParam(name: "inputScale", type: .number, value: scale)
        filter.addInputParam(scaleParam)
    }

}
