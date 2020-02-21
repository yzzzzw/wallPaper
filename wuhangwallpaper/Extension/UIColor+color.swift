//
//  UIColor+aaqColor.swift
//  fashionColor
//
//  Created by mac on 2019/7/5.
//  Copyright © 2019 bh. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    ///16进制颜色
    class func hexadecimalColor(hexadecimal:String) -> UIColor {
        var cstr = hexadecimal.trimmingCharacters(in:  CharacterSet.whitespacesAndNewlines).uppercased() as NSString;
        if(cstr.length < 6){
            return UIColor.clear;
        }
        if(cstr.hasPrefix("0X")){
            cstr = cstr.substring(from: 2) as NSString
        }
        if(cstr.hasPrefix("#")){
            cstr = cstr.substring(from: 1) as NSString
        }
        if(cstr.length != 6){
            return UIColor.clear;
        }
        var range = NSRange.init()
        range.location = 0
        range.length = 2
        //r
        let rStr = cstr.substring(with: range);
        //g
        range.location = 2;
        let gStr = cstr.substring(with: range)
        //b
        range.location = 4;
        let bStr = cstr.substring(with: range)
        var r :UInt32 = 0x0;
        var g :UInt32 = 0x0;
        var b :UInt32 = 0x0;
        Scanner.init(string: rStr).scanHexInt32(&r);
        Scanner.init(string: gStr).scanHexInt32(&g);
        Scanner.init(string: bStr).scanHexInt32(&b);
        return UIColor.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1)
    }
    
    ///主色调
    class func mainColor() -> UIColor {
        return UIColor.hexadecimalColor(hexadecimal: "e08b30")
    }
    
    ///字的主颜色
    class func textMainColor() -> UIColor {
        return UIColor.hexadecimalColor(hexadecimal: "803d20")
    }
    
    ///背景色
    class func bgMainColor() -> UIColor {
        return UIColor.hexadecimalColor(hexadecimal: "d1c6bf")
    }
    
    ///主黑色
    class func mainBlackColor() -> UIColor {
        return UIColor.hexadecimalColor(hexadecimal: "333333")
    }
    
    ///主灰色
    class func mainGrayColor() -> UIColor {
        return UIColor.hexadecimalColor(hexadecimal: "#CCCCCC")
    }
    
    ///颜色列表
    class func colorList() -> Array<Dictionary<String, String>> {
        return [["textColor": "#000000", "title": "蔚蓝", "color": "#70f3ff"],
                ["textColor": "#000000", "title": "蓝", "color": "#44cef6"],
                ["textColor": "#000000", "title": "碧蓝", "color": "#3eede7"],
                ["textColor": "#ffffff", "title": "石青", "color": "#1685a9"],
                ["textColor": "#ffffff", "title": "靛青", "color": "#177cb0"],
                ["textColor": "#ffffff", "title": "靛蓝", "color": "#065279"],
                ["textColor": "#ffffff", "title": "花青", "color": "#003472"],
                ["textColor": "#ffffff", "title": "宝蓝", "color": "#4b5cc4"],
                ["textColor": "#ffffff", "title": "蓝灰色", "color": "#a1afc9"],
                ["textColor": "#ffffff", "title": "藏青", "color": "#2e4e7e"],
                ["textColor": "#ffffff", "title": "藏蓝", "color": "#3b2e7e"],
                ["textColor": "#000000", "title": "精白", "color": "#ffffff"],
                ["textColor": "#000000", "title": "银白", "color": "#e9e7ef"],
                ["textColor": "#000000", "title": "铅白", "color": "#f0f0f4"],
                ["textColor": "#000000", "title": "霜色", "color": "#e9f1f6"],
                ["textColor": "#000000", "title": "雪白", "color": "#f0fcff"],
                ["textColor": "#000000", "title": "莹白", "color": "#e3f9fd"],
                ["textColor": "#000000", "title": "月白", "color": "#d6ecf0"],
                ["textColor": "#000000", "title": "象牙白", "color": "#fffbf0"],
                ["textColor": "#000000", "title": "缟", "color": "#f2ecde"],
                ["textColor": "#000000", "title": "鱼肚白", "color": "#fcefe8"],
                ["textColor": "#000000", "title": "白粉", "color": "#fff2df"],
                ["textColor": "#000000", "title": "荼白", "color": "#f3f9f1"],
                ["textColor": "#000000", "title": "鸭卵青", "color": "#e0eee8"],
                ["textColor": "#000000", "title": "素", "color": "#e0f0e9"],
                ["textColor": "#000000", "title": "青白", "color": "#c0ebd7"],
                ["textColor": "#000000", "title": "蟹壳青", "color": "#bbcdc5"],
                ["textColor": "#000000", "title": "花白", "color": "#c2ccd0"],
                ["textColor": "#000000", "title": "老银", "color": "#bacac6"],
                ["textColor": "#ffffff", "title": "灰色", "color": "#808080"],
                ["textColor": "#ffffff", "title": "苍色", "color": "#75878a"],
                ["textColor": "#ffffff", "title": "水色", "color": "#88ada6"],
                ["textColor": "#ffffff", "title": "黝", "color": "#6b6882"],
                ["textColor": "#ffffff", "title": "乌色", "color": "#725e82"],
                ["textColor": "#ffffff", "title": "玄青", "color": "#3d3b4f"],
                ["textColor": "#ffffff", "title": "乌黑", "color": "#392f41"],
                ["textColor": "#ffffff", "title": "黎", "color": "#75664d"],
                ["textColor": "#ffffff", "title": "黧", "color": "#5d513c"],
                ["textColor": "#ffffff", "title": "黝黑", "color": "#665757"],
                ["textColor": "#ffffff", "title": "缁色", "color": "#493131"],
                ["textColor": "#ffffff", "title": "煤黑", "color": "#312520"],
                ["textColor": "#ffffff", "title": "漆黑", "color": "#161823"],
                ["textColor": "#ffffff", "title": "黑色", "color": "#000000"],
                ["textColor": "#ffffff", "title": "黛", "color": "#4a4266"],
                ["textColor": "#ffffff", "title": "黛绿", "color": "#426666"],
                ["textColor": "#ffffff", "title": "黛蓝", "color": "#425066"],
                ["textColor": "#ffffff", "title": "黛紫", "color": "#574266"],
                ["textColor": "#ffffff", "title": "紫色", "color": "#8d4bbb"],
                ["textColor": "#ffffff", "title": "紫酱", "color": "#815463"],
                ["textColor": "#ffffff", "title": "酱紫", "color": "#815476"],
                ["textColor": "#ffffff", "title": "紫檀", "color": "#4c221b"],
                ["textColor": "#ffffff", "title": "绀青", "color": "#003371"],
                ["textColor": "#ffffff", "title": "紫棠", "color": "#56004f"],
                ["textColor": "#ffffff", "title": "青莲", "color": "#801dae"],
                ["textColor": "#ffffff", "title": "群青", "color": "#4c8dae"],
                ["textColor": "#000000", "title": "雪青", "color": "#b0a4e3"],
                ["textColor": "#000000", "title": "丁香色", "color": "#cca4e3"],
                ["textColor": "#000000", "title": "藕色", "color": "#edd1d8"],
                ["textColor": "#000000", "title": "藕荷色", "color": "#e4c6d0"],
                ["textColor": "#ffffff", "title": "朱砂", "color": "#ff461f"],
                ["textColor": "#ffffff", "title": "火红", "color": "#ff2d51"],
                ["textColor": "#ffffff", "title": "朱膘", "color": "#f36838"],
                ["textColor": "#ffffff", "title": "妃色", "color": "#ed5736"],
                ["textColor": "#ffffff", "title": "洋红", "color": "#ff4777"],
                ["textColor": "#ffffff", "title": "品红", "color": "#f00056"],
                ["textColor": "#ffffff", "title": "粉红", "color": "#ffb3a7"],
                ["textColor": "#ffffff", "title": "桃红", "color": "#f47983"],
                ["textColor": "#ffffff", "title": "海棠红", "color": "#db5a6b"],
                ["textColor": "#ffffff", "title": "樱桃色", "color": "#c93756"],
                ["textColor": "#ffffff", "title": "酡颜", "color": "#f9906f"],
                ["textColor": "#ffffff", "title": "银红", "color": "#f05654"],
                ["textColor": "#ffffff", "title": "大红", "color": "#ff2121"],
                ["textColor": "#ffffff", "title": "石榴红", "color": "#f20c00"],
                ["textColor": "#ffffff", "title": "绛紫", "color": "#8c4356"],
                ["textColor": "#ffffff", "title": "绯红", "color": "#c83c23"],
                ["textColor": "#ffffff", "title": "胭脂", "color": "#9d2933"],
                ["textColor": "#ffffff", "title": "朱红", "color": "#ff4c00"],
                ["textColor": "#ffffff", "title": "丹", "color": "#ff4e20"],
                ["textColor": "#ffffff", "title": "彤", "color": "#f35336"],
                ["textColor": "#ffffff", "title": "酡红", "color": "#dc3023"],
                ["textColor": "#ffffff", "title": "炎", "color": "#ff3300"],
                ["textColor": "#ffffff", "title": "茜色", "color": "#cb3a56"],
                ["textColor": "#ffffff", "title": "绾", "color": "#a98175"],
                ["textColor": "#ffffff", "title": "檀", "color": "#b36d61"],
                ["textColor": "#ffffff", "title": "嫣红", "color": "#ef7a82"],
                ["textColor": "#ffffff", "title": "洋红", "color": "#ff0097"],
                ["textColor": "#ffffff", "title": "枣红", "color": "#c32136"],
                ["textColor": "#ffffff", "title": "殷红", "color": "#be002f"],
                ["textColor": "#ffffff", "title": "赫赤", "color": "#c91f37"],
                ["textColor": "#ffffff", "title": "银朱", "color": "#bf242a"],
                ["textColor": "#ffffff", "title": "赤", "color": "#c3272b"],
                ["textColor": "#ffffff", "title": "胭脂", "color": "#9d2933"],
                ["textColor": "#ffffff", "title": "栗色", "color": "#60281e"],
                ["textColor": "#ffffff", "title": "玄色", "color": "#622a1d"],
                ["textColor": "#000000", "title": "松花色", "color": "#bce672"],
                ["textColor": "#000000", "title": "柳黄", "color": "#c9dd22"],
                ["textColor": "#000000", "title": "嫩绿", "color": "#bddd22"],
                ["textColor": "#000000", "title": "柳绿", "color": "#afdd22"],
                ["textColor": "#000000", "title": "葱黄", "color": "#a3d900"],
                ["textColor": "#000000", "title": "葱绿", "color": "#9ed900"],
                ["textColor": "#000000", "title": "豆绿", "color": "#9ed048"],
                ["textColor": "#000000", "title": "豆青", "color": "#96ce54"],
                ["textColor": "#000000", "title": "油绿", "color": "#00bc12"],
                ["textColor": "#000000", "title": "葱倩", "color": "#0eb83a"],
                ["textColor": "#000000", "title": "葱青", "color": "#0eb83a"],
                ["textColor": "#000000", "title": "青葱", "color": "#0aa344"],
                ["textColor": "#ffffff", "title": "石绿", "color": "#16a951"],
                ["textColor": "#ffffff", "title": "松柏绿", "color": "#21a675"],
                ["textColor": "#ffffff", "title": "松花绿", "color": "#057748"],
                ["textColor": "#ffffff", "title": "绿沈", "color": "#0c8918"],
                ["textColor": "#000000", "title": "绿色", "color": "#00e500"],
                ["textColor": "#000000", "title": "草绿", "color": "#40de5a"],
                ["textColor": "#000000", "title": "青翠", "color": "#00e079"],
                ["textColor": "#000000", "title": "青色", "color": "#00e09e"],
                ["textColor": "#000000", "title": "翡翠色", "color": "#3de1ad"],
                ["textColor": "#000000", "title": "碧绿", "color": "#2add9c"],
                ["textColor": "#000000", "title": "玉色", "color": "#2edfa3"],
                ["textColor": "#000000", "title": "缥", "color": "#7fecad"],
                ["textColor": "#000000", "title": "艾绿", "color": "#a4e2c6"],
                ["textColor": "#000000", "title": "石青", "color": "#7bcfa6"],
                ["textColor": "#000000", "title": "碧色", "color": "#1bd1a5"],
                ["textColor": "#000000", "title": "青碧", "color": "#48c0a3"],
                ["textColor": "#000000", "title": "铜绿", "color": "#549688"],
                ["textColor": "#000000", "title": "竹青", "color": "#789262"],
                ["textColor": "#ffffff", "title": "墨灰", "color": "#758a99"],
                ["textColor": "#ffffff", "title": "墨色", "color": "#50616d"],
                ["textColor": "#ffffff", "title": "鸦青", "color": "#424c50"],
                ["textColor": "#ffffff", "title": "黯", "color": "#41555d"],
                ["textColor": "#000000", "title": "樱草色", "color": "#eaff56"],
                ["textColor": "#000000", "title": "鹅黄", "color": "#fff143"],
                ["textColor": "#000000", "title": "鸭黄", "color": "#faff72"],
                ["textColor": "#000000", "title": "杏黄", "color": "#ffa631"],
                ["textColor": "#ffffff", "title": "橙黄", "color": "#ffa400"],
                ["textColor": "#ffffff", "title": "橙色", "color": "#fa8c35"],
                ["textColor": "#000000", "title": "杏红", "color": "#ff8c31"],
                ["textColor": "#000000", "title": "橘黄", "color": "#ff8936"],
                ["textColor": "#000000", "title": "橘红", "color": "#ff7500"],
                ["textColor": "#000000", "title": "藤黄", "color": "#ffb61e"],
                ["textColor": "#000000", "title": "姜黄", "color": "#ffc773"],
                ["textColor": "#000000", "title": "雌黄", "color": "#ffc64b"],
                ["textColor": "#000000", "title": "赤金", "color": "#f2be45"],
                ["textColor": "#000000", "title": "缃色", "color": "#f0c239"],
                ["textColor": "#000000", "title": "雄黄", "color": "#e9bb1d"],
                ["textColor": "#000000", "title": "秋香色", "color": "#d9b611"],
                ["textColor": "#000000", "title": "金色", "color": "#eacd76"],
                ["textColor": "#000000", "title": "牙色", "color": "#eedeb0"],
                ["textColor": "#000000", "title": "枯黄", "color": "#d3b17d"],
                ["textColor": "#ffffff", "title": "黄栌", "color": "#e29c45"],
                ["textColor": "#000000", "title": "乌金", "color": "#a78e44"],
                ["textColor": "#ffffff", "title": "昏黄", "color": "#c89b40"],
                ["textColor": "#ffffff", "title": "棕黄", "color": "#ae7000"],
                ["textColor": "#ffffff", "title": "琥珀", "color": "#ca6924"],
                ["textColor": "#ffffff", "title": "棕色", "color": "#b25d25"],
                ["textColor": "#ffffff", "title": "茶色", "color": "#b35c44"],
                ["textColor": "#ffffff", "title": "棕红", "color": "#9b4400"],
                ["textColor": "#ffffff", "title": "赭", "color": "#9c5333"],
                ["textColor": "#ffffff", "title": "驼色", "color": "#a88462"],
                ["textColor": "#ffffff", "title": "秋色", "color": "#896c39"],
                ["textColor": "#ffffff", "title": "棕绿", "color": "#827100"],
                ["textColor": "#ffffff", "title": "褐色", "color": "#6e511e"],
                ["textColor": "#ffffff", "title": "棕黑", "color": "#7c4b00"],
                ["textColor": "#ffffff", "title": "赭色", "color": "#955539"],
                ["textColor": "#ffffff", "title": "赭石", "color": "#845a33"]]
    }
    
    
}
