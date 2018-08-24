//
//  FilterParam.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/21.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import Foundation

enum ParamType: Int {
    case string = 0
    case number = 1
    case vector = 2
    case color = 3
    case image = 4
    
}

class FilterParam: NSObject {
    var name: String = ""
    var type: ParamType = .string
    var value: Any?
    
    init(name: String, type: ParamType, value: Any?) {
        super.init()
        self.name = name
        self.type = type
        self.value = value
    }
    
}
