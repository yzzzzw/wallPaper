//
//  UIViewController+asdController.swift
//  postcard
//
//  Created by mac on 2019/7/18.
//  Copyright © 2019 postcard. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func addTabbar(normalImageStr: String, selectedImageStr: String, title: String) {
        
        self.tabBarItem.image = UIImage.init(named: normalImageStr)
        self.tabBarItem.selectedImage = UIImage.init(named: selectedImageStr)
        self.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.textMainColor()], for: .selected)
        self.tabBarItem.title = title

    }
    
    /// 添加系统分析
    ///
    /// - Parameter arr: 可以是[string]，[image]
    func systemShare(arr: Array<Any>) {//系统分享
        let ctr = UIActivityViewController.init(activityItems: arr, applicationActivities: nil)
        self.present(ctr, animated: true, completion: nil)
    }
    
    
    
}
