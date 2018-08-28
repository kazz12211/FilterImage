//
//  CIColorPolynomialParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/27.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CIColorPolynomialParamView: FilterParamView {

    var inputRC_x_field : UITextField!
    var inputRC_y_field : UITextField!
    var inputRC_w_field : UITextField!
    var inputRC_h_field : UITextField!
    
    var inputGC_x_field : UITextField!
    var inputGC_y_field : UITextField!
    var inputGC_w_field : UITextField!
    var inputGC_h_field : UITextField!
    
    var inputBC_x_field : UITextField!
    var inputBC_y_field : UITextField!
    var inputBC_w_field : UITextField!
    var inputBC_h_field : UITextField!
    
    var inputAC_x_field : UITextField!
    var inputAC_y_field : UITextField!
    var inputAC_w_field : UITextField!
    var inputAC_h_field : UITextField!
    
    var redCoefficients: CGRect = CGRect(x: 1, y: 0, width: 0, height: 0)
    var greenCoefficients: CGRect = CGRect(x: 0, y: 1, width: 0, height: 0)
    var blueCoefficients: CGRect = CGRect(x: 0, y: 0, width: 1, height: 0)
    var alphaCoefficients: CGRect = CGRect(x: 0, y: 0, width: 0, height: 1)
    var BiasVector: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        var rect = CGRect(x: 104, y: 4, width: 54, height: 29)
        let xLabel = UILabel(frame: rect)
        xLabel.textColor = .white
        xLabel.text = "x"
        addSubview(xLabel)
        
        rect = CGRect(x: xLabel.frame.origin.x + xLabel.frame.width, y: xLabel.frame.origin.y, width: xLabel.frame.width, height: xLabel.frame.height)
        let yLabel = UILabel(frame: rect)
        yLabel.textColor = .white
        yLabel.text = "y"
        addSubview(yLabel)
        
        rect = CGRect(x: yLabel.frame.origin.x + yLabel.frame.width, y: yLabel.frame.origin.y, width: yLabel.frame.width, height: yLabel.frame.height)
        let wLabel = UILabel(frame: rect)
        wLabel.textColor = .white
        wLabel.text = "w"
        addSubview(wLabel)
        
        rect = CGRect(x: wLabel.frame.origin.x + wLabel.frame.width, y: wLabel.frame.origin.y, width: wLabel.frame.width, height: wLabel.frame.height)
        let hLabel = UILabel(frame: rect)
        hLabel.textColor = .white
        hLabel.text = "h"
        addSubview(hLabel)
        
        rect = CGRect(x: 4, y: xLabel.frame.origin.y + xLabel.frame.height, width: 100, height: 29)
        let RCLabel = UILabel(frame: rect)
        RCLabel.textColor = .white
        RCLabel.text = "Red"
        addSubview(RCLabel)
        
        rect = CGRect(x: RCLabel.frame.origin.x, y: RCLabel.frame.origin.y + RCLabel.frame.height + 8, width: 100, height: 29)
        let GCLabel = UILabel(frame: rect)
        GCLabel.textColor = .white
        GCLabel.text = "Green"
        addSubview(GCLabel)
        
        rect = CGRect(x: GCLabel.frame.origin.x, y: GCLabel.frame.origin.y + GCLabel.frame.height + 8, width: 100, height: 29)
        let BCLabel = UILabel(frame: rect)
        BCLabel.textColor = .white
        BCLabel.text = "Blue"
        addSubview(BCLabel)
        
        rect = CGRect(x: BCLabel.frame.origin.x, y: BCLabel.frame.origin.y + BCLabel.frame.height + 8, width: 100, height: 29)
        let ACLabel = UILabel(frame: rect)
        ACLabel.textColor = .white
        ACLabel.text = "Alpha"
        addSubview(ACLabel)
        
        rect = CGRect(x: xLabel.frame.origin.x, y: RCLabel.frame.origin.y, width: 50, height: 29)
        inputRC_x_field = UITextField(frame: rect)
        inputRC_x_field.textAlignment = .center
        inputRC_x_field.keyboardType = .decimalPad
        inputRC_x_field.backgroundColor = .white
        addSubview(inputRC_x_field)
        rect = CGRect(x: yLabel.frame.origin.x, y: RCLabel.frame.origin.y, width: 50, height: 29)
        inputRC_y_field = UITextField(frame: rect)
        inputRC_y_field.textAlignment = .center
        inputRC_y_field.keyboardType = .decimalPad
        inputRC_y_field.backgroundColor = .white
        addSubview(inputRC_y_field)
        rect = CGRect(x: wLabel.frame.origin.x, y: RCLabel.frame.origin.y, width: 50, height: 29)
        inputRC_w_field = UITextField(frame: rect)
        inputRC_w_field.textAlignment = .center
        inputRC_w_field.keyboardType = .decimalPad
        inputRC_w_field.backgroundColor = .white
        addSubview(inputRC_w_field)
        rect = CGRect(x: hLabel.frame.origin.x, y: RCLabel.frame.origin.y, width: 50, height: 29)
        inputRC_h_field = UITextField(frame: rect)
        inputRC_h_field.textAlignment = .center
        inputRC_h_field.keyboardType = .decimalPad
        inputRC_h_field.backgroundColor = .white
        addSubview(inputRC_h_field)
        
        rect = CGRect(x: xLabel.frame.origin.x, y: GCLabel.frame.origin.y, width: 50, height: 29)
        inputGC_x_field = UITextField(frame: rect)
        inputGC_x_field.textAlignment = .center
        inputGC_x_field.keyboardType = .decimalPad
        inputGC_x_field.backgroundColor = .white
        addSubview(inputGC_x_field)
        rect = CGRect(x: yLabel.frame.origin.x, y: GCLabel.frame.origin.y, width: 50, height: 29)
        inputGC_y_field = UITextField(frame: rect)
        inputGC_y_field.textAlignment = .center
        inputGC_y_field.keyboardType = .decimalPad
        inputGC_y_field.backgroundColor = .white
        addSubview(inputGC_y_field)
        rect = CGRect(x: wLabel.frame.origin.x, y: GCLabel.frame.origin.y, width: 50, height: 29)
        inputGC_w_field = UITextField(frame: rect)
        inputGC_w_field.textAlignment = .center
        inputGC_w_field.keyboardType = .decimalPad
        inputGC_w_field.backgroundColor = .white
        addSubview(inputGC_w_field)
        rect = CGRect(x: hLabel.frame.origin.x, y: GCLabel.frame.origin.y, width: 50, height: 29)
        inputGC_h_field = UITextField(frame: rect)
        inputGC_h_field.textAlignment = .center
        inputGC_h_field.keyboardType = .decimalPad
        inputGC_h_field.backgroundColor = .white
        addSubview(inputGC_h_field)
        
        rect = CGRect(x: xLabel.frame.origin.x, y: BCLabel.frame.origin.y, width: 50, height: 29)
        inputBC_x_field = UITextField(frame: rect)
        inputBC_x_field.textAlignment = .center
        inputBC_x_field.keyboardType = .decimalPad
        inputBC_x_field.backgroundColor = .white
        addSubview(inputBC_x_field)
        rect = CGRect(x: yLabel.frame.origin.x, y: BCLabel.frame.origin.y, width: 50, height: 29)
        inputBC_y_field = UITextField(frame: rect)
        inputBC_y_field.textAlignment = .center
        inputBC_y_field.keyboardType = .decimalPad
        inputBC_y_field.backgroundColor = .white
        addSubview(inputBC_y_field)
        rect = CGRect(x: wLabel.frame.origin.x, y: BCLabel.frame.origin.y, width: 50, height: 29)
        inputBC_w_field = UITextField(frame: rect)
        inputBC_w_field.textAlignment = .center
        inputBC_w_field.keyboardType = .decimalPad
        inputBC_w_field.backgroundColor = .white
        addSubview(inputBC_w_field)
        rect = CGRect(x: hLabel.frame.origin.x, y: BCLabel.frame.origin.y, width: 50, height: 29)
        inputBC_h_field = UITextField(frame: rect)
        inputBC_h_field.textAlignment = .center
        inputBC_h_field.keyboardType = .decimalPad
        inputBC_h_field.backgroundColor = .white
        addSubview(inputBC_h_field)
        
        rect = CGRect(x: xLabel.frame.origin.x, y: ACLabel.frame.origin.y, width: 50, height: 29)
        inputAC_x_field = UITextField(frame: rect)
        inputAC_x_field.textAlignment = .center
        inputAC_x_field.keyboardType = .decimalPad
        inputAC_x_field.backgroundColor = .white
        addSubview(inputAC_x_field)
        rect = CGRect(x: yLabel.frame.origin.x, y: ACLabel.frame.origin.y, width: 50, height: 29)
        inputAC_y_field = UITextField(frame: rect)
        inputAC_y_field.textAlignment = .center
        inputAC_y_field.keyboardType = .decimalPad
        inputAC_y_field.backgroundColor = .white
        addSubview(inputAC_y_field)
        rect = CGRect(x: wLabel.frame.origin.x, y: ACLabel.frame.origin.y, width: 50, height: 29)
        inputAC_w_field = UITextField(frame: rect)
        inputAC_w_field.textAlignment = .center
        inputAC_w_field.keyboardType = .decimalPad
        inputAC_w_field.backgroundColor = .white
        addSubview(inputAC_w_field)
        rect = CGRect(x: hLabel.frame.origin.x, y: ACLabel.frame.origin.y, width: 50, height: 29)
        inputAC_h_field = UITextField(frame: rect)
        inputAC_h_field.textAlignment = .center
        inputAC_h_field.keyboardType = .decimalPad
        inputAC_h_field.backgroundColor = .white
        addSubview(inputAC_h_field)
        
        
        if let param = filter.inputParam(name: "inputRedCoefficients") {
            let value = param.value as! CIVector
            redCoefficients = value.cgRectValue
        }
        if let param = filter.inputParam(name: "inputGreenCoefficients") {
            let value = param.value as! CIVector
            greenCoefficients = value.cgRectValue
        }
        if let param = filter.inputParam(name: "inputBlueCoefficients") {
            let value = param.value as! CIVector
            blueCoefficients = value.cgRectValue
        }
        if let param = filter.inputParam(name: "inputAlphaCoefficients") {
            let value = param.value as! CIVector
            alphaCoefficients = value.cgRectValue
        }
        
        inputRC_x_field.text = "".appendingFormat("%.1f", redCoefficients.origin.x)
        inputRC_y_field.text = "".appendingFormat("%.1f", redCoefficients.origin.y)
        inputRC_w_field.text = "".appendingFormat("%.1f", redCoefficients.width)
        inputRC_h_field.text = "".appendingFormat("%.1f", redCoefficients.height)
        
        inputGC_x_field.text = "".appendingFormat("%.1f", greenCoefficients.origin.x)
        inputGC_y_field.text = "".appendingFormat("%.1f", greenCoefficients.origin.y)
        inputGC_w_field.text = "".appendingFormat("%.1f", greenCoefficients.width)
        inputGC_h_field.text = "".appendingFormat("%.1f", greenCoefficients.height)
        
        inputBC_x_field.text = "".appendingFormat("%.1f", blueCoefficients.origin.x)
        inputBC_y_field.text = "".appendingFormat("%.1f", blueCoefficients.origin.y)
        inputBC_w_field.text = "".appendingFormat("%.1f", blueCoefficients.width)
        inputBC_h_field.text = "".appendingFormat("%.1f", blueCoefficients.height)
        
        inputAC_x_field.text = "".appendingFormat("%.1f", alphaCoefficients.origin.x)
        inputAC_y_field.text = "".appendingFormat("%.1f", alphaCoefficients.origin.y)
        inputAC_w_field.text = "".appendingFormat("%.1f", alphaCoefficients.width)
        inputAC_h_field.text = "".appendingFormat("%.1f", alphaCoefficients.height)
        
    }
    
    override func applyChanges() {
        if let str = inputRC_x_field.text {
            if let value = NumberFormatter().number(from: str) {
                redCoefficients.origin.x = CGFloat(truncating: value)
            } else {
                redCoefficients.origin.x = 0
            }
        }
        if let str = inputRC_y_field.text {
            if let value = NumberFormatter().number(from: str) {
                redCoefficients.origin.y = CGFloat(truncating: value)
            } else {
                redCoefficients.origin.y = 1
            }
        }
        if let str = inputRC_w_field.text {
            if let value = NumberFormatter().number(from: str) {
                redCoefficients.size.width = CGFloat(truncating: value)
            } else {
                redCoefficients.size.width = 0
            }
        }
        if let str = inputRC_h_field.text {
            if let value = NumberFormatter().number(from: str) {
                redCoefficients.size.height = CGFloat(truncating: value)
            } else {
                redCoefficients.size.height = 0
            }
        }
        
        if let str = inputGC_x_field.text {
            if let value = NumberFormatter().number(from: str) {
                greenCoefficients.origin.x = CGFloat(truncating: value)
            } else {
                greenCoefficients.origin.x = 0
            }
        }
        if let str = inputGC_y_field.text {
            if let value = NumberFormatter().number(from: str) {
                greenCoefficients.origin.y = CGFloat(truncating: value)
            } else {
                greenCoefficients.origin.y = 1
            }
        }
        if let str = inputGC_w_field.text {
            if let value = NumberFormatter().number(from: str) {
                greenCoefficients.size.width = CGFloat(truncating: value)
            } else {
                greenCoefficients.size.width = 0
            }
        }
        if let str = inputGC_h_field.text {
            if let value = NumberFormatter().number(from: str) {
                greenCoefficients.size.height = CGFloat(truncating: value)
            } else {
                greenCoefficients.size.height = 0
            }
        }
        
        if let str = inputBC_x_field.text {
            if let value = NumberFormatter().number(from: str) {
                blueCoefficients.origin.x = CGFloat(truncating: value)
            } else {
                blueCoefficients.origin.x = 0
            }
        }
        if let str = inputBC_y_field.text {
            if let value = NumberFormatter().number(from: str) {
                blueCoefficients.origin.y = CGFloat(truncating: value)
            } else {
                blueCoefficients.origin.y = 1
            }
        }
        if let str = inputBC_w_field.text {
            if let value = NumberFormatter().number(from: str) {
                blueCoefficients.size.width = CGFloat(truncating: value)
            } else {
                blueCoefficients.size.width = 0
            }
        }
        if let str = inputBC_h_field.text {
            if let value = NumberFormatter().number(from: str) {
                blueCoefficients.size.height = CGFloat(truncating: value)
            } else {
                blueCoefficients.size.height = 0
            }
        }
        
        if let str = inputAC_x_field.text {
            if let value = NumberFormatter().number(from: str) {
                alphaCoefficients.origin.x = CGFloat(truncating: value)
            } else {
                alphaCoefficients.origin.x = 0
            }
        }
        if let str = inputAC_y_field.text {
            if let value = NumberFormatter().number(from: str) {
                alphaCoefficients.origin.y = CGFloat(truncating: value)
            } else {
                alphaCoefficients.origin.y = 1
            }
        }
        if let str = inputAC_w_field.text {
            if let value = NumberFormatter().number(from: str) {
                alphaCoefficients.size.width = CGFloat(truncating: value)
            } else {
                alphaCoefficients.size.width = 0
            }
        }
        if let str = inputAC_h_field.text {
            if let value = NumberFormatter().number(from: str) {
                alphaCoefficients.size.height = CGFloat(truncating: value)
            } else {
                alphaCoefficients.size.height = 0
            }
        }
        
        
        let rParam = FilterParam(name: "inputRedCoefficients", type: .vector, value: CIVector(cgRect: redCoefficients))
        filter.addInputParam(rParam)
        let gParam = FilterParam(name: "inputGreenCoefficients", type: .vector, value: CIVector(cgRect: greenCoefficients))
        filter.addInputParam(gParam)
        let bParam = FilterParam(name: "inputBlueCoefficients", type: .vector, value: CIVector(cgRect: blueCoefficients))
        filter.addInputParam(bParam)
        let aParam = FilterParam(name: "inputAlphaCoefficients", type: .vector, value: CIVector(cgRect: alphaCoefficients))
        filter.addInputParam(aParam)
    }

}
