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
        let location = gesture.location(ofTouch: 0, in: colorPickerImageView)
        selectColorAt(point: location)
    }
    
    @objc func wheelPanned(_ gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: colorPickerImageView)
        var r = colorPickerImageView.frame
        r.origin = CGPoint.zero
        if r.contains(location) {
            selectColorAt(point: location)
        }
    }
    
    private func selectColorAt(point: CGPoint) {
        if colorPickerImageView.frame.contains(point) {
            if let color = pixelColorAt(point) {
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
    
    private func pixelColorAt(_ location: CGPoint) -> UIColor? {
        var color: UIColor? = nil
        
        guard let inImage = colorPickerImageView.image?.cgImage else { return color }
        
        let pixelWidth = inImage.width
        let pixelHeight = inImage.height
        let bitmapBytesPerRow = pixelWidth * 4
        let bitmapByteCount = bitmapBytesPerRow * pixelHeight
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let bitmapData = calloc(bitmapByteCount, MemoryLayout<UInt8>.size)
        
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        guard let context = CGContext(data: bitmapData, width: pixelWidth, height: pixelHeight, bitsPerComponent: 8, bytesPerRow: bitmapBytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo.rawValue) else {
            free(bitmapData)
            return color
        }
        
        let rect = CGRect(x: 0, y: 0, width: pixelWidth, height: pixelHeight)
        
        context.draw(inImage, in: rect)
        
        guard let data = context.data else {
            free(bitmapData)
            return color
        }
        
        let offset = 4 * (pixelWidth * Int(round(location.y))) + 4 * Int(round(location.x))
        let red = data.load(fromByteOffset: offset, as: UInt8.self)
        let green = data.load(fromByteOffset: offset+1, as: UInt8.self)
        let blue = data.load(fromByteOffset: offset+2, as: UInt8.self)
        let alpha = data.load(fromByteOffset: offset+3, as: UInt8.self)
        print("location: \(location) offset: \(offset) colors (RGBA): \(red) \(green) \(blue) \(alpha)")
        color = UIColor(red: CGFloat(Float(red)/255.0), green: CGFloat(Float(green)/255.0), blue: CGFloat(Float(blue)/255.0), alpha: CGFloat(Float(alpha)/255.0))
        
        free(bitmapData)
        
        return color
    }
}
