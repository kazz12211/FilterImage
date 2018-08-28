//
//  CIColorClampParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/25.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CIColorClampParamView: FilterParamView {

    var inputMinComponentsXField: UITextField!
    var inputMinComponentsYField: UITextField!
    var inputMinComponentsWField: UITextField!
    var inputMinComponentsHField: UITextField!
    var inputMaxComponentsXField: UITextField!
    var inputMaxComponentsYField: UITextField!
    var inputMaxComponentsWField: UITextField!
    var inputMaxComponentsHField: UITextField!
    
    var maxComponents: CGRect!
    var minComponents: CGRect!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setupSubviews() {
        var rect = CGRect(x: 4, y: 4, width: 50, height: 29)
        let inputMinComponentsLabel = UILabel(frame: rect)
        inputMinComponentsLabel.textColor = .white
        inputMinComponentsLabel.text = "Min"
        addSubview(inputMinComponentsLabel)
        
        rect = CGRect(
            x: inputMinComponentsLabel.frame.origin.x + inputMinComponentsLabel.frame.width,
            y: inputMinComponentsLabel.frame.origin.y,
            width: 20,
            height: 29)
        let minX = UILabel(frame: rect)
        minX.textColor = .white
        minX.text = "x:"
        addSubview(minX)
        
        rect = CGRect(
            x: minX.frame.origin.x + minX.frame.width + 50,
            y: minX.frame.origin.y,
            width: 20,
            height: 29)
        let minY = UILabel(frame: rect)
        minY.textColor = .white
        minY.text = "y:"
        addSubview(minY)
        
        rect = CGRect(
            x: minY.frame.origin.x + minY.frame.width + 50,
            y: minX.frame.origin.y,
            width: 20,
            height: 29)
        let minW = UILabel(frame: rect)
        minW.textColor = .white
        minW.text = "w:"
        addSubview(minW)
        
        rect = CGRect(
            x: minW.frame.origin.x + minW.frame.width + 50,
            y: minX.frame.origin.y,
            width: 20,
            height: 29)
        let minH = UILabel(frame: rect)
        minH.textColor = .white
        minH.text = "h:"
        addSubview(minH)
        
        rect = CGRect(x: 4, y: inputMinComponentsLabel.frame.origin.y + inputMinComponentsLabel.frame.height + 32, width: 50, height: 29)
        let inputMaxComponentsLabel = UILabel(frame: rect)
        inputMaxComponentsLabel.textColor = .white
        inputMaxComponentsLabel.text = "Max"
        addSubview(inputMaxComponentsLabel)
        
        rect = CGRect(
            x: inputMaxComponentsLabel.frame.origin.x + inputMaxComponentsLabel.frame.width,
            y: inputMaxComponentsLabel.frame.origin.y,
            width: 20,
            height: 29)
        let maxX = UILabel(frame: rect)
        maxX.textColor = .white
        maxX.text = "x:"
        addSubview(maxX)
        
        rect = CGRect(
            x: maxX.frame.origin.x + maxX.frame.width + 50,
            y: inputMaxComponentsLabel.frame.origin.y,
            width: 20,
            height: 29)
        let maxY = UILabel(frame: rect)
        maxY.textColor = .white
        maxY.text = "y:"
        addSubview(maxY)
        
        rect = CGRect(
            x: maxY.frame.origin.x + maxY.frame.width + 50,
            y: maxY.frame.origin.y,
            width: 20,
            height: 29)
        let maxW = UILabel(frame: rect)
        maxW.textColor = .white
        maxW.text = "w:"
        addSubview(maxW)
        
        rect = CGRect(
            x: maxW.frame.origin.x + maxW.frame.width + 50,
            y: maxW.frame.origin.y,
            width: 20,
            height: 29)
        let maxH = UILabel(frame: rect)
        maxH.textColor = .white
        maxH.text = "h:"
        addSubview(maxH)
        
        rect = CGRect(x: minX.frame.origin.x + minX.frame.width, y: minX.frame.origin.y, width: 46, height: 29)
        inputMinComponentsXField = UITextField(frame: rect)
        inputMinComponentsXField.textAlignment = .center
        inputMinComponentsXField.keyboardType = .decimalPad
        inputMinComponentsXField.backgroundColor = .white
        addSubview(inputMinComponentsXField)
        
        rect = CGRect(x: minY.frame.origin.x + minY.frame.width, y: minY.frame.origin.y, width: 46, height: 29)
        inputMinComponentsYField = UITextField(frame: rect)
        inputMinComponentsYField.textAlignment = .center
        inputMinComponentsYField.keyboardType = .decimalPad
        inputMinComponentsYField.backgroundColor = .white
        addSubview(inputMinComponentsYField)
        
        rect = CGRect(x: minW.frame.origin.x + minW.frame.width, y: minW.frame.origin.y, width: 46, height: 29)
        inputMinComponentsWField = UITextField(frame: rect)
        inputMinComponentsWField.textAlignment = .center
        inputMinComponentsWField.keyboardType = .decimalPad
        inputMinComponentsWField.backgroundColor = .white
        addSubview(inputMinComponentsWField)
        
        rect = CGRect(x: minH.frame.origin.x + minH.frame.width, y: minH.frame.origin.y, width: 46, height: 29)
        inputMinComponentsHField = UITextField(frame: rect)
        inputMinComponentsHField.textAlignment = .center
        inputMinComponentsHField.keyboardType = .decimalPad
        inputMinComponentsHField.backgroundColor = .white
        addSubview(inputMinComponentsHField)

        rect = CGRect(x: maxX.frame.origin.x + maxX.frame.width, y: maxX.frame.origin.y, width: 46, height: 29)
        inputMaxComponentsXField = UITextField(frame: rect)
        inputMaxComponentsXField.textAlignment = .center
        inputMaxComponentsXField.keyboardType = .decimalPad
        inputMaxComponentsXField.backgroundColor = .white
        addSubview(inputMaxComponentsXField)
        
        rect = CGRect(x: maxY.frame.origin.x + maxY.frame.width, y: maxY.frame.origin.y, width: 46, height: 29)
        inputMaxComponentsYField = UITextField(frame: rect)
        inputMaxComponentsYField.textAlignment = .center
        inputMaxComponentsYField.keyboardType = .decimalPad
        inputMaxComponentsYField.backgroundColor = .white
        addSubview(inputMaxComponentsYField)
        
        rect = CGRect(x: maxW.frame.origin.x + maxW.frame.width, y: maxW.frame.origin.y, width: 46, height: 29)
        inputMaxComponentsWField = UITextField(frame: rect)
        inputMaxComponentsWField.textAlignment = .center
        inputMaxComponentsWField.keyboardType = .decimalPad
        inputMaxComponentsWField.backgroundColor = .white
        addSubview(inputMaxComponentsWField)
        
        rect = CGRect(x: maxH.frame.origin.x + maxH.frame.width, y: maxH.frame.origin.y, width: 46, height: 29)
        inputMaxComponentsHField = UITextField(frame: rect)
        inputMaxComponentsHField.textAlignment = .center
        inputMaxComponentsHField.keyboardType = .decimalPad
        inputMaxComponentsHField.backgroundColor = .white
        addSubview(inputMaxComponentsHField)
        
        if let param = filter.inputParam(name: "inputMinComponents") {
            let value = param.value as! CIVector
            minComponents = value.cgRectValue
        }
        if let param = filter.inputParam(name: "inputMaxComponents") {
            let value = param.value as! CIVector
            maxComponents = value.cgRectValue
        }
        
        inputMinComponentsXField.text = "".appendingFormat("%.1f", minComponents.origin.x)
        inputMinComponentsYField.text = "".appendingFormat("%.1f", minComponents.origin.y)
        inputMinComponentsWField.text = "".appendingFormat("%.1f", minComponents.width)
        inputMinComponentsHField.text = "".appendingFormat("%.1f", minComponents.height)

        inputMaxComponentsXField.text = "".appendingFormat("%.1f", maxComponents.origin.x)
        inputMaxComponentsYField.text = "".appendingFormat("%.1f", maxComponents.origin.y)
        inputMaxComponentsWField.text = "".appendingFormat("%.1f", maxComponents.width)
        inputMaxComponentsHField.text = "".appendingFormat("%.1f", maxComponents.height)
   }
    
    override func applyChanges() {
        minComponents = CGRect.zero
        maxComponents = CGRect(x: 1, y: 1, width: 1, height: 1)
        if let value = inputMinComponentsXField.text {
            if let f = NumberFormatter().number(from: value) {
                if validValue(value: f) {
                    minComponents.origin.x = CGFloat(truncating: f)
                }
            }
        }
        if let value = inputMinComponentsYField.text {
            if let f = NumberFormatter().number(from: value) {
                if validValue(value: f) {
                    minComponents.origin.y = CGFloat(truncating: f)
                }
            }
        }
        if let value = inputMinComponentsWField.text {
            if let f = NumberFormatter().number(from: value) {
                if validValue(value: f) {
                    minComponents.size.width = CGFloat(truncating: f)
                }
            }
        }
        if let value = inputMinComponentsHField.text {
            if let f = NumberFormatter().number(from: value) {
                if validValue(value: f) {
                    minComponents.size.height = CGFloat(truncating: f)
                }
            }
        }
        if let value = inputMaxComponentsXField.text {
            if let f = NumberFormatter().number(from: value) {
                if validValue(value: f) {
                    maxComponents.origin.x = CGFloat(truncating: f)
                }
            }
        }
        if let value = inputMaxComponentsYField.text {
            if let f = NumberFormatter().number(from: value) {
                if validValue(value: f) {
                    maxComponents.origin.y = CGFloat(truncating: f)
                }
            }
        }
        if let value = inputMaxComponentsWField.text {
            if let f = NumberFormatter().number(from: value) {
                if validValue(value: f) {
                    maxComponents.size.width = CGFloat(truncating: f)
                }
            }
        }
        if let value = inputMaxComponentsHField.text {
            if let f = NumberFormatter().number(from: value) {
                if validValue(value: f) {
                    maxComponents.size.height = CGFloat(truncating: f)
                }
            }
        }
        
        
        let minParam = FilterParam(name: "inputMinComponents", type: .vector, value: CIVector(cgRect: minComponents))
        filter.addInputParam(minParam)
        let maxParam = FilterParam(name: "inputMaxComponents", type: .vector, value: CIVector(cgRect: maxComponents))
        filter.addInputParam(maxParam)
    }
    
    private func validValue(value: NSNumber) -> Bool {
        if value.compare(0.0) == .orderedAscending && value.compare(1.0) == .orderedDescending {
            return false
        }
        return true
    }
}
