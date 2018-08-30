//
//  CIHistogramDisplayFilterParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/30.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CIHistogramDisplayFilterParamView: FilterParamView {

    var inputHeightSlider: UISlider!
    var inputHeightValueLabel: UILabel!
    var inputHighLimitSlider: UISlider!
    var inputHighLimitValueLabel: UILabel!
    var inputLowLimitSlider: UISlider!
    var inputLowLimitValueLabel: UILabel!

    var inputHeight: Float = 1.0
    var highLimit: Float = 1.0
    var lowLimit: Float = 1.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        self.backgroundColor = .clear
        
        var rect = CGRect(x:4, y: 4, width: 100, height: 20);
        let inputHeightLabel = UILabel(frame: rect)
        inputHeightLabel.textColor = .white
        inputHeightLabel.text = "Height"
        self.addSubview(inputHeightLabel)
        
        rect = CGRect(x: inputHeightLabel.frame.origin.x + inputHeightLabel.frame.width, y: inputHeightLabel.frame.origin.y, width: self.frame.width - (inputHeightLabel.frame.origin.x + inputHeightLabel.frame.width + 44), height: 29)
        inputHeightSlider = UISlider(frame: rect)
        inputHeightSlider.minimumValue = 1
        inputHeightSlider.maximumValue = 200
        if let param = filter.inputParam(name: "inputHeight") {
            let value = param.value as! NSNumber
            inputHeight = Float(truncating: value)
        }
        inputHeightSlider.value = inputHeight
        self.addSubview(inputHeightSlider)
        
        rect = CGRect(x: inputHeightSlider.frame.origin.x + inputHeightSlider.frame.width, y: inputHeightLabel.frame.origin.y, width: 44, height: 29)
        inputHeightValueLabel = UILabel(frame: rect)
        inputHeightValueLabel.textColor = .white
        inputHeightValueLabel.textAlignment = .center
        inputHeightValueLabel.text = "".appendingFormat("%.1f", inputHeight)
        self.addSubview(inputHeightValueLabel)
        
        
        rect = CGRect(x:4, y: inputHeightLabel.frame.origin.y + inputHeightLabel.frame.height + 16, width: 100, height: 20);
        let inputHighLimitLabel = UILabel(frame: rect)
        inputHighLimitLabel.textColor = .white
        inputHighLimitLabel.text = "High Limit"
        self.addSubview(inputHighLimitLabel)
        
        rect = CGRect(x: inputHighLimitLabel.frame.origin.x + inputHighLimitLabel.frame.width, y: inputHighLimitLabel.frame.origin.y, width: self.frame.width - (inputHighLimitLabel.frame.origin.x + inputHighLimitLabel.frame.width + 44), height: 29)
        inputHighLimitSlider = UISlider(frame: rect)
        inputHighLimitSlider.minimumValue = 0
        inputHighLimitSlider.maximumValue = 1
        if let param = filter.inputParam(name: "inputHighLimit") {
            let value = param.value as! NSNumber
            highLimit = Float(truncating: value)
        }
        inputHighLimitSlider.value = highLimit
        self.addSubview(inputHighLimitSlider)
        
        rect = CGRect(x: inputHighLimitSlider.frame.origin.x + inputHighLimitSlider.frame.width, y: inputHighLimitLabel.frame.origin.y, width: 44, height: 29)
        inputHighLimitValueLabel = UILabel(frame: rect)
        inputHighLimitValueLabel.textColor = .white
        inputHighLimitValueLabel.textAlignment = .center
        inputHighLimitValueLabel.text = "".appendingFormat("%.2f", highLimit)
        self.addSubview(inputHighLimitValueLabel)
        
        rect = CGRect(x:4, y: inputHighLimitLabel.frame.origin.y + inputHighLimitLabel.frame.height + 16, width: 100, height: 20);
        let inputLowLimitLabel = UILabel(frame: rect)
        inputLowLimitLabel.textColor = .white
        inputLowLimitLabel.text = "Low Limit"
        self.addSubview(inputLowLimitLabel)
        
        rect = CGRect(x: inputLowLimitLabel.frame.origin.x + inputLowLimitLabel.frame.width, y: inputLowLimitLabel.frame.origin.y, width: self.frame.width - (inputLowLimitLabel.frame.origin.x + inputLowLimitLabel.frame.width + 44), height: 29)
        inputLowLimitSlider = UISlider(frame: rect)
        inputLowLimitSlider.minimumValue = 0
        inputLowLimitSlider.maximumValue = 1
        if let param = filter.inputParam(name: "inputLowLimit") {
            let value = param.value as! NSNumber
            lowLimit = Float(truncating: value)
        }
        inputLowLimitSlider.value = lowLimit
        self.addSubview(inputLowLimitSlider)
        
        rect = CGRect(x: inputLowLimitSlider.frame.origin.x + inputLowLimitSlider.frame.width, y: inputLowLimitSlider.frame.origin.y, width: 44, height: 29)
        inputLowLimitValueLabel = UILabel(frame: rect)
        inputLowLimitValueLabel.textColor = .white
        inputLowLimitValueLabel.textAlignment = .center
        inputLowLimitValueLabel.text = "".appendingFormat("%.2f", lowLimit)
        self.addSubview(inputLowLimitValueLabel)

        inputHeightSlider.addTarget(self, action: #selector(inputHeightChanged(_:)), for: .valueChanged)
        inputHighLimitSlider.addTarget(self, action: #selector(highLimitChanged(_:)), for: .valueChanged)
        inputLowLimitSlider.addTarget(self, action: #selector(lowLimitChanged(_:)), for: .valueChanged)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    @objc func inputHeightChanged(_ sender: Any) {
        inputHeight = inputHeightSlider.value
        inputHeightValueLabel.text = "".appendingFormat("%.1f", inputHeight)
    }
    
    @objc func highLimitChanged(_ sender: Any) {
        highLimit = inputHighLimitSlider.value
        inputHighLimitValueLabel.text = "".appendingFormat("%.2f", highLimit)
    }
    @objc func lowLimitChanged(_ sender: Any) {
        lowLimit = inputLowLimitSlider.value
        inputLowLimitValueLabel.text = "".appendingFormat("%.2f", lowLimit)
    }

    
    override func applyChanges() {
        filter.addInputParam(FilterParam(name: "inputHeight", type: .number, value: inputHeight))
        filter.addInputParam(FilterParam(name: "inputHighLimit", type: .number, value: highLimit))
        filter.addInputParam(FilterParam(name: "inputLowLimit", type: .number, value: lowLimit))
    }

}
