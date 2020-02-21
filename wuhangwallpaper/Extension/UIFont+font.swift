//
//  UIFont+aaqFont.swift
//  fashionColor
//
//  Created by mac on 2019/7/5.
//  Copyright © 2019 bh. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    //PingFangHK-Ultralight
    
    //字体根据屏幕调整大小
    class func fontRate(fontName: String, size: CGFloat) -> UIFont {
        return UIFont.init(name: fontName, size: size * aaqScreenRate)!
    }
    
    class func font(fontName: String, size: CGFloat) -> UIFont {
        return UIFont.init(name: fontName, size: size * aaqScreenRate)!
    }
    
    //字体根据屏幕调整大小
    class func fontRate(size: CGFloat) -> UIFont {
//        return UIFont.systemFont(ofSize: size * aaqScreenRate)
        return fontRate(fontName: "Georgia-Bold", size: size * aaqScreenRate)
    }
    
    //字体随屏幕适配
    class func font(size: CGFloat) -> UIFont {
        return font(fontName: "Georgia-Bold", size: size)
    }
    
}
