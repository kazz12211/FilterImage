//
//  CIGammaAdjustParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/25.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CIGammaAdjustParamView: FilterParamView {

    var inputPowerSlider: UISlider!
    var inputPowerValueLabel: UILabel!
    
    var power: Float!      // -10 - 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        var rect = CGRect(x: 4, y: 4, width: 100, height: 29)
        let inputPowerLabel = UILabel(frame: rect)
        inputPowerLabel.textColor = .white
        inputPowerLabel.text = "Power"
        self.addSubview(inputPowerLabel)
        
        rect = CGRect(
            x: inputPowerLabel.frame.origin.x + inputPowerLabel.frame.width,
            y: inputPowerLabel.frame.origin.y,
            width: self.frame.width - (inputPowerLabel.frame.origin.x + inputPowerLabel.frame.width + 44),
            height: 29
        )
        inputPowerSlider = UISlider(frame: rect)
        inputPowerSlider.minimumValue = 0.25
        inputPowerSlider.maximumValue = 4
        
        if let param = filter.inputParam(name: "inputPower") {
            let value = param.value as! NSNumber
            power = Float(truncating: value)
        }
        inputPowerSlider.value = power
        inputPowerSlider.isUserInteractionEnabled = true
        addSubview(inputPowerSlider)
        
        rect = CGRect(
            x: inputPowerSlider.frame.origin.x + inputPowerSlider.frame.width,
            y: inputPowerSlider.frame.origin.y,
            width: 44,
            height: 29
        )
        inputPowerValueLabel = UILabel(frame: rect)
        inputPowerValueLabel.textColor = .white
        inputPowerValueLabel.textAlignment = .center
        inputPowerValueLabel.text = "".appendingFormat("%.2f", power)
        addSubview(inputPowerValueLabel)
        
        inputPowerSlider.addTarget(self, action: #selector(powerChanged(_:)), for: .valueChanged)
        
    }
    
    @objc func powerChanged(_ sender: Any) {
        power = inputPowerSlider.value
        inputPowerValueLabel.text = "".appendingFormat("%.2f", power)
    }
    
    override func applyChanges() {
        let powerParam = FilterParam(name: "inputPower", type: .number, value: power)
        filter.addInputParam(powerParam)
    }

}
