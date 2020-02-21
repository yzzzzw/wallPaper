//
//  AAQColorSingle.swift
//  fashionColor
//
//  Created by mac on 2019/7/6.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit

class AAQColorSingle: NSObject {
    
    let infoKey = "infoKey"
    
    var arrInfo = Array<String>()
    
     static let shareInstance = AAQColorSingle()
    
    func getInfo() -> Array<String> {
        if UserDefaults.standard.object(forKey: infoKey) == nil {
            self.arrInfo = []
//                [
//                UIImage.init(named: "temp1")?.pngData()?.base64EncodedString(),
//                UIImage.init(named: "temp2")?.pngData()?.base64EncodedString(),
//                UIImage.init(named: "temp3")?.pngData()?.base64EncodedString(),
//                UIImage.init(named: "temp4")?.pngData()?.base64EncodedString()] as! [String]
        } else {
            self.arrInfo = UserDefaults.standard.object(forKey: infoKey) as! [String]
        }
        return self.arrInfo
    }
    
    func saveBookMark(str: String) {
        self.arrInfo.insert(str, at: 0)
        UserDefaults.standard.set(self.arrInfo, forKey: infoKey)
    }
    
    func replaceBookMark(str: String, index: Int) {
        self.arrInfo[index] = str
        UserDefaults.standard.set(self.arrInfo, forKey: infoKey)
    }
    
    func removeMark(index: Int) {
        self.arrInfo.remove(at: index)
        UserDefaults.standard.set(self.arrInfo, forKey: infoKey)
    }

}
