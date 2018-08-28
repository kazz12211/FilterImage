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
        add(Filter(
            filterName: "CIMaskToAlpha",
            categoryName: "CICategoryColorEffect",
            inputParams: []))
        add(Filter(
            filterName: "CIMinimumComponent",
            categoryName: "CICategoryColorEffect",
            inputParams: []))
        add(Filter(
            filterName: "CIMaximumComponent",
            categoryName: "CICategoryColorEffect",
            inputParams: []))
        add(Filter(
            filterName: "CIPhotoEffectChrome",
            categoryName: "CICategoryColorEffect",
            inputParams: []))
        add(Filter(
            filterName: "CIPhotoEffectFade",
            categoryName: "CICategoryColorEffect",
            inputParams: []))
        add(Filter(
            filterName: "CIPhotoEffectInstant",
            categoryName: "CICategoryColorEffect",
            inputParams: []))
        add(Filter(
            filterName: "CIPhotoEffectMono",
            categoryName: "CICategoryColorEffect",
            inputParams: []))
        add(Filter(
            filterName: "CIPhotoEffectNoir",
            categoryName: "CICategoryColorEffect",
            inputParams: []))
        add(Filter(
            filterName: "CIPhotoEffectProcess",
            categoryName: "CICategoryColorEffect",
            inputParams: []))
        add(Filter(
            filterName: "CIPhotoEffectTonal",
            categoryName: "CICategoryColorEffect",
            inputParams: []))
        add(Filter(
            filterName: "CIPhotoEffectTransfer",
            categoryName: "CICategoryColorEffect",
            inputParams: []))
        add(Filter(
            filterName: "CISepiaTone",
            categoryName: "CICategoryColorEffect",
            inputParams: [FilterParam(name: "inputIntensity", type: .number, value: 1.0)]))
        add(Filter(
            filterName: "CIVignette",
            categoryName: "CICategoryColorEffect",
            inputParams: [
                FilterParam(name: "inputRadius", type: .number, value: 1.0),
                FilterParam(name: "inputIntensity", type: .number, value: 0.0)]))
        add(Filter(
            filterName: "CIVignetteEffect",
            categoryName: "CICategoryColorEffect",
            inputParams: [
                FilterParam(name: "inputCenter", type: .vector, value: CIVector(cgPoint: CGPoint(x: 150, y: 150))),
                FilterParam(name: "inputRadius", type: .number, value: 1.0),
                FilterParam(name: "inputIntensity", type: .number, value: 0.0)]))
        add(Filter(
            filterName: "CISharpenLuminance",
            categoryName: "CICategorySharpen",
            inputParams: [FilterParam(name: "inputSharpness", type: .number, value: 0.4)])) // 0 - 2
        add(Filter(
            filterName: "CIUnsharpMask",
            categoryName: "CICategorySharpen",
            inputParams: [
                FilterParam(name: "inputRadius", type: .number, value: 2.5),    // 0 - 100
                FilterParam(name: "inputIntensity", type: .number, value: 0.5)])) // 0 - 1
        add(Filter(
            filterName: "CIColorMatrix",
            categoryName: "CICategoryColorAdjustment",
            inputParams: [
                FilterParam(name: "inputRVector", type: .vector, value: CIVector(cgRect: CGRect(x: 1, y: 0, width: 0, height: 0))),
                FilterParam(name: "inputGVector", type: .vector, value: CIVector(cgRect: CGRect(x: 0, y: 1, width: 0, height: 0))),
                FilterParam(name: "inputBVector", type: .vector, value: CIVector(cgRect: CGRect(x: 0, y: 0, width: 1, height: 0))),
                FilterParam(name: "inputAVector", type: .vector, value: CIVector(cgRect: CGRect(x: 0, y: 0, width: 0, height: 1))),
                FilterParam(name: "inputBiasVector", type: .vector, value: CIVector(cgRect: CGRect(x: 0, y: 0, width: 0, height: 0)))
            ])
        )
        add(Filter(
            filterName: "CIColorPolynomial",
            categoryName: "CICategoryColorAdjustment",
            inputParams: [
                FilterParam(name: "inputRedCoefficients", type: .vector, value: CIVector(cgRect: CGRect(x: 0, y: 1, width: 0, height: 0))),
                FilterParam(name: "inputGreenCoefficients", type: .vector, value: CIVector(cgRect: CGRect(x: 0, y: 1, width: 0, height: 0))),
                FilterParam(name: "inputBlueCoefficients", type: .vector, value: CIVector(cgRect: CGRect(x: 0, y: 1, width: 0, height: 0))),
                FilterParam(name: "inputAlphaCoefficients", type: .vector, value: CIVector(cgRect: CGRect(x: 0, y: 1, width: 0, height: 0)))
            ])
        )
        add(Filter(
            filterName: "CIComicEffect",
            categoryName: "CICategoryStylize",
            inputParams: []))
        add(Filter(
            filterName: "CICrystallize",
            categoryName: "CICategoryStylize",
            inputParams: [
                FilterParam(name: "inputCenter", type: .vector, value: CIVector(cgPoint: CGPoint(x: 150, y: 150))),
                FilterParam(name: "inputRadius", type: .number, value: 20.0)
            ]))
        add(Filter(
            filterName: "CIEdges",
            categoryName: "CICategoryStylize",
            inputParams: [
                FilterParam(name: "inputIntensity", type: .number, value: 1.0)
            ]))
        add(Filter(
            filterName: "CIEdgeWork",
            categoryName: "CICategoryStylize",
            inputParams: [
                FilterParam(name: "inputRadius", type: .number, value: 3.0)
            ]))
        add(Filter(
            filterName: "CIHeightFieldFromMask",
            categoryName: "CICategoryStylize",
            inputParams: [
                FilterParam(name: "inputRadius", type: .number, value: 10.0)
            ]))
        add(Filter(
            filterName: "CIHexagonalPixellate",
            categoryName: "CICategoryStylize",
            inputParams: [
                FilterParam(name: "inputCenter", type: .vector, value: CIVector(cgPoint: CGPoint(x: 150, y: 150))),
                FilterParam(name: "inputScale", type: .number, value: 8.0)
            ]))
        add(Filter(
            filterName: "CIPixellate",
            categoryName: "CICategoryStylize",
            inputParams: [
                FilterParam(name: "inputCenter", type: .vector, value: CIVector(cgPoint: CGPoint(x: 150, y: 150))),
                FilterParam(name: "inputScale", type: .number, value: 8.0)
            ]))
        add(Filter(
            filterName: "CIHighlightShadowAdjust",
            categoryName: "CICategoryStylize",
            inputParams: [
                FilterParam(name: "inputHighlightAmount", type: .number, value: 1.0),
                FilterParam(name: "inputShadowAmount", type: .number, value: 0)
            ]))
        add(Filter(
            filterName: "CILineOverlay",
            categoryName: "CICategoryStylize",
            inputParams: [
                FilterParam(name: "inputNRNoiseLevel", type: .number, value: 0.07),
                FilterParam(name: "inputNRSharpness", type: .number, value: 0.71),
                FilterParam(name: "inputEdgeIntensity", type: .number, value: 1.0),
                FilterParam(name: "inputThreshold", type: .number, value: 0.0),
                FilterParam(name: "inputContrast", type: .number, value: 50)
            ]))
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
        array.sort()
        return array
    }
    
    func filters(inCategory: String) -> [Filter]? {
        return filterMap[inCategory]?.sorted(by: { (f1, f2) -> Bool in
            return f1.name!.compare(f2.name!) == ComparisonResult.orderedAscending
        })
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
