//
//  ASDTabbarController.swift
//  postcard
//
//  Created by mac on 2019/7/18.
//  Copyright © 2019 postcard. All rights reserved.
//

import UIKit

class ASDTabbarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    

}
