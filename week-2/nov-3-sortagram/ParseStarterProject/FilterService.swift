//
//  FilterService.swift
//  Day1PhotoFilter
//
//  Created by Adam Wallraff on 10/19/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.

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
        
        //gpu context
        //copied from lecture
        let options = [kCIContextWorkingColorSpace : NSNull()]
        let eaglContext = EAGLContext(API: EAGLRenderingAPI.OpenGLES2)
        let gpuContext = CIContext(EAGLContext: eaglContext, options: options)
        
        //More from Lecture
        //Get final Image using GPU Rendering
        let outputImage = filter.outputImage
        let extent = outputImage!.extent
        let cgImage = gpuContext.createCGImage(outputImage!, fromRect: extent)
        let finalImage = UIImage(CGImage: cgImage)
        return finalImage
    }
    
    class func applyVintageEffect(image : UIImage, completion: (filteredImage : UIImage?, name: String) -> Void){
        let filterName = "CIPhotoEffectTransfer"
        let displayName = "Vintage"
        
        if let finalImage = self.setUpFilter(filterName, parameters: nil, image: image) {
            completion(filteredImage: finalImage, name: displayName)
        }
    }
    
    class func applyBWEffect(image : UIImage, completion: (filteredImage : UIImage?, name: String) -> Void){
        let filterName = "CIPhotoEffectMono"
        let displayName = "B&W"
        
        if let finalImage = self.setUpFilter(filterName, parameters: nil, image: image) {
            completion(filteredImage: finalImage, name: displayName)
        }
    }
    
    class func applyChromeEffect(image : UIImage, completion: (filteredImage : UIImage?, name: String) -> Void){
        let filterName = "CIPhotoEffectChrome"
        let displayName = "Chrome"
        
        if let finalImage = self.setUpFilter(filterName, parameters: nil, image: image) {
            completion(filteredImage: finalImage, name: displayName)
        }
    }
    
}



