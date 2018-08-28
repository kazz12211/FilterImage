//
//  CIEdgeWorkParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/28.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CIEdgeWorkParamView: FilterParamView {

    var inputRadiusSlider: UISlider!
    var inputRadiusValueLabel: UILabel!
    
    var radius: Float = 1.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        self.backgroundColor = .clear
        
        var rect = CGRect(x:4, y: 4, width: 100, height: 20);
        let inputRadiusLabel = UILabel(frame: rect)
        inputRadiusLabel.textColor = .white
        inputRadiusLabel.text = "Radius"
        self.addSubview(inputRadiusLabel)
        
        rect = CGRect(x: inputRadiusLabel.frame.origin.x + inputRadiusLabel.frame.width, y: inputRadiusLabel.frame.origin.y, width: self.frame.width - (inputRadiusLabel.frame.origin.x + inputRadiusLabel.frame.width + 44), height: 29)
        inputRadiusSlider = UISlider(frame: rect)
        inputRadiusSlider.minimumValue = 0
        inputRadiusSlider.maximumValue = 20
        if let param = filter.inputParam(name: "inputRadius") {
            let value = param.value as! NSNumber
            radius = Float(truncating: value)
        }
        inputRadiusSlider.value = radius
        self.addSubview(inputRadiusSlider)
        
        rect = CGRect(x: inputRadiusSlider.frame.origin.x + inputRadiusSlider.frame.width, y: inputRadiusLabel.frame.origin.y, width: 44, height: 29)
        inputRadiusValueLabel = UILabel(frame: rect)
        inputRadiusValueLabel.textColor = .white
        inputRadiusValueLabel.textAlignment = .center
        inputRadiusValueLabel.text = "".appendingFormat("%.2f", radius)
        self.addSubview(inputRadiusValueLabel)
        
        inputRadiusSlider.addTarget(self, action: #selector(radiusChanged(_:)), for: .valueChanged)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    @objc func radiusChanged(_ sender: Any) {
        radius = inputRadiusSlider.value
        inputRadiusValueLabel.text = "".appendingFormat("%.2f", radius)
    }
    
    override func applyChanges() {
        let radiusParam = FilterParam(name: "inputRadius", type: .number, value: radius)
        filter.addInputParam(radiusParam)
    }

}
