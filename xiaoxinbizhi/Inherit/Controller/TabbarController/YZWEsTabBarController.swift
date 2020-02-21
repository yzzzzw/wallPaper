//
//  YZWEsTabBarController.swift
//  TemplateProject
//
//  Created by mac on 2019/8/29.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class YZWEsTabBarController: ESTabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.delegate = self
        shouldHijackHandler = {
            tabbarController, viewController, index in
            if index == 2 {
                return true
            }
            return false
        }
        didHijackHandler = {
            [weak tabBarController] tabbarController, viewController, index in

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.view.getCurrentController()?.present(AAQPreviewController.init(), animated: true, completion: nil)
            }
        }
        
        let eCtr = AAQColorListViewController.init()
        let eNavi = YZWBaseNavigationController.init(rootViewController: eCtr)
        eNavi.tabBarItem = ESTabBarItem.init(YZWIrregularityBasicContentView(), title: "color".toLocalString(), image: UIImage(named: "tabbar_color"), selectedImage: UIImage(named: "tabbar_color"))

        let hCtr = AAQFontListController.init()
        let hNavi = YZWBaseNavigationController.init(rootViewController: hCtr)
        hNavi.tabBarItem = ESTabBarItem.init(YZWIrregularityBasicContentView(), title: "font".toLocalString(), image: UIImage(named: "tabbar_font"), selectedImage: UIImage(named: "tabbar_font"))

        let fCtr = AAQPreviewController.init()
        let fNavi = YZWBaseNavigationController.init(rootViewController: fCtr)
        fNavi.tabBarItem = ESTabBarItem.init(YZWIrregularityContentView(), title: "", image: UIImage(named: "add_pic"), selectedImage: UIImage(named: "add_pic"))
        
        let oCtr = YZWBookMarkController.init()
        let oNavi = YZWBaseNavigationController.init(rootViewController: oCtr)
        oNavi.tabBarItem = ESTabBarItem.init(YZWIrregularityBasicContentView(), title: "production".toLocalString(), image: UIImage(named: "tabbar_collect"), selectedImage: UIImage(named: "tabbar_collect"))

        let aCtr = YZWAboutController.init()
        let aNavi = YZWBaseNavigationController.init(rootViewController: aCtr)
        aNavi.tabBarItem = ESTabBarItem.init(YZWIrregularityBasicContentView(), title: "about".toLocalString(), image: UIImage(named: "tabbar_mine"), selectedImage: UIImage(named: "tabbar_mine"))
        
//        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        viewControllers = [eNavi, hNavi, fNavi, oNavi, aNavi]
        
    }
    
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        if !ASDUSerInstance.share.isHasAccount() && tabBarController.children[0] != viewController {
//            self.view.getCurrentController()?.present(ASDLoginController.init()
//                , animated: true, completion: {
//                    
//            })
//            return false
//        }
//        
//        return true
//    }
    

}
