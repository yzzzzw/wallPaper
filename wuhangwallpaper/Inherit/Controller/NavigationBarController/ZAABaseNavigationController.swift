//
//  ZAABaseNavigationController.swift
//  postcard
//
//  Created by mac on 2019/7/11.
//  Copyright © 2019 postcard. All rights reserved.
//

import UIKit
import Foundation

class ZAABaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.textMainColor(), NSAttributedString.Key.font: UIFont.font(size: 17)]
        self.navigationBar.barTintColor = UIColor.white
        
    }
    
    var isAnimated = false
    
    
    ///设置返回按钮属性
    var backBtn : UIButton = {
        let backBtn = UIButton(type:UIButton.ButtonType.custom)
        backBtn.setImage(UIImage.init(named: "icon_back"), for: .normal)
        backBtn.titleLabel?.isHidden = true
        backBtn.addTarget(self, action: #selector(backBtnAction), for: UIControl.Event.touchUpInside)
        backBtn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        backBtn.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40)
        return backBtn
    }()
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        self.isAnimated = animated
        
        if self.children.count > 0 {
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView:self.backBtn)
            viewController.hidesBottomBarWhenPushed = true
        }
        print(viewController.children)
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc func backBtnAction() {
        self.popViewController(animated: self.isAnimated)
    }

}
