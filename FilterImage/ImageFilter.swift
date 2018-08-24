//
//  ImageFilter.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/20.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit
import CoreImage

class ImageFilter: NSObject {
    
    var filter: Filter?
    
    func filter(_ image: UIImage) -> UIImage {
        guard let f = filter else { return image }
        let context = CIContext()
        guard let ciImage = CIImage(image: image) else { return image }
        guard let filter = f.ciFilter(ciImage: ciImage) else { return image }
        guard let result = filter.outputImage else { return image }
        guard let newImage = context.createCGImage(result, from: result.extent) else { return image }
        return UIImage(cgImage: newImage)
    }
    
}
