//
//  AAQColorListViewController.swift
//  fashionColor
//
//  Created by mac on 2019/7/23.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit

class AAQColorListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "color".toLocalString()
        
//        let btnShare = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 40))
//        btnShare.setImage(UIImage.init(named: "lajitong"), for: .normal)
//        btnShare.addTarget(self, action: #selector(btnShareAction), for: .touchUpInside)
//        let itemShare = UIBarButtonItem.init(customView: btnShare)
//
//        self.navigationItem.rightBarButtonItems = [itemShare]
    }
    
//    @objc func btnShareAction() {
//        ZAAShareInstance.shareInstance.removeAllPostcardListImage()
//        let view = self.view as! ZAAPostcardView
//        view.reloadCollect()
//    }
    
    override func loadView() {
        let view = AAQColorListView.initialView()
        self.view = view
        
    }

    

}
