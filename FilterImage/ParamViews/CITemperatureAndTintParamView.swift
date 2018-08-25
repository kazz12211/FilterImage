//
//  CITemperatureAndTintParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/25.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CITemperatureAndTintParamView: FilterParamView {

    var inputNeutralTempField: UITextField!
    var inputNeutralTintField: UITextField!
    var inputTargetNeutralTempField: UITextField!
    var inputTargetNeutralTintField: UITextField!

    var neutral: CGPoint = CGPoint(x: 6500, y: 0)
    var targetNeutral: CGPoint = CGPoint(x: 6400, y: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if inputNeutralTempField.isFirstResponder || inputNeutralTintField.isFirstResponder || inputTargetNeutralTempField.isFirstResponder || inputTargetNeutralTintField.isFirstResponder{
            self.endEditing(true)
        }
    }
    
    override func setupSubviews() {
        var rect = CGRect(x: 4, y: 4, width: 100, height: 29)
        let inputNeutralLabel = UILabel(frame: rect)
        inputNeutralLabel.textColor = .white
        inputNeutralLabel.text = "Neutral"
        self.addSubview(inputNeutralLabel)
        
        rect = CGRect(
            x: inputNeutralLabel.frame.origin.x + inputNeutralLabel.frame.width,
            y: inputNeutralLabel.frame.origin.y,
            width: 50,
            height: 29
        )
        let inputNeutralTempLabel = UITextField(frame: rect)
        inputNeutralTempLabel.textColor = .white
        inputNeutralTempLabel.textAlignment = .center
        inputNeutralTempLabel.text = "Temp"
        addSubview(inputNeutralTempLabel)
        
        rect = CGRect(
            x: inputNeutralTempLabel.frame.origin.x + inputNeutralTempLabel.frame.width,
            y: inputNeutralTempLabel.frame.origin.y,
            width: 66,
            height: 29
        )
        inputNeutralTempField = UITextField(frame: rect)
        inputNeutralTempField.textAlignment = .center
        inputNeutralTempField.keyboardType = .decimalPad
        inputNeutralTempField.backgroundColor = .white
        addSubview(inputNeutralTempField)
        
        rect = CGRect(
            x: inputNeutralTempField.frame.origin.x + inputNeutralTempField.frame.width,
            y: inputNeutralTempField.frame.origin.y,
            width: 50,
            height: 29
        )
        let inputNeutralTintLabel = UITextField(frame: rect)
        inputNeutralTintLabel.textColor = .white
        inputNeutralTintLabel.textAlignment = .center
        inputNeutralTintLabel.text = "Tint"
        addSubview(inputNeutralTintLabel)

        rect = CGRect(
            x: inputNeutralTintLabel.frame.origin.x + inputNeutralTintLabel.frame.width,
            y: inputNeutralTintLabel.frame.origin.y,
            width: 66,
            height: 29
        )
        inputNeutralTintField = UITextField(frame: rect)
        inputNeutralTintField.textAlignment = .center
        inputNeutralTintField.keyboardType = .decimalPad
        inputNeutralTintField.backgroundColor = .white
        addSubview(inputNeutralTintField)

        rect = CGRect(x: 4, y: inputNeutralLabel.frame.origin.y + inputNeutralLabel.frame.height + 16, width: 100, height: 29)
        let inputTargetNeutralLabel = UILabel(frame: rect)
        inputTargetNeutralLabel.textColor = .white
        inputTargetNeutralLabel.text = "Target"
        self.addSubview(inputTargetNeutralLabel)
        
        rect = CGRect(
            x: inputTargetNeutralLabel.frame.origin.x + inputTargetNeutralLabel.frame.width,
            y: inputTargetNeutralLabel.frame.origin.y,
            width: 50,
            height: 29
        )
        let inputTargetNeutralTempLabel = UITextField(frame: rect)
        inputTargetNeutralTempLabel.textColor = .white
        inputTargetNeutralTempLabel.textAlignment = .center
        inputTargetNeutralTempLabel.text = "Temp"
        addSubview(inputTargetNeutralTempLabel)
        
        rect = CGRect(
            x: inputTargetNeutralTempLabel.frame.origin.x + inputTargetNeutralTempLabel.frame.width,
            y: inputTargetNeutralTempLabel.frame.origin.y,
            width: 66,
            height: 29
        )
        inputTargetNeutralTempField = UITextField(frame: rect)
        inputTargetNeutralTempField.textAlignment = .center
        inputTargetNeutralTempField.keyboardType = .decimalPad
        inputTargetNeutralTempField.backgroundColor = .white
        addSubview(inputTargetNeutralTempField)
        
        rect = CGRect(
            x: inputTargetNeutralTempField.frame.origin.x + inputTargetNeutralTempField.frame.width,
            y: inputTargetNeutralTempField.frame.origin.y,
            width: 50,
            height: 29
        )
        let inputTargetNeutralTintLabel = UITextField(frame: rect)
        inputTargetNeutralTintLabel.textColor = .white
        inputTargetNeutralTintLabel.textAlignment = .center
        inputTargetNeutralTintLabel.text = "Tint"
        addSubview(inputTargetNeutralTintLabel)
        
        rect = CGRect(
            x: inputTargetNeutralTintLabel.frame.origin.x + inputTargetNeutralTintLabel.frame.width,
            y: inputTargetNeutralTintLabel.frame.origin.y,
            width: 66,
            height: 29
        )
        inputTargetNeutralTintField = UITextField(frame: rect)
        inputTargetNeutralTintField.textAlignment = .center
        inputTargetNeutralTintField.keyboardType = .decimalPad
        inputTargetNeutralTintField.backgroundColor = .white
        addSubview(inputTargetNeutralTintField)
        
        if let param = filter.inputParam(name: "inputNeutral") {
            let value = param.value as! CIVector
            neutral = value.cgPointValue
        }
        if let param = filter.inputParam(name: "inputTargetNeutral") {
            let value = param.value as! CIVector
            targetNeutral = value.cgPointValue
        }
        
        inputNeutralTempField.text = "".appendingFormat("%.0f", neutral.x)
        inputNeutralTintField.text = "".appendingFormat("%.0f", neutral.y)
        inputTargetNeutralTempField.text = "".appendingFormat("%.0f", targetNeutral.x)
        inputTargetNeutralTintField.text = "".appendingFormat("%.0f", targetNeutral.y)

    }
    
    override func applyChanges() {
        if let str = inputNeutralTempField.text {
            if let value = NumberFormatter().number(from: str) {
                neutral.x = CGFloat(truncating: value)
            } else {
                neutral.x = 6500
            }
        }
        if let str = inputNeutralTintField.text {
            if let value = NumberFormatter().number(from: str) {
                neutral.y = CGFloat(truncating: value)
            } else {
                neutral.y = 0
            }
        }
        if let str = inputTargetNeutralTempField.text {
            if let value = NumberFormatter().number(from: str) {
                targetNeutral.x = CGFloat(truncating: value)
            } else {
                targetNeutral.x = 6500
            }
        }
        if let str = inputTargetNeutralTintField.text {
            if let value = NumberFormatter().number(from: str) {
                targetNeutral.y = CGFloat(truncating: value)
            } else {
                targetNeutral.y = 0
            }
        }

        let neutralParam = FilterParam(name: "inputNeutral", type: .vector, value: CIVector(cgPoint: neutral))
        filter.addInputParam(neutralParam)
        let targetParam = FilterParam(name: "inputTargetNeutral", type: .vector, value: CIVector(cgPoint: targetNeutral))
        filter.addInputParam(targetParam)
    }
    

}
