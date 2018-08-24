//
//  Filter.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/21.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import CoreImage

class Filter: NSObject, NSCopying {
    var name: String?
    var category: String?
    var inputParams: [FilterParam] = []
    
    init(filterName: String, categoryName: String, inputParams: [FilterParam]) {
        super.init()
        self.name = filterName
        self.category = categoryName
        self.inputParams = inputParams
    }
    
    func filterName() -> String? {
        return CIFilter.localizedName(forFilterName: name!)
    }
    
    func categoryName() -> String {
        return CIFilter.localizedName(forCategory: category!)
    }
    
    func description() -> String? {
        return CIFilter.localizedDescription(forFilterName: name!)
    }
    
    func ciFilter(ciImage: CIImage) -> CIFilter? {
        guard let f = CIFilter(name: name!) else { return nil }
        if inputParams.count > 0 {
            for index in 0...inputParams.count-1 {
                let param = inputParams[index]
                f.setValue(param.value, forKey: param.name)
            }
        }
        f.setValue(ciImage, forKey: kCIInputImageKey)
        
        return f
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Filter(filterName: name!, categoryName: category!, inputParams: inputParams)
        return copy
    }
    
    func addInputParam(_ newParam: FilterParam) {
        if inputParams.count > 0 {
            for index in 0...inputParams.count - 1 {
                let param = inputParams[index]
                if param.name == newParam.name {
                    param.type = newParam.type
                    param.value = newParam.value
                    return
                }
            }
        }
        inputParams.append(newParam)
    }
    
    func inputParam(name: String) -> FilterParam? {
        if inputParams.count > 0 {
            for index in 0...inputParams.count - 1 {
                let param = inputParams[index]
                if param.name == name {
                    return param
                }
            }
        }
        return nil
    }
}

