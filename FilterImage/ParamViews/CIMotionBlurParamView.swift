//
//  CIMotionBlurParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/24.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CIMotionBlurParamView: FilterParamView {

    var inputRadiusLabel: UILabel!
    var inputRadiusSlider: UISlider!
    var inputRadiusValueLabel: UILabel!
    var inputAngleLabel: UILabel!
    var inputAngleSlider: UISlider!
    var inputAngleValueLabel: UILabel!
    var radius: Float = 6.0
    var angle: Float = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        var rect = CGRect(x: 4, y: 4, width: 100, height: 29)
        inputRadiusLabel = UILabel(frame: rect)
        inputRadiusLabel?.textColor = .white
        inputRadiusLabel?.text = "Radius"
        self.addSubview(inputRadiusLabel)
        
        rect = CGRect(
            x: inputRadiusLabel.frame.origin.x + inputRadiusLabel.frame.width,
            y: inputRadiusLabel.frame.origin.y,
            width: self.frame.width - (inputRadiusLabel.frame.origin.x + inputRadiusLabel.frame.width + 44),
            height: 29
        )
        inputRadiusSlider = UISlider(frame: rect)
        inputRadiusSlider.minimumValue = 1
        inputRadiusSlider.maximumValue = 100
        if let param = filter.inputParam(name: "inputRadius") {
            let value = param.value as! NSNumber
            radius = Float(truncating: value)
        }
        inputRadiusSlider.value = radius
        addSubview(inputRadiusSlider)
        
        rect = CGRect(
            x: inputRadiusSlider.frame.origin.x + inputRadiusSlider.frame.width,
            y: inputRadiusLabel.frame.origin.y,
            width: 44,
            height: 29
        )
        inputRadiusValueLabel = UILabel(frame: rect)
        inputRadiusValueLabel.textColor = .white
        inputRadiusValueLabel.textAlignment = .center
        inputRadiusValueLabel.text = "".appendingFormat("%.1f", radius)
        addSubview(inputRadiusValueLabel)
        
        inputRadiusSlider.addTarget(self, action: #selector(radiusChanged(_:)), for: .valueChanged)
        
        rect = CGRect(x: 4, y: inputRadiusLabel.frame.origin.y + inputRadiusLabel.frame.height + 16, width: 100, height: 29)
        inputAngleLabel = UILabel(frame: rect)
        inputAngleLabel?.textColor = .white
        inputAngleLabel?.text = "Angle"
        self.addSubview(inputAngleLabel)

        rect = CGRect(
            x: inputAngleLabel.frame.origin.x + inputAngleLabel.frame.width,
            y: inputAngleLabel.frame.origin.y,
            width: self.frame.width - (inputAngleLabel.frame.origin.x + inputAngleLabel.frame.width + 56),
            height: 29
        )
        inputAngleSlider = UISlider(frame: rect)
        inputAngleSlider.minimumValue = -Float.pi
        inputAngleSlider.maximumValue = Float.pi
        if let param = filter.inputParam(name: "inputAngle") {
            let value = param.value as! NSNumber
            angle = Float(truncating: value)
        }
        inputAngleSlider.value = angle
        addSubview(inputAngleSlider)
        
        rect = CGRect(
            x: inputAngleSlider.frame.origin.x + inputAngleSlider.frame.width,
            y: inputAngleLabel.frame.origin.y,
            width: 56,
            height: 29
        )
        inputAngleValueLabel = UILabel(frame: rect)
        inputAngleValueLabel.textColor = .white
        inputAngleValueLabel.textAlignment = .center
        inputAngleValueLabel.text = "".appendingFormat("%.3f", angle)
        addSubview(inputAngleValueLabel)
        
        inputAngleSlider.addTarget(self, action: #selector(angleChanged(_:)), for: .valueChanged)
        
    }
    
    @objc func radiusChanged(_ sender: Any) {
        radius = inputRadiusSlider.value
        inputRadiusValueLabel.text = "".appendingFormat("%.1f", radius)
    }
    
    @objc func angleChanged(_ sender: Any) {
        angle = inputAngleSlider.value
        inputAngleValueLabel.text = "".appendingFormat("%.3f", angle)
    }
    
    override func applyChanges() {
        let radiusParam = FilterParam(name: "inputRadius", type: .number, value: radius)
        filter.addInputParam(radiusParam)
        let angleParam = FilterParam(name: "inputAngle", type: .number, value: angle)
        filter.addInputParam(angleParam)
    }
    
}
