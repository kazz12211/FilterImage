//
//  CIVibranceParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/27.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class CIVibranceParamView: FilterParamView {

    var inputAmountSlider: UISlider!
    var inputAmountValueLabel: UILabel!
    
    var amount: Float!      // -10 - 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        var rect = CGRect(x: 4, y: 4, width: 100, height: 29)
        let inputAmountLabel = UILabel(frame: rect)
        inputAmountLabel.textColor = .white
        inputAmountLabel.text = "Amount"
        self.addSubview(inputAmountLabel)
        
        rect = CGRect(
            x: inputAmountLabel.frame.origin.x + inputAmountLabel.frame.width,
            y: inputAmountLabel.frame.origin.y,
            width: self.frame.width - (inputAmountLabel.frame.origin.x + inputAmountLabel.frame.width + 44),
            height: 29
        )
        inputAmountSlider = UISlider(frame: rect)
        inputAmountSlider.minimumValue = -1
        inputAmountSlider.maximumValue = 1
        
        if let param = filter.inputParam(name: "inputAmount") {
            let value = param.value as! NSNumber
            amount = Float(truncating: value)
        }
        inputAmountSlider.value = amount
        inputAmountSlider.isUserInteractionEnabled = true
        addSubview(inputAmountSlider)
        
        rect = CGRect(
            x: inputAmountSlider.frame.origin.x + inputAmountSlider.frame.width,
            y: inputAmountSlider.frame.origin.y,
            width: 44,
            height: 29
        )
        inputAmountValueLabel = UILabel(frame: rect)
        inputAmountValueLabel.textColor = .white
        inputAmountValueLabel.textAlignment = .center
        inputAmountValueLabel.text = "".appendingFormat("%.2f", amount)
        addSubview(inputAmountValueLabel)
        
        inputAmountSlider.addTarget(self, action: #selector(amountChanged(_:)), for: .valueChanged)
        
    }
    
    @objc func amountChanged(_ sender: Any) {
        amount = inputAmountSlider.value
        inputAmountValueLabel.text = "".appendingFormat("%.2f", amount)
    }
    
    override func applyChanges() {
        let amountParam = FilterParam(name: "inputAmount", type: .number, value: amount)
        filter.addInputParam(amountParam)
    }

}
