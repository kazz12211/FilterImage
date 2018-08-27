//
//  Filters.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/21.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit
import CoreImage

class Filters: NSObject {
    
    var filters: [Filter] = []
    var filterMap: [String: [Filter]] = [:]
    static let shared: Filters = Filters()
    
    override init() {
        super.init()
        add(Filter(
            filterName: "CIBoxBlur",
            categoryName: "CICategoryBlur",
            inputParams: [FilterParam(name: "inputRadius", type: .number, value: 10.0)]))
        add(Filter(
            filterName: "CIDiscBlur",
            categoryName: "CICategoryBlur",
            inputParams: [FilterParam(name: "inputRadius", type: .number, value: 8.0)]))
        add(Filter(
            filterName: "CIGaussianBlur",
            categoryName: "CICategoryBlur",
            inputParams: [FilterParam(name: "inputRadius", type: .number, value: 10.0)]))
        add(Filter(
            filterName: "CIMedianFilter",
            categoryName: "CICategoryBlur",
            inputParams: []))
        add(Filter(
            filterName: "CIMotionBlur",
            categoryName: "CICategoryBlur",
            inputParams: [
                FilterParam(name: "inputRadius", type: .number, value: 20.0),
                FilterParam(name: "inputAngle", type: .number, value: 0.0)]))
        add(Filter(
            filterName: "CINoiseReduction",
            categoryName: "CICategoryBlur",
            inputParams: [
                FilterParam(name: "inputNoiseLevel", type: .number, value: 0.02),
                FilterParam(name: "inputSharpness", type: .number, value: 0.40)]))
        add(Filter(
            filterName: "CIZoomBlur",
            categoryName: "CICategoryBlur",
            inputParams: [
                FilterParam(name: "inputCenter", type: .vector, value: CIVector(cgPoint: CGPoint(x: 150, y: 150))),
                FilterParam(name: "inputAmount", type: .number, value: 20.0)]))
        add(
            Filter(
                filterName: "CIColorMonochrome",
                categoryName: "CICategoryColorEffect",
                inputParams: [
                    FilterParam(name: "inputColor", type: .color, value: CIColor(color: UIColor.gray)),
                    FilterParam(name: "inputIntensity", type: .number, value: 1.0)]))
        add(Filter(
            filterName: "CIColorPosterize",
            categoryName: "CICategoryColorEffect",
            inputParams: [FilterParam(name: "inputLevels", type: .number, value: 6.0)]))
        add(Filter(
            filterName: "CIColorClamp",
            categoryName: "CICategoryColorAdjustment",
            inputParams: [
                FilterParam(name: "inputMinComponents", type: .vector, value: CIVector(cgRect: CGRect(x: 0, y: 0, width: 0, height: 0))),
                FilterParam(name: "inputMaxComponents", type: .vector, value: CIVector(cgRect: CGRect(x: 1, y: 1, width: 1, height: 1)))
            ]))
        add(Filter(
            filterName: "CIColorControls",
            categoryName: "CICategoryColorAdjustment",
            inputParams: [
                FilterParam(name: "inputSaturation", type: .number, value: 1.0),
                FilterParam(name: "inputBrightness", type: .number, value: 1.0),
                FilterParam(name: "inputContrast", type: .number, value: 1.0)
            ]))
        add(Filter(
            filterName: "CIExposureAdjust",
            categoryName: "CICategoryColorAdjustment",
            inputParams: [FilterParam(name: "inputEV", type: .number, value: 0.5)]))
        add(Filter(
            filterName: "CIGammaAdjust",
            categoryName: "CICategoryColorAdjustment",
            inputParams: [FilterParam(name: "inputPower", type: .number, value: 0.5)]))
        add(Filter(
            filterName: "CIHueAdjust",
            categoryName: "CICategoryColorAdjustment",
            inputParams: [FilterParam(name: "inputAngle", type: .number, value: 0.0)]))
        add(Filter(
            filterName: "CILinearToSRGBToneCurve",
            categoryName: "CICategoryColorAdjustment",
            inputParams: []))
        add(Filter(
            filterName: "CISRGBToneCurveToLinear",
            categoryName: "CICategoryColorAdjustment",
            inputParams: []))
        add(Filter(
            filterName: "CITemperatureAndTint",
            categoryName: "CICategoryColorAdjustment",
            inputParams: [
                FilterParam(name: "inputNeutral", type: .vector, value: CIVector(cgPoint: CGPoint(x: 6500, y: 0))),
                FilterParam(name: "inputTargetNeutral", type: .vector, value: CIVector(cgPoint: CGPoint(x: 6500, y: 0)))
            ]))
        add(Filter(
            filterName: "CIVibrance",
            categoryName: "CICategoryColorAdjustment",
            inputParams: [FilterParam(name: "inputAmount", type: .number, value: 0.0)]))
        add(Filter(
            filterName: "CIWhitePointAdjust",
            categoryName: "CICategoryColorAdjustment",
            inputParams: [FilterParam(name: "inputColor", type: .color, value: CIColor(color: UIColor(red: 1, green: 1, blue: 1, alpha: 1)))]))
        add(Filter(
            filterName: "CIColorInvert",
            categoryName: "CICategoryColorEffect",
            inputParams: []))
        add(Filter(
            filterName: "CIFalseColor",
            categoryName: "CICategoryColorEffect",
            inputParams: [
                FilterParam(name: "inputColor0", type: .color, value: CIColor(color: UIColor(red: 0.4, green: 0, blue: 0, alpha: 1))),
                FilterParam(name: "inputColor1", type: .color, value: CIColor(color: UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)))]))
   }
    
    func add(_ filter: Filter) {
        filters.append(filter)
        
        if let category = filter.category {
            add(filter, inCategory: category)
        } else {
            add(filter, inCategory: "Unknown")
        }
    }
    
    private func add(_ filter: Filter, inCategory: String) {
        let array: [Filter]? = filters(inCategory: inCategory)
        if array != nil {
            filterMap[inCategory]?.append(filter)
        } else {
            filterMap[inCategory] = [filter]
        }
    }
    
    func categories() -> [String] {
        let keys = filterMap.keys
        let iter = keys.enumerated()
        var array: [String] = []
        iter.forEach { (ofset, category) in
            array.append(category)
        }
        return array
    }
    
    func filters(inCategory: String) -> [Filter]? {
        return filterMap[inCategory]
    }
    
    func filter(name: String) -> Filter? {
        for index in 0...filters.count-1 {
            if filters[index].name == name {
                return filters[index]
            }
        }
        return nil
    }
}
