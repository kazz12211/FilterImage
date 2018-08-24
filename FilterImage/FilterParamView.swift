//
//  FilterParamView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/22.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class FilterParamView: UIView {
    
    var filter: Filter!
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupSubviews()
    }
    
    func setupSubviews() {
        fatalError("setupSubviews() must be implemented by concrete subclass")
    }
    
    func applyChanges() {
        fatalError("applyChanges() must be implemented by concrete subclass")
    }
}
