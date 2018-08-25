//
//  ColorPickerWheelView.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/22.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit
import CoreImage
import CoreGraphics

protocol ColorPickerWheelViewDelegate: NSObjectProtocol {
    func colorPickerWheelView(colorPickerWheelView: ColorPickerWheelView, didSelectColor color: UIColor)
}

class ColorPickerWheelView : UIView {
    
    weak var delegate: ColorPickerWheelViewDelegate?
    
    var opacityLabel: UILabel!
    var opacitySlider: UISlider!
    var colorView: UIView!
    var colorPickerImageView: UIImageView!
    
    var selectedColor: UIColor = UIColor.white {
        didSet {
            colorView.backgroundColor = selectedColor
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            if selectedColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
                alpha = alpha * 100
            } else {
                alpha = 100.0
            }
            opacityLabel.text = "".appendingFormat("%.0f%%", alpha)
            opacitySlider.value = Float(alpha)
            currentColor = UIColor(red: red, green: green, blue: alpha, alpha: 1.0)
        }
    }
    var currentColor: UIColor!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    private func setupSubviews() {
        self.backgroundColor = UIColor.clear
        
        var wheelFrame = CGRect(x: 0, y: 0, width: self.frame.height - 40, height: self.frame.height - 40)
        var labelFrame = CGRect(x: 0, y: 0, width: 44, height: 29)
        var sliderFrame = CGRect(x: 0, y: 0, width: self.frame.width - 108, height: 29)
        var colorFrame = CGRect(x: 0, y: 0, width: 40, height: 29)
        
        wheelFrame.origin.y = 4
        wheelFrame.origin.x = (self.frame.width - wheelFrame.width) / 2
        labelFrame.origin.y = wheelFrame.origin.y + wheelFrame.height + 4
        labelFrame.origin.x = 4
        sliderFrame.origin.y = labelFrame.origin.y
        sliderFrame.origin.x = labelFrame.origin.x + labelFrame.width + 8
        colorFrame.origin.y = labelFrame.origin.y
        colorFrame.origin.x = sliderFrame.origin.x + sliderFrame.width + 8
        
        colorPickerImageView = UIImageView(frame: wheelFrame)
        opacityLabel = UILabel(frame: labelFrame)
        opacitySlider = UISlider(frame: sliderFrame)
        colorView = UIView(frame: colorFrame)
        
        self.addSubview(colorPickerImageView)
        self.addSubview(opacityLabel)
        self.addSubview(opacitySlider)
        self.addSubview(colorView)
        
        colorPickerImageView.image = UIImage(named: "colorWheel.png")

        opacitySlider.minimumValue = 0
        opacitySlider.maximumValue = 100
        opacitySlider.value = 0
        
        colorPickerImageView.isUserInteractionEnabled = true
        opacitySlider.isUserInteractionEnabled = true
        
        colorPickerImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(wheelTapped(_:))))
        colorPickerImageView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(wheelPanned(_:))))
        opacitySlider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
        
        opacityLabel.textColor = UIColor.white
        colorView.backgroundColor = UIColor.white
    }
    
    @objc func wheelTapped(_ gesture: UITapGestureRecognizer) {
        let location = gesture.location(ofTouch: 0, in: colorPickerImageView.superview)
        selectColorAt(point: location)
    }
    
    @objc func wheelPanned(_ gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: colorPickerImageView.superview)
        var r = colorPickerImageView.frame
        r.origin = CGPoint.zero
        if r.contains(location) {
            selectColorAt(point: location)
        }
    }
    
    private func selectColorAt(point: CGPoint) {
        if colorPickerImageView.frame.contains(point) {
            if let color = calculateColor(point: point) {
                let alpha = opacitySlider.value / 100.0
                currentColor = color
                colorView.backgroundColor = currentColor.withAlphaComponent(CGFloat(alpha))
                if delegate != nil {
                    delegate?.colorPickerWheelView(colorPickerWheelView: self, didSelectColor: currentColor.withAlphaComponent(CGFloat(alpha)))
                }
            }
        }
    }
    
    @objc func sliderChanged(_ sender: Any) {
        let alpha = opacitySlider.value
        opacityLabel.text = "".appendingFormat("%.0f%%", alpha)
        colorView.backgroundColor = currentColor.withAlphaComponent(CGFloat(alpha) / 100.0)
    }
    
    private func calculateColor(point: CGPoint) -> UIColor? {
        
        let center = colorPickerImageView.center
        let radius = colorPickerImageView.frame.width/2
        
        let x = point.x - center.x
        let y = -(point.y - center.y)
        
        var radian = atan2f(Float(y), Float(x))
        if radian < 0 {
            
            radian += Float(Double.pi*2)
        }
        
        let distance = CGFloat(sqrtf(Float(pow(Double(x), 2) + pow(Double(y), 2))))
        let saturation = (distance > radius) ? 1.0 : distance/radius
        let alpha = CGFloat(opacitySlider.value)/100.0;
        let hue = CGFloat(radian/Float(Double.pi*2))
        return UIColor(hue: hue,
                       saturation: saturation,
                       brightness: 1,
                       alpha: alpha)
    }
    
}
