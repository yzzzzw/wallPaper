//
//  UIImage+aaqImage.swift
//  fashionColor
//
//  Created by mac on 2019/7/10.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit

extension UIImage {

//    + (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)maskImage {
//
//    CGImageRef maskRef = maskImage.CGImage;
//
//    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
//    CGImageGetHeight(maskRef),
//    CGImageGetBitsPerComponent(maskRef),
//    CGImageGetBitsPerPixel(maskRef),
//    CGImageGetBytesPerRow(maskRef),
//    CGImageGetDataProvider(maskRef), NULL, false);
//
//
//    CGImageRef masked = CGImageCreateWithMask([image CGImage], mask);
//    CGImageRelease(mask);
//    UIImage *maskedImage = [UIImage imageWithCGImage:masked ];
//    CGImageRelease(masked);
//    return maskedImage;
//    }
    
    
//    class func maskImage(image: UIImage, maskImage: UIImage) -> UIImage {
//        let maskRef = maskImage.cgImage!
//        let mask = CGImage.init(maskWidth: maskRef.width, height: maskRef.height, bitsPerComponent: maskRef as! Int, bitsPerPixel: maskRef as! Int, bytesPerRow: maskRef as! Int, provider: (maskRef.dataProvider)!, decode: nil, shouldInterpolate: false)
//
//
//        let masked = image.cgImage?.masking(mask!)
//        let maskedImage = UIImage.init(cgImage: masked!)
//        return maskedImage
//    }

    class func imageFrom(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
