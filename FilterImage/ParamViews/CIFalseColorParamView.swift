//
//  CIFalseColorParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/27.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CIFalseColorParamView: FilterParamView {

    var colorPickerWheelView0: ColorPickerWheelView!
    var colorPickerWheelView1: ColorPickerWheelView!

    var color0: UIColor = .gray
    var color1: UIColor = .gray

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        self.backgroundColor = .clear
        
        var rect = CGRect(x:4, y: 0, width: 100, height: 20);
        let inputColor0Label = UILabel(frame: rect)
        inputColor0Label.textColor = .white
        inputColor0Label.text = "Color 1"
        self.addSubview(inputColor0Label)
        
        rect = CGRect(
            x: 0,
            y: inputColor0Label.frame.origin.y + inputColor0Label.frame.height,
            width: self.frame.width,
            height: self.frame.height / 2 - inputColor0Label.frame.height
        )
        
        colorPickerWheelView0 = ColorPickerWheelView(frame: rect)
        self.addSubview(colorPickerWheelView0)
        colorPickerWheelView0.delegate = self
        if let colorParam = filter.inputParam(name: "inputColor0") {
            let ciColor = colorParam.value as! CIColor
            color0 = UIColor(ciColor: ciColor)
        }
        colorPickerWheelView0.selectedColor = color0
        
        rect = CGRect(x:4, y: self.frame.height / 2, width: 100, height: 20);
        let inputColor1Label = UILabel(frame: rect)
        inputColor1Label.textColor = .white
        inputColor1Label.text = "Color 2"
        self.addSubview(inputColor1Label)
        
        rect = CGRect(
            x: 0,
            y: inputColor1Label.frame.origin.y + inputColor1Label.frame.height,
            width: self.frame.width,
            height: self.frame.height / 2 - inputColor1Label.frame.height
        )
        
        colorPickerWheelView1 = ColorPickerWheelView(frame: rect)
        self.addSubview(colorPickerWheelView1)
        colorPickerWheelView1.delegate = self
        if let colorParam = filter.inputParam(name: "inputColor1") {
            let ciColor = colorParam.value as! CIColor
            color1 = UIColor(ciColor: ciColor)
        }
        colorPickerWheelView1.selectedColor = color1
   }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override func applyChanges() {
        let color0Param = FilterParam(name: "inputColor0", type: .color, value: CIColor(color: color0))
        filter.addInputParam(color0Param)
        let color1Param = FilterParam(name: "inputColor1", type: .color, value: CIColor(color: color1))
        filter.addInputParam(color1Param)
    }
}

extension CIFalseColorParamView: ColorPickerWheelViewDelegate {
    
    func colorPickerWheelView(colorPickerWheelView: ColorPickerWheelView, didSelectColor color: UIColor) {
        if colorPickerWheelView == colorPickerWheelView0 {
            self.color0 = color
        } else {
            self.color1 = color
        }
    }
}
