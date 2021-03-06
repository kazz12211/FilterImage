//
//  CICrystallizeParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/28.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CICrystallizeParamView: FilterParamView {

    var inputCenterXField: UITextField!
    var inputCenterYField: UITextField!
    var inputRadiusSlider: UISlider!
    var inputRadiusValueLabel: UILabel!
    var inputCenter: CGPoint = CGPoint(x: 150, y: 150)
    var radius: Float = 20
    
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
        let inputRadiusLabel = UILabel(frame: rect)
        inputRadiusLabel.textColor = .white
        inputRadiusLabel.text = "Radius"
        self.addSubview(inputRadiusLabel)
        
        rect = CGRect(
            x: inputRadiusLabel.frame.origin.x + inputRadiusLabel.frame.width,
            y: inputRadiusLabel.frame.origin.y,
            width: self.frame.width - (inputRadiusLabel.frame.origin.x + inputRadiusLabel.frame.width + 56),
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
            width: 56,
            height: 29
        )
        inputRadiusValueLabel = UILabel(frame: rect)
        inputRadiusValueLabel.textColor = .white
        inputRadiusValueLabel.textAlignment = .center
        inputRadiusValueLabel.text = "".appendingFormat("%.0f", radius)
        addSubview(inputRadiusValueLabel)
        
        inputRadiusSlider.addTarget(self, action: #selector(radiusChanged(_:)), for: .valueChanged)
        
    }
    
    @objc func radiusChanged(_ sender: Any) {
        radius = inputRadiusSlider.value
        inputRadiusValueLabel.text = "".appendingFormat("%.0f", radius)
    }
    
    override func applyChanges() {
        inputCenter.x = getFieldValue(textField: inputCenterXField, defaultValue: 150)
        inputCenter.y = getFieldValue(textField: inputCenterYField, defaultValue: 150)
        let centerParam = FilterParam(name: "inputCenter", type: .number, value: CIVector(cgPoint: inputCenter))
        filter.addInputParam(centerParam)
        let radiusParam = FilterParam(name: "inputRadius", type: .number, value: radius)
        filter.addInputParam(radiusParam)
    }

}
