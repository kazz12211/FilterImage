//
//  CIAreaMinimumAlphaParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/30.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CIAreaMinimumAlphaParamView: FilterParamView {

    var inputExtentXField: UITextField!
    var inputExtentYField: UITextField!
    var inputExtentWField: UITextField!
    var inputExtentHField: UITextField!
    var inputExtent: CGRect = CGRect(x: 0, y: 0, width: 640, height: 480)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        var rect = CGRect(x: 4, y: 33, width: 100, height: 29)
        let inputExtentLabel = UILabel(frame: rect)
        inputExtentLabel.textColor = .white
        inputExtentLabel.text = "Extent"
        self.addSubview(inputExtentLabel)
        
        rect = CGRect(
            x: inputExtentLabel.frame.origin.x + inputExtentLabel.frame.width,
            y: 4,
            width: 50,
            height: 29)
        let xLabel = UILabel(frame: rect)
        xLabel.textColor = .white
        xLabel.text = "x"
        self.addSubview(xLabel)
        
        rect = CGRect(
            x: xLabel.frame.origin.x + xLabel.frame.width + 16,
            y: xLabel.frame.origin.y,
            width: 50,
            height: 29)
        let yLabel = UILabel(frame: rect)
        yLabel.textColor = .white
        yLabel.text = "y"
        self.addSubview(yLabel)
        
        rect = CGRect(
            x: yLabel.frame.origin.x + yLabel.frame.width + 16,
            y: yLabel.frame.origin.y,
            width: 50,
            height: 29)
        let wLabel = UILabel(frame: rect)
        wLabel.textColor = .white
        wLabel.text = "w"
        self.addSubview(wLabel)
        
        rect = CGRect(
            x: wLabel.frame.origin.x + wLabel.frame.width + 16,
            y: wLabel.frame.origin.y,
            width: 50,
            height: 29)
        let hLabel = UILabel(frame: rect)
        hLabel.textColor = .white
        hLabel.text = "x"
        self.addSubview(hLabel)
        
        rect = CGRect(
            x: xLabel.frame.origin.x,
            y: xLabel.frame.origin.y + 29,
            width: 50,
            height: 29
        )
        inputExtentXField = UITextField(frame: rect)
        inputExtentXField.textAlignment = .center
        inputExtentXField.keyboardType = .decimalPad
        inputExtentXField.backgroundColor = .white
        addSubview(inputExtentXField)
        
        rect = CGRect(
            x: yLabel.frame.origin.x,
            y: yLabel.frame.origin.y + 29,
            width: 50,
            height: 29
        )
        inputExtentYField = UITextField(frame: rect)
        inputExtentYField.textAlignment = .center
        inputExtentYField.keyboardType = .decimalPad
        inputExtentYField.backgroundColor = .white
        addSubview(inputExtentYField)
        
        rect = CGRect(
            x: wLabel.frame.origin.x,
            y: wLabel.frame.origin.y + 29,
            width: 50,
            height: 29
        )
        inputExtentWField = UITextField(frame: rect)
        inputExtentWField.textAlignment = .center
        inputExtentWField.keyboardType = .decimalPad
        inputExtentWField.backgroundColor = .white
        addSubview(inputExtentWField)
        
        rect = CGRect(
            x: hLabel.frame.origin.x,
            y: hLabel.frame.origin.y + 29,
            width: 50,
            height: 29
        )
        inputExtentHField = UITextField(frame: rect)
        inputExtentHField.textAlignment = .center
        inputExtentHField.keyboardType = .decimalPad
        inputExtentHField.backgroundColor = .white
        addSubview(inputExtentHField)
        
        if let param = filter.inputParam(name: "inputExtent") {
            let value = param.value as! CIVector
            inputExtent = value.cgRectValue
        }
        inputExtentXField.text = "".appendingFormat("%.0f", inputExtent.origin.x)
        inputExtentYField.text = "".appendingFormat("%.0f", inputExtent.origin.y)
        inputExtentWField.text = "".appendingFormat("%.0f", inputExtent.width)
        inputExtentHField.text = "".appendingFormat("%.0f", inputExtent.height)
        
    }
    
    override func applyChanges() {
        inputExtent.origin.x = getFieldValue(textField: inputExtentXField, defaultValue: 0)
        inputExtent.origin.y = getFieldValue(textField: inputExtentYField, defaultValue: 0)
        inputExtent.size.width = getFieldValue(textField: inputExtentWField, defaultValue: 640)
        inputExtent.size.height = getFieldValue(textField: inputExtentHField, defaultValue: 480)
        filter.addInputParam(FilterParam(name: "inputExtent", type: .number, value: CIVector(cgRect: inputExtent)))
    }

}
