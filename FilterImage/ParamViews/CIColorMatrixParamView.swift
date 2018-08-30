//
//  CIColorMatrix.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/27.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CIColorMatrixParamView: FilterParamView {

    var inputRV_x_field : UITextField!
    var inputRV_y_field : UITextField!
    var inputRV_w_field : UITextField!
    var inputRV_h_field : UITextField!

    var inputGV_x_field : UITextField!
    var inputGV_y_field : UITextField!
    var inputGV_w_field : UITextField!
    var inputGV_h_field : UITextField!

    var inputBV_x_field : UITextField!
    var inputBV_y_field : UITextField!
    var inputBV_w_field : UITextField!
    var inputBV_h_field : UITextField!

    var inputAV_x_field : UITextField!
    var inputAV_y_field : UITextField!
    var inputAV_w_field : UITextField!
    var inputAV_h_field : UITextField!

    var inputBias_x_field : UITextField!
    var inputBias_y_field : UITextField!
    var inputBias_w_field : UITextField!
    var inputBias_h_field : UITextField!

    var RVector: CGRect = CGRect(x: 1, y: 0, width: 0, height: 0)
    var GVector: CGRect = CGRect(x: 0, y: 1, width: 0, height: 0)
    var BVector: CGRect = CGRect(x: 0, y: 0, width: 1, height: 0)
    var AVector: CGRect = CGRect(x: 0, y: 0, width: 0, height: 1)
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
        let RVLabel = UILabel(frame: rect)
        RVLabel.textColor = .white
        RVLabel.text = "Red"
        addSubview(RVLabel)

        rect = CGRect(x: RVLabel.frame.origin.x, y: RVLabel.frame.origin.y + RVLabel.frame.height + 8, width: 100, height: 29)
        let GVLabel = UILabel(frame: rect)
        GVLabel.textColor = .white
        GVLabel.text = "Green"
        addSubview(GVLabel)

        rect = CGRect(x: GVLabel.frame.origin.x, y: GVLabel.frame.origin.y + GVLabel.frame.height + 8, width: 100, height: 29)
        let BVLabel = UILabel(frame: rect)
        BVLabel.textColor = .white
        BVLabel.text = "Blue"
        addSubview(BVLabel)

        rect = CGRect(x: BVLabel.frame.origin.x, y: BVLabel.frame.origin.y + BVLabel.frame.height + 8, width: 100, height: 29)
        let AVLabel = UILabel(frame: rect)
        AVLabel.textColor = .white
        AVLabel.text = "Alpha"
        addSubview(AVLabel)

        rect = CGRect(x: AVLabel.frame.origin.x, y: AVLabel.frame.origin.y + AVLabel.frame.height + 8, width: 100, height: 29)
        let BiasLabel = UILabel(frame: rect)
        BiasLabel.textColor = .white
        BiasLabel.text = "Bias"
        addSubview(BiasLabel)
        
        rect = CGRect(x: xLabel.frame.origin.x, y: RVLabel.frame.origin.y, width: 50, height: 29)
        inputRV_x_field = UITextField(frame: rect)
        inputRV_x_field.textAlignment = .center
        inputRV_x_field.keyboardType = .decimalPad
        inputRV_x_field.backgroundColor = .white
        addSubview(inputRV_x_field)
        rect = CGRect(x: yLabel.frame.origin.x, y: RVLabel.frame.origin.y, width: 50, height: 29)
        inputRV_y_field = UITextField(frame: rect)
        inputRV_y_field.textAlignment = .center
        inputRV_y_field.keyboardType = .decimalPad
        inputRV_y_field.backgroundColor = .white
        addSubview(inputRV_y_field)
        rect = CGRect(x: wLabel.frame.origin.x, y: RVLabel.frame.origin.y, width: 50, height: 29)
        inputRV_w_field = UITextField(frame: rect)
        inputRV_w_field.textAlignment = .center
        inputRV_w_field.keyboardType = .decimalPad
        inputRV_w_field.backgroundColor = .white
        addSubview(inputRV_w_field)
        rect = CGRect(x: hLabel.frame.origin.x, y: RVLabel.frame.origin.y, width: 50, height: 29)
        inputRV_h_field = UITextField(frame: rect)
        inputRV_h_field.textAlignment = .center
        inputRV_h_field.keyboardType = .decimalPad
        inputRV_h_field.backgroundColor = .white
        addSubview(inputRV_h_field)
        
        rect = CGRect(x: xLabel.frame.origin.x, y: GVLabel.frame.origin.y, width: 50, height: 29)
        inputGV_x_field = UITextField(frame: rect)
        inputGV_x_field.textAlignment = .center
        inputGV_x_field.keyboardType = .decimalPad
        inputGV_x_field.backgroundColor = .white
        addSubview(inputGV_x_field)
        rect = CGRect(x: yLabel.frame.origin.x, y: GVLabel.frame.origin.y, width: 50, height: 29)
        inputGV_y_field = UITextField(frame: rect)
        inputGV_y_field.textAlignment = .center
        inputGV_y_field.keyboardType = .decimalPad
        inputGV_y_field.backgroundColor = .white
        addSubview(inputGV_y_field)
        rect = CGRect(x: wLabel.frame.origin.x, y: GVLabel.frame.origin.y, width: 50, height: 29)
        inputGV_w_field = UITextField(frame: rect)
        inputGV_w_field.textAlignment = .center
        inputGV_w_field.keyboardType = .decimalPad
        inputGV_w_field.backgroundColor = .white
        addSubview(inputGV_w_field)
        rect = CGRect(x: hLabel.frame.origin.x, y: GVLabel.frame.origin.y, width: 50, height: 29)
        inputGV_h_field = UITextField(frame: rect)
        inputGV_h_field.textAlignment = .center
        inputGV_h_field.keyboardType = .decimalPad
        inputGV_h_field.backgroundColor = .white
        addSubview(inputGV_h_field)
        
        rect = CGRect(x: xLabel.frame.origin.x, y: BVLabel.frame.origin.y, width: 50, height: 29)
        inputBV_x_field = UITextField(frame: rect)
        inputBV_x_field.textAlignment = .center
        inputBV_x_field.keyboardType = .decimalPad
        inputBV_x_field.backgroundColor = .white
        addSubview(inputBV_x_field)
        rect = CGRect(x: yLabel.frame.origin.x, y: BVLabel.frame.origin.y, width: 50, height: 29)
        inputBV_y_field = UITextField(frame: rect)
        inputBV_y_field.textAlignment = .center
        inputBV_y_field.keyboardType = .decimalPad
        inputBV_y_field.backgroundColor = .white
        addSubview(inputBV_y_field)
        rect = CGRect(x: wLabel.frame.origin.x, y: BVLabel.frame.origin.y, width: 50, height: 29)
        inputBV_w_field = UITextField(frame: rect)
        inputBV_w_field.textAlignment = .center
        inputBV_w_field.keyboardType = .decimalPad
        inputBV_w_field.backgroundColor = .white
        addSubview(inputBV_w_field)
        rect = CGRect(x: hLabel.frame.origin.x, y: BVLabel.frame.origin.y, width: 50, height: 29)
        inputBV_h_field = UITextField(frame: rect)
        inputBV_h_field.textAlignment = .center
        inputBV_h_field.keyboardType = .decimalPad
        inputBV_h_field.backgroundColor = .white
        addSubview(inputBV_h_field)
        
        rect = CGRect(x: xLabel.frame.origin.x, y: AVLabel.frame.origin.y, width: 50, height: 29)
        inputAV_x_field = UITextField(frame: rect)
        inputAV_x_field.textAlignment = .center
        inputAV_x_field.keyboardType = .decimalPad
        inputAV_x_field.backgroundColor = .white
        addSubview(inputAV_x_field)
        rect = CGRect(x: yLabel.frame.origin.x, y: AVLabel.frame.origin.y, width: 50, height: 29)
        inputAV_y_field = UITextField(frame: rect)
        inputAV_y_field.textAlignment = .center
        inputAV_y_field.keyboardType = .decimalPad
        inputAV_y_field.backgroundColor = .white
        addSubview(inputAV_y_field)
        rect = CGRect(x: wLabel.frame.origin.x, y: AVLabel.frame.origin.y, width: 50, height: 29)
        inputAV_w_field = UITextField(frame: rect)
        inputAV_w_field.textAlignment = .center
        inputAV_w_field.keyboardType = .decimalPad
        inputAV_w_field.backgroundColor = .white
        addSubview(inputAV_w_field)
        rect = CGRect(x: hLabel.frame.origin.x, y: AVLabel.frame.origin.y, width: 50, height: 29)
        inputAV_h_field = UITextField(frame: rect)
        inputAV_h_field.textAlignment = .center
        inputAV_h_field.keyboardType = .decimalPad
        inputAV_h_field.backgroundColor = .white
        addSubview(inputAV_h_field)
        
        rect = CGRect(x: xLabel.frame.origin.x, y: BiasLabel.frame.origin.y, width: 50, height: 29)
        inputBias_x_field = UITextField(frame: rect)
        inputBias_x_field.textAlignment = .center
        inputBias_x_field.keyboardType = .decimalPad
        inputBias_x_field.backgroundColor = .white
        addSubview(inputBias_x_field)
        rect = CGRect(x: yLabel.frame.origin.x, y: BiasLabel.frame.origin.y, width: 50, height: 29)
        inputBias_y_field = UITextField(frame: rect)
        inputBias_y_field.textAlignment = .center
        inputBias_y_field.keyboardType = .decimalPad
        inputBias_y_field.backgroundColor = .white
        addSubview(inputBias_y_field)
        rect = CGRect(x: wLabel.frame.origin.x, y: BiasLabel.frame.origin.y, width: 50, height: 29)
        inputBias_w_field = UITextField(frame: rect)
        inputBias_w_field.textAlignment = .center
        inputBias_w_field.keyboardType = .decimalPad
        inputBias_w_field.backgroundColor = .white
        addSubview(inputBias_w_field)
        rect = CGRect(x: hLabel.frame.origin.x, y: BiasLabel.frame.origin.y, width: 50, height: 29)
        inputBias_h_field = UITextField(frame: rect)
        inputBias_h_field.textAlignment = .center
        inputBias_h_field.keyboardType = .decimalPad
        inputBias_h_field.backgroundColor = .white
        addSubview(inputBias_h_field)
        
        if let param = filter.inputParam(name: "inputRVector") {
            let value = param.value as! CIVector
            RVector = value.cgRectValue
        }
        if let param = filter.inputParam(name: "inputGVector") {
            let value = param.value as! CIVector
            GVector = value.cgRectValue
        }
        if let param = filter.inputParam(name: "inputBVector") {
            let value = param.value as! CIVector
            BVector = value.cgRectValue
        }
        if let param = filter.inputParam(name: "inputAVector") {
            let value = param.value as! CIVector
            AVector = value.cgRectValue
        }
        if let param = filter.inputParam(name: "inputBiasector") {
            let value = param.value as! CIVector
            BiasVector = value.cgRectValue
        }
        
        inputRV_x_field.text = "".appendingFormat("%.1f", RVector.origin.x)
        inputRV_y_field.text = "".appendingFormat("%.1f", RVector.origin.y)
        inputRV_w_field.text = "".appendingFormat("%.1f", RVector.width)
        inputRV_h_field.text = "".appendingFormat("%.1f", RVector.height)
        
        inputGV_x_field.text = "".appendingFormat("%.1f", GVector.origin.x)
        inputGV_y_field.text = "".appendingFormat("%.1f", GVector.origin.y)
        inputGV_w_field.text = "".appendingFormat("%.1f", GVector.width)
        inputGV_h_field.text = "".appendingFormat("%.1f", GVector.height)
        
        inputBV_x_field.text = "".appendingFormat("%.1f", BVector.origin.x)
        inputBV_y_field.text = "".appendingFormat("%.1f", BVector.origin.y)
        inputBV_w_field.text = "".appendingFormat("%.1f", BVector.width)
        inputBV_h_field.text = "".appendingFormat("%.1f", BVector.height)
        
        inputAV_x_field.text = "".appendingFormat("%.1f", AVector.origin.x)
        inputAV_y_field.text = "".appendingFormat("%.1f", AVector.origin.y)
        inputAV_w_field.text = "".appendingFormat("%.1f", AVector.width)
        inputAV_h_field.text = "".appendingFormat("%.1f", AVector.height)
        
        inputBias_x_field.text = "".appendingFormat("%.1f", BiasVector.origin.x)
        inputBias_y_field.text = "".appendingFormat("%.1f", BiasVector.origin.y)
        inputBias_w_field.text = "".appendingFormat("%.1f", BiasVector.width)
        inputBias_h_field.text = "".appendingFormat("%.1f", BiasVector.height)
   }
    
    override func applyChanges() {
        RVector.origin.x = getFieldValue(textField: inputRV_x_field, defaultValue: 1)
        RVector.origin.y = getFieldValue(textField: inputRV_y_field, defaultValue: 0)
        RVector.size.width = getFieldValue(textField: inputRV_w_field, defaultValue: 0)
        RVector.size.height = getFieldValue(textField: inputRV_y_field, defaultValue: 0)
        GVector.origin.x = getFieldValue(textField: inputGV_x_field, defaultValue: 0)
        GVector.origin.y = getFieldValue(textField: inputGV_y_field, defaultValue: 1)
        GVector.size.width = getFieldValue(textField: inputGV_w_field, defaultValue: 0)
        GVector.size.height = getFieldValue(textField: inputGV_h_field, defaultValue: 0)
        BVector.origin.x = getFieldValue(textField: inputBV_x_field, defaultValue: 0)
        BVector.origin.y = getFieldValue(textField: inputBV_y_field, defaultValue: 0)
        BVector.size.width = getFieldValue(textField: inputBV_w_field, defaultValue: 1)
        BVector.size.height = getFieldValue(textField: inputBV_h_field, defaultValue: 0)
        AVector.origin.x = getFieldValue(textField: inputAV_x_field, defaultValue: 0)
        AVector.origin.y = getFieldValue(textField: inputAV_y_field, defaultValue: 0)
        AVector.size.width = getFieldValue(textField: inputAV_w_field, defaultValue: 0)
        AVector.size.height = getFieldValue(textField: inputAV_h_field, defaultValue: 1)
        BiasVector.origin.x = getFieldValue(textField: inputBias_x_field, defaultValue: 0)
        BiasVector.origin.y = getFieldValue(textField: inputBias_y_field, defaultValue: 0)
        BiasVector.size.width = getFieldValue(textField: inputBias_w_field, defaultValue: 0)
        BiasVector.size.height = getFieldValue(textField: inputBias_h_field, defaultValue: 0)
        let rParam = FilterParam(name: "inputRVector", type: .vector, value: CIVector(cgRect: RVector))
        filter.addInputParam(rParam)
        let gParam = FilterParam(name: "inputGVector", type: .vector, value: CIVector(cgRect: GVector))
        filter.addInputParam(gParam)
        let bParam = FilterParam(name: "inputBVector", type: .vector, value: CIVector(cgRect: BVector))
        filter.addInputParam(bParam)
        let aParam = FilterParam(name: "inputAVector", type: .vector, value: CIVector(cgRect: AVector))
        filter.addInputParam(aParam)
        let biasParam = FilterParam(name: "inputBiasVector", type: .vector, value: CIVector(cgRect: BiasVector))
        filter.addInputParam(biasParam)

    }

}
