//
//  AAQFontListController.swift
//  fashionColor
//
//  Created by mac on 2019/8/13.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit

class AAQFontListController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "font".toLocalString()
        
    }
    
    override func loadView() {
        let view = AAQFontListView.initialView()
        self.view = view
        
    }
    

}
