//
//  NSObject+yzw_object.swift
//  qingdanliebiao
//
//  Created by mac on 2019/7/25.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit

extension NSObject {
    
    func openSystem() {
        openUrl(str: UIApplication.openSettingsURLString)
    }
    
    func openPingFen() {
        openUrl(str: "tms-apps://itunes.apple.com/app/id" + APP_ID + "?action=write-review")
    }
    
    func openYingYong() {
        openUrl(str: NSString.getYingYongAddress())
    }
    
    func openYouJian() {
        openUrl(str: "mailto://" + APP_EMAIL)
    }
    
    func openDianHua() {
        openUrl(str: "tel://" + APP_PHONE)
    }
    
    func openDianHua(str: String) {
        openUrl(str: "tel://" + str)
    }
    
    func openUrl(str: String) {
        UIApplication.shared.open(URL.init(string: str)!, options: [ : ])
    }
    
    ///alert
    func setAlertCall(callBack:@escaping (String) -> Void) {
        let ctr = UIAlertController.init(title: "", message: "拨打电话联系老师", preferredStyle: .actionSheet)
        let camare = UIAlertAction.init(title: "联系", style: .default) { (camera) in
            callBack("联系")
        }

        let cancel = UIAlertAction.init(title: "取消", style: .cancel) { (cancel) in

        }

        ctr.addAction(camare)
        ctr.addAction(cancel)

        self.getCurrentController()?.present(ctr, animated: true, completion: {

        })

    }
    
    ///alert
    func setAlertCallBack(title: String, arr: [String], callBack:@escaping (Int, String) -> Void) {
        let ctr = UIAlertController.init(title: title, message: "", preferredStyle: .alert)
        
        for (idx, str) in arr.enumerated() {
            let action = UIAlertAction.init(title: str, style: .default) { (action) in
                callBack(idx, str)
            }
            ctr.addAction(action)
        }
        
        let cancel = UIAlertAction.init(title: "取消", style: .destructive, handler: nil)
        ctr.addAction(cancel)
        
        self.getCurrentController()?.present(ctr, animated: true, completion: {
            
        })
        
    }
    
    ///alert
    func setAlert(title: String, subTitle: String) {
        let ctr = UIAlertController.init(title: title, message: subTitle, preferredStyle: .alert)
        let sureAction = UIAlertAction.init(title: "知道了", style: .default)
        ctr.addAction(sureAction)
        self.getCurrentController()?.present(ctr, animated: true, completion: {
            
        })
        
    }
    
    ///获取当前控制器
    func getCurrentController() -> UIViewController? {
        guard let window = UIApplication.shared.windows.first else {
            return nil
        }
        var tempView: UIView?
        for subview in window.subviews.reversed() {
            if subview.classForCoder.description() == "UILayoutContainerView" {
                tempView = subview
                break
            }
        }
        
        if tempView == nil {
            tempView = window.subviews.last
        }
        
        var nextResponder = tempView?.next
        var next: Bool {
            return !(nextResponder is UIViewController) || nextResponder is UINavigationController || nextResponder is UITabBarController
        }
        
        while next{
            tempView = tempView?.subviews.first
            if tempView == nil {
                return nil
            }
            nextResponder = tempView!.next
        }
        return nextResponder as? UIViewController
    }
    
}
