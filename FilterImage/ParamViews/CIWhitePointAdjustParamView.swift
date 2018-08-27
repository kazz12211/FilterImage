//
//  CIWhitePointAdjustParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/27.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CIWhitePointAdjustParamView: FilterParamView {

    var colorPickerWheelView: ColorPickerWheelView!

    var color: UIColor = .gray
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        self.backgroundColor = .clear
        
        var rect = CGRect(x:4, y: 0, width: 100, height: 20);
        let inputColorLabel = UILabel(frame: rect)
        inputColorLabel.textColor = .white
        inputColorLabel.text = "Color"
        self.addSubview(inputColorLabel)
        
        rect = CGRect(
            x: 0,
            y: inputColorLabel.frame.origin.y + inputColorLabel.frame.height,
            width: self.frame.width,
            height: self.frame.height - 80
        )

        colorPickerWheelView = ColorPickerWheelView(frame: rect)
        self.addSubview(colorPickerWheelView)
        colorPickerWheelView.delegate = self
        if let colorParam = filter.inputParam(name: "inputColor") {
            let ciColor = colorParam.value as! CIColor
            color = UIColor(ciColor: ciColor)
        }
        colorPickerWheelView.selectedColor = color

    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override func applyChanges() {
        let colorParam = FilterParam(name: "inputColor", type: .color, value: CIColor(color: color))
        filter.addInputParam(colorParam)
    }
}

extension CIWhitePointAdjustParamView: ColorPickerWheelViewDelegate {
    
    func colorPickerWheelView(colorPickerWheelView: ColorPickerWheelView, didSelectColor color: UIColor) {
        self.color = color
    }
}
