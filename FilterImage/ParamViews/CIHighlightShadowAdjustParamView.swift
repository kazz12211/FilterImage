//
//  CIHighlightShadowAdjustParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/28.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CIHighlightShadowAdjustParamView: FilterParamView {

    var inputHighlightAmountSlider: UISlider!
    var inputHighlightAmountValueLabel: UILabel!
    var inputShadowAmountSlider: UISlider!
    var inputShadowAmountValueLabel: UILabel!

    var highlightAmount: Float = 1.0
    var shadowAmount: Float = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        self.backgroundColor = .clear
        
        var rect = CGRect(x:4, y: 4, width: 100, height: 20);
        let inputHighlightAmountLabel = UILabel(frame: rect)
        inputHighlightAmountLabel.textColor = .white
        inputHighlightAmountLabel.text = "Highlight"
        self.addSubview(inputHighlightAmountLabel)
        
        rect = CGRect(x: inputHighlightAmountLabel.frame.origin.x + inputHighlightAmountLabel.frame.width, y: inputHighlightAmountLabel.frame.origin.y, width: self.frame.width - (inputHighlightAmountLabel.frame.origin.x + inputHighlightAmountLabel.frame.width + 60), height: 29)
        inputHighlightAmountSlider = UISlider(frame: rect)
        inputHighlightAmountSlider.minimumValue = 0.3
        inputHighlightAmountSlider.maximumValue = 1
        if let param = filter.inputParam(name: "inputHighlightAmount") {
            let value = param.value as! NSNumber
            highlightAmount = Float(truncating: value)
        }
        inputHighlightAmountSlider.value = highlightAmount
        self.addSubview(inputHighlightAmountSlider)
        
        rect = CGRect(x: inputHighlightAmountSlider.frame.origin.x + inputHighlightAmountSlider.frame.width, y: inputHighlightAmountLabel.frame.origin.y, width: 60, height: 29)
        inputHighlightAmountValueLabel = UILabel(frame: rect)
        inputHighlightAmountValueLabel.textColor = .white
        inputHighlightAmountValueLabel.textAlignment = .center
        inputHighlightAmountValueLabel.text = "".appendingFormat("%.2f", highlightAmount)
        self.addSubview(inputHighlightAmountValueLabel)
        
        rect = CGRect(x:4, y: inputHighlightAmountLabel.frame.origin.y + inputHighlightAmountLabel.frame.height + 16, width: 100, height: 20);
        let inputShadowAmountLabel = UILabel(frame: rect)
        inputShadowAmountLabel.textColor = .white
        inputShadowAmountLabel.text = "Shadow"
        self.addSubview(inputShadowAmountLabel)
        
        rect = CGRect(x: inputShadowAmountLabel.frame.origin.x + inputShadowAmountLabel.frame.width, y: inputShadowAmountLabel.frame.origin.y, width: self.frame.width - (inputShadowAmountLabel.frame.origin.x + inputShadowAmountLabel.frame.width + 60), height: 29)
        inputShadowAmountSlider = UISlider(frame: rect)
        inputShadowAmountSlider.minimumValue = -1
        inputShadowAmountSlider.maximumValue = 1
        if let param = filter.inputParam(name: "inputShadowAmount") {
            let value = param.value as! NSNumber
            shadowAmount = Float(truncating: value)
        }
        inputShadowAmountSlider.value = shadowAmount
        self.addSubview(inputShadowAmountSlider)
        
        rect = CGRect(x: inputShadowAmountSlider.frame.origin.x + inputShadowAmountSlider.frame.width, y: inputShadowAmountLabel.frame.origin.y, width: 60, height: 29)
        inputShadowAmountValueLabel = UILabel(frame: rect)
        inputShadowAmountValueLabel.textColor = .white
        inputShadowAmountValueLabel.textAlignment = .center
        inputShadowAmountValueLabel.text = "".appendingFormat("%.2f", shadowAmount)
        self.addSubview(inputShadowAmountValueLabel)
        

        inputHighlightAmountSlider.addTarget(self, action: #selector(highlightAmountChanged(_:)), for: .valueChanged)
        inputShadowAmountSlider.addTarget(self, action: #selector(shadowAmountChanged(_:)), for: .valueChanged)
    }
    
    @objc func highlightAmountChanged(_ sender: Any) {
        highlightAmount = inputHighlightAmountSlider.value
        inputHighlightAmountValueLabel.text = "".appendingFormat("%.2f", highlightAmount)
    }
    @objc func shadowAmountChanged(_ sender: Any) {
        shadowAmount = inputShadowAmountSlider.value
        inputShadowAmountValueLabel.text = "".appendingFormat("%.2f", shadowAmount)
    }

    override func applyChanges() {
        let highlightAmountParam = FilterParam(name: "inputHighlightAmount", type: .number, value: highlightAmount)
        filter.addInputParam(highlightAmountParam)
        let shadowAmountParam = FilterParam(name: "inputShadowAmount", type: .number, value: shadowAmount)
        filter.addInputParam(shadowAmountParam)
   }
    

}
