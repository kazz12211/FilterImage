//
//  CIExposureAdjustParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/25.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CIExposureAdjustParamView: FilterParamView {

    var inputEVSlider: UISlider!
    var inputEVValueLabel: UILabel!
    
    var ev: Float!      // -10 - 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        var rect = CGRect(x: 4, y: 4, width: 100, height: 29)
        let inputEVLabel = UILabel(frame: rect)
        inputEVLabel.textColor = .white
        inputEVLabel.text = "EV"
        self.addSubview(inputEVLabel)
        
        rect = CGRect(
            x: inputEVLabel.frame.origin.x + inputEVLabel.frame.width,
            y: inputEVLabel.frame.origin.y,
            width: self.frame.width - (inputEVLabel.frame.origin.x + inputEVLabel.frame.width + 44),
            height: 29
        )
        inputEVSlider = UISlider(frame: rect)
        inputEVSlider.minimumValue = -10.0
        inputEVSlider.maximumValue = 10.0
        
        if let param = filter.inputParam(name: "inputEV") {
            let value = param.value as! NSNumber
            ev = Float(truncating: value)
        }
        inputEVSlider.value = ev
        inputEVSlider.isUserInteractionEnabled = true
        addSubview(inputEVSlider)
        
        rect = CGRect(
            x: inputEVSlider.frame.origin.x + inputEVSlider.frame.width,
            y: inputEVSlider.frame.origin.y,
            width: 44,
            height: 29
        )
        inputEVValueLabel = UILabel(frame: rect)
        inputEVValueLabel.textColor = .white
        inputEVValueLabel.textAlignment = .center
        inputEVValueLabel.text = "".appendingFormat("%.1f", ev)
        addSubview(inputEVValueLabel)
        
        inputEVSlider.addTarget(self, action: #selector(evChanged(_:)), for: .valueChanged)
        
    }
    
    @objc func evChanged(_ sender: Any) {
        ev = inputEVSlider.value
        inputEVValueLabel.text = "".appendingFormat("%.1f", ev)
    }
    
    override func applyChanges() {
        let evParam = FilterParam(name: "inputEV", type: .number, value: ev)
        filter.addInputParam(evParam)
    }
}
