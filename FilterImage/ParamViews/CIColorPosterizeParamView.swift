//
//  CIColorPosterizeParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/22.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit
import CoreImage

class CIColorPosterizeParamView: FilterParamView {
    
    var inputLevelsLabel: UILabel!
    var inputLevelsSlider: UISlider!
    var inputLevelsValueLabel: UILabel!
    var levels: Float = 6.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setupSubviews() {
        var rect = CGRect(x: 4, y: 4, width: 100, height: 29)
        inputLevelsLabel = UILabel(frame: rect)
        inputLevelsLabel?.textColor = .white
        inputLevelsLabel?.text = "Levels"
        self.addSubview(inputLevelsLabel)
        
        rect = CGRect(
            x: inputLevelsLabel.frame.origin.x + inputLevelsLabel.frame.width,
            y: 4,
            width: self.frame.width - (inputLevelsLabel.frame.origin.x + inputLevelsLabel.frame.width + 44),
            height: 29
        )
        inputLevelsSlider = UISlider(frame: rect)
        inputLevelsSlider.minimumValue = 2.0
        inputLevelsSlider.maximumValue = 30.0
        if let param = filter.inputParam(name: "inputLevels") {
            let value = param.value as! NSNumber
            levels = Float(truncating: value)
        }
        inputLevelsSlider.value = levels
        inputLevelsSlider.isUserInteractionEnabled = true
        addSubview(inputLevelsSlider)
        
        rect = CGRect(
            x: inputLevelsSlider.frame.origin.x + inputLevelsSlider.frame.width,
            y: 4,
            width: 44,
            height: 29
        )
        inputLevelsValueLabel = UILabel(frame: rect)
        inputLevelsValueLabel.textColor = .white
        inputLevelsValueLabel.textAlignment = .center
        inputLevelsValueLabel.text = "".appendingFormat("%.1f", levels)
        addSubview(inputLevelsValueLabel)
        
        inputLevelsSlider.addTarget(self, action: #selector(levelsChanged(_:)), for: .valueChanged)

    }
    
    @objc func levelsChanged(_ sender: Any) {
        levels = inputLevelsSlider.value
        inputLevelsValueLabel.text = "".appendingFormat("%.1f", levels)
    }
    
    override func applyChanges() {
        let levelsParam = FilterParam(name: "inputLevels", type: .number, value: levels)
        filter.addInputParam(levelsParam)
    }

}
