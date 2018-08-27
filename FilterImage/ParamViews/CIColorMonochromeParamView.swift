//
//  CGColorMonochromeParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/22.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit
import CoreImage

class CIColorMonochromeParamView : FilterParamView {
    
    var colorPickerWheelView: ColorPickerWheelView!
    var inputColorLabel: UILabel!
    var inputIntensityLabel: UILabel!
    var inputIntensitySlider: UISlider!
    var inputIntensityValueLabel: UILabel!
    var color: UIColor = .gray
    var intensity: Float = 1.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        self.backgroundColor = .clear
        
        var rect = CGRect(x:4, y: 0, width: 100, height: 20);
        inputColorLabel = UILabel(frame: rect)
        inputColorLabel.textColor = .white
        inputColorLabel.text = "Color"
        self.addSubview(inputColorLabel)
        
        rect = CGRect(x:0, y: inputColorLabel.frame.origin.y + inputColorLabel.frame.height, width: self.frame.width, height: self.frame.height - 80)
        colorPickerWheelView = ColorPickerWheelView(frame: rect)
        self.addSubview(colorPickerWheelView)
        colorPickerWheelView.delegate = self
        if let colorParam = filter.inputParam(name: "inputColor") {
            let ciColor = colorParam.value as! CIColor
            color = UIColor(ciColor: ciColor)
        }
        colorPickerWheelView.selectedColor = color

        rect = CGRect(x: 4, y: self.frame.height - 40, width: 100, height: 20)
        inputIntensityLabel = UILabel(frame: rect)
        inputIntensityLabel.textColor = .white
        inputIntensityLabel.text = "Intensity"
        self.addSubview(inputIntensityLabel)
        
        rect = CGRect(x: inputIntensityLabel.frame.origin.x + inputIntensityLabel.frame.width, y: self.frame.height-45, width: self.frame.width - (inputIntensityLabel.frame.origin.x + inputIntensityLabel.frame.width + 44), height: 29)
        inputIntensitySlider = UISlider(frame: rect)
        inputIntensitySlider.minimumValue = 0
        inputIntensitySlider.maximumValue = 1
        if let param = filter.inputParam(name: "inputIntensity") {
            let value = param.value as! NSNumber
            intensity = Float(truncating: value)
        }
        inputIntensitySlider.value = intensity
        self.addSubview(inputIntensitySlider)
        
        rect = CGRect(x: inputIntensitySlider.frame.origin.x + inputIntensitySlider.frame.width, y: self.frame.height-45, width: 44, height: 29)
        inputIntensityValueLabel = UILabel(frame: rect)
        inputIntensityValueLabel.textColor = .white
        inputIntensityValueLabel.textAlignment = .center
        inputIntensityValueLabel.text = "".appendingFormat("%.1f", intensity)
        self.addSubview(inputIntensityValueLabel)
        
        inputIntensitySlider.addTarget(self, action: #selector(intensityChanged(_:)), for: .valueChanged)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    @objc func intensityChanged(_ sender: Any) {
        intensity = inputIntensitySlider.value
        inputIntensityValueLabel.text = "".appendingFormat("%.1f", intensity)
    }
    
    override func applyChanges() {
        let colorParam = FilterParam(name: "inputColor", type: .color, value: CIColor(color: color))
        filter.addInputParam(colorParam)
        let intensityParam = FilterParam(name: "inputIntensity", type: .number, value: intensity)
        filter.addInputParam(intensityParam)
    }
}

extension CIColorMonochromeParamView: ColorPickerWheelViewDelegate {
    
    func colorPickerWheelView(colorPickerWheelView: ColorPickerWheelView, didSelectColor color: UIColor) {
        self.color = color
    }
}
