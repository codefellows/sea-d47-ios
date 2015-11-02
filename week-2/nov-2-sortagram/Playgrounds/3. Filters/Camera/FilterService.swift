//
//  FilterService.swift
//  Camera
//
//  Created by Michael Babiy on 10/19/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

class FilterService {
    
    private class func setUpFilter(filterName : String, parameters : [String : AnyObject]?,  image : UIImage) -> UIImage? {
        
        let image = CIImage(image: image)
        let filter : CIFilter
        if let parameters = parameters {
            filter = CIFilter(name: filterName, withInputParameters: parameters)!
        } else {
            filter = CIFilter(name: filterName)!
        }
        
        filter.setValue(image, forKey: kCIInputImageKey)
        
        let options = [kCIContextWorkingColorSpace : NSNull()]
        let eaglContext = EAGLContext(API: EAGLRenderingAPI.OpenGLES2)
        let gpuContext = CIContext(EAGLContext: eaglContext, options: options)
        
        let outputImage = filter.outputImage
        let extent = outputImage!.extent
        let cgImage = gpuContext.createCGImage(outputImage!, fromRect: extent)
        let finalImage = UIImage(CGImage: cgImage)
        return finalImage
    }
    
    class func sepiaFilter(image : UIImage, completion: (filteredImage : UIImage?, name: String) -> Void){
        let filterName = "CISepiaTone"
        let displayName = "Sepia"
        
        if let finalImage = self.setUpFilter(filterName, parameters: nil, image: image) {
            completion(filteredImage: finalImage, name: displayName)
        }
    }
    
}
