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

    private func currentResponder(_ start: UIView) -> UIView? {
        if start.isFirstResponder {
            return self
        }
        
        for uiView in start.subviews {
            if uiView.isFirstResponder {
                return uiView
            }
            
            if let responder = currentResponder(uiView) {
                return responder
            }
        }
        return nil
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let responder = currentResponder(self) {
            if responder.isKind(of: UITextField.self) {
                self.endEditing(true)
            }
        }
    }
    
    func getFieldValue(textField: UITextField, defaultValue: CGFloat) -> CGFloat {
        if let str = textField.text {
            if let value = NumberFormatter().number(from: str) {
                return CGFloat(truncating: value)
            } else {
                return defaultValue
            }
        } else {
            return defaultValue
        }

    }
}
