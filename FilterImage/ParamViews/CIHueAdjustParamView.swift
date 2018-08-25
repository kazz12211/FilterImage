//
//  CIHueAdjustParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/25.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CIHueAdjustParamView: FilterParamView {

    var inputAngleSlider: UISlider!
    var inputAngleValueLabel: UILabel!
    
    var angle: Float!      // -10 - 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        var rect = CGRect(x: 4, y: 4, width: 100, height: 29)
        let inputAngleLabel = UILabel(frame: rect)
        inputAngleLabel.textColor = .white
        inputAngleLabel.text = "Angle"
        self.addSubview(inputAngleLabel)
        
        rect = CGRect(
            x: inputAngleLabel.frame.origin.x + inputAngleLabel.frame.width,
            y: inputAngleLabel.frame.origin.y,
            width: self.frame.width - (inputAngleLabel.frame.origin.x + inputAngleLabel.frame.width + 66),
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
        inputAngleSlider.isUserInteractionEnabled = true
        addSubview(inputAngleSlider)
        
        rect = CGRect(
            x: inputAngleSlider.frame.origin.x + inputAngleSlider.frame.width,
            y: inputAngleSlider.frame.origin.y,
            width: 66,
            height: 29
        )
        inputAngleValueLabel = UILabel(frame: rect)
        inputAngleValueLabel.textColor = .white
        inputAngleValueLabel.textAlignment = .center
        inputAngleValueLabel.text = "".appendingFormat("%.4f", angle)
        addSubview(inputAngleValueLabel)
        
        inputAngleSlider.addTarget(self, action: #selector(angleChanged(_:)), for: .valueChanged)
        
    }
    
    @objc func angleChanged(_ sender: Any) {
        angle = inputAngleSlider.value
        inputAngleValueLabel.text = "".appendingFormat("%.4f", angle)
    }
    
    override func applyChanges() {
        let angleParam = FilterParam(name: "inputAngle", type: .number, value: angle)
        filter.addInputParam(angleParam)
    }

}
