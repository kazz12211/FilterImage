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
    var inputCenter: CGPoint = CGPoint(x: 150, y: 150)
    var width: Float = 6
    
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
        inputWidthLabel.text = "WIdth"
        self.addSubview(inputWidthLabel)
        
        rect = CGRect(
            x: inputWidthLabel.frame.origin.x + inputWidthLabel.frame.width,
            y: inputWidthLabel.frame.origin.y,
            width: self.frame.width - (inputWidthLabel.frame.origin.x + inputWidthLabel.frame.width + 56),
            height: 29
        )
        inputWidthSlider = UISlider(frame: rect)
        inputWidthSlider.minimumValue = -200
        inputWidthSlider.maximumValue = 200
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
        
    }
    
    @objc func widthChanged(_ sender: Any) {
        width = inputWidthSlider.value
        inputWidthValueLabel.text = "".appendingFormat("%.1f", width)
    }
    
    override func applyChanges() {
        inputCenter.x = getFieldValue(textField: inputCenterXField, defaultValue: 150)
        inputCenter.y = getFieldValue(textField: inputCenterYField, defaultValue: 150)
        let centerParam = FilterParam(name: "inputCenter", type: .number, value: CIVector(cgPoint: inputCenter))
        filter.addInputParam(centerParam)
        let widthParam = FilterParam(name: "widthAmount", type: .number, value: width)
        filter.addInputParam(widthParam)
    }

}
