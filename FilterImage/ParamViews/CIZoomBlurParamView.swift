//
//  CIZoomBlurParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/24.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CIZoomBlurParamView: FilterParamView {

    var inputCenterLabel: UILabel!
    var inputCenterXField: UITextField!
    var inputCenterYField: UITextField!
    var inputAmountLabel: UILabel!
    var inputAmountSlider: UISlider!
    var inputAmountValueLabel: UILabel!
    var inputCenter: CGPoint = CGPoint(x: 150, y: 150)
    var amount: Float = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if inputCenterXField.isFirstResponder || inputCenterYField.isFirstResponder {
            self.endEditing(true)
        }
    }
    
    override func setupSubviews() {
        var rect = CGRect(x: 4, y: 4, width: 100, height: 29)
        inputCenterLabel = UILabel(frame: rect)
        inputCenterLabel?.textColor = .white
        inputCenterLabel?.text = "Center"
        self.addSubview(inputCenterLabel)
        
        rect = CGRect(
            x: inputCenterLabel.frame.origin.x + inputCenterLabel.frame.width,
            y: inputCenterLabel.frame.origin.y,
            width: 50,
            height: 29
        )
        inputCenterXField = UITextField(frame: rect)
        inputCenterXField.textAlignment = .center
        inputCenterXField.keyboardType = .numberPad
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
        inputCenterYField.keyboardType = .numberPad
        inputCenterYField.backgroundColor = .white
        addSubview(inputCenterYField)
        
        if let param = filter.inputParam(name: "inputCenter") {
            let value = param.value as! CIVector
            inputCenter = value.cgPointValue
        }
        inputCenterXField.text = "".appendingFormat("%.0f", inputCenter.x)
        inputCenterYField.text = "".appendingFormat("%.0f", inputCenter.y)

        
        
        rect = CGRect(x: 4, y: inputCenterLabel.frame.origin.y + inputCenterLabel.frame.height + 16, width: 100, height: 29)
        inputAmountLabel = UILabel(frame: rect)
        inputAmountLabel.textColor = .white
        inputAmountLabel.text = "Amount"
        self.addSubview(inputAmountLabel)
        
        rect = CGRect(
            x: inputAmountLabel.frame.origin.x + inputAmountLabel.frame.width,
            y: inputAmountLabel.frame.origin.y,
            width: self.frame.width - (inputAmountLabel.frame.origin.x + inputAmountLabel.frame.width + 56),
            height: 29
        )
        inputAmountSlider = UISlider(frame: rect)
        inputAmountSlider.minimumValue = -200
        inputAmountSlider.maximumValue = 200
        if let param = filter.inputParam(name: "inputAmount") {
            let value = param.value as! NSNumber
            amount = Float(truncating: value)
        }
        inputAmountSlider.value = amount
        addSubview(inputAmountSlider)
        
        rect = CGRect(
            x: inputAmountSlider.frame.origin.x + inputAmountSlider.frame.width,
            y: inputAmountLabel.frame.origin.y,
            width: 56,
            height: 29
        )
        inputAmountValueLabel = UILabel(frame: rect)
        inputAmountValueLabel.textColor = .white
        inputAmountValueLabel.textAlignment = .center
        inputAmountValueLabel.text = "".appendingFormat("%.0f", amount)
        addSubview(inputAmountValueLabel)
        
        inputAmountSlider.addTarget(self, action: #selector(amountChanged(_:)), for: .valueChanged)
        
    }
    
    @objc func amountChanged(_ sender: Any) {
        amount = inputAmountSlider.value
        inputAmountValueLabel.text = "".appendingFormat("%.0f", amount)
    }
    
    override func applyChanges() {
        if let xs = inputCenterXField.text {
            if let x = NumberFormatter().number(from: xs) {
                inputCenter.x = CGFloat(truncating: x)
            } else {
                inputCenter.x = 150
            }
        }
        if let ys = inputCenterYField.text {
            if let y = NumberFormatter().number(from: ys) {
                inputCenter.y = CGFloat(truncating: y)
            } else {
                inputCenter.y = 150
            }
        }
        let centerParam = FilterParam(name: "inputCenter", type: .number, value: CIVector(cgPoint: inputCenter))
        filter.addInputParam(centerParam)
        let amountParam = FilterParam(name: "inputAmount", type: .number, value: amount)
        filter.addInputParam(amountParam)
    }
    
}
