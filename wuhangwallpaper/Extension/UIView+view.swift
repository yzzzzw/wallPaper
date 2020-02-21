//
//  UIView+aaqView.swift
//  fashionColor
//
//  Created by mac on 2019/7/6.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit

extension UIView {
//
//    func colorOfPoint (point: CGPoint) -> UIColor
//    {
//        var pixel = UnsafePointer<CUnsignedChar>.
//        let colorSpace = CGColorSpaceCreateDeviceRGB()
//        let bitmapInfo = CGBitmapInfo.init(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
//        let context = CGBitmapContextCreate(pixel, 1, 1, 8, 4, colorSpace, bitmapInfo)
//
//        CGContextTranslateCTM(context, -point.x, -point.y)
//
//        self.layer.renderInContext(context)
//
//        CGContextRelease(context)
////        CGColorSpaceRelease(colorSpace)
//            CGColorSpace.inire
//        return UIColor(red: Float(pixel [0]) / 255.0, green: Float (pixel [1]) / 255.0, blue: Float (pixel [2]) / 255.0 , alpha: Float (pixel [3]) / 255.0)
//    }
    
    ///阴影
    func layerShadow() {
        self.addLayerShadow(color: UIColor.gray, offSet: CGSize.init(width: 3, height: 3))
    }
    
    ///阴影核心
    func addLayerShadow(color: UIColor, offSet: CGSize) {
        self.layer.shadowOffset = offSet
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1.0
    }
    
    ///切指定圆角，核心代码
    func cornerRadius(value: CGFloat) {
        self.layer.cornerRadius = value
        self.layer.masksToBounds = true
    }
    
    func cornerRadiusRate(value: CGFloat) {
        self.layer.cornerRadius = value * aaqScreenRate
        self.layer.masksToBounds = true
    }
    
    ///切圆角
    func cornerRadiusRound() {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.masksToBounds = true
    }
    
    ///画边框实线
    func borderRealLine() {
        self.addborderLine(color: UIColor.mainColor(), width: 1)
    }
    
    ///画边框实线核心代码
    func addborderLine(color: UIColor, width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    ///画边框虚线
    func borderImaginaryLine() -> CAShapeLayer {
        return self.addBorderDottedLine(rect: self.bounds,
                                        corneradius: 0,
                                        strokeColor: UIColor.textMainColor(),
                                        fillColor: nil,
                                        lineWidth: 1.0,
                                        lineCap: CAShapeLayerLineCap.square,
                                        lineDashPattern: [NSNumber.init(value: 6), NSNumber.init(value: 3)])
    }
    
    ///核心代码
    ///添加视图的边框虚线
    func addBorderDottedLine(rect: CGRect, corneradius: CGFloat, strokeColor: UIColor, fillColor: UIColor?, lineWidth: CGFloat, lineCap: CAShapeLayerLineCap, lineDashPattern: [NSNumber]) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer.init()
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.fillColor = fillColor == nil ? UIColor.clear.cgColor : fillColor?.cgColor
        shapeLayer.path = UIBezierPath.init(roundedRect: self.bounds, cornerRadius: corneradius).cgPath
        shapeLayer.frame = rect
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineCap = lineCap
        shapeLayer.lineDashPattern = lineDashPattern
        return shapeLayer
    }

    var capture: UIImage? {
        
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(self.frame.size)
        do {
            
            UIGraphicsBeginImageContextWithOptions(CGSize(width: self.frame.size.width, height: self.frame.size.height), false, 0.0)
            
            self.layer.render(in: UIGraphicsGetCurrentContext()!)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        if image != nil {
            return image!
        }
        return nil
        
    }
    
    ///获取当前视图所在导航控制器
    func currentNavViewController() -> UINavigationController? {
        var n = next
        while n != nil {
            if n is UINavigationController {
                return n as? UINavigationController
            }
            n = n?.next
        }
        return nil
    }

}
