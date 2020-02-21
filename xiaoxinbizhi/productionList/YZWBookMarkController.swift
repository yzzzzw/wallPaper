//
//  YZWBookMarkController.swift
//  fashionColor
//
//  Created by mac on 2019/7/5.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit
import TangramKit

class YZWBookMarkController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "textWallPaper".toLocalString()
        NotificationCenter.default.addObserver(self, selector: #selector(bookMarkRefresh), name: NSNotification.Name.init(rawValue: addBookMarkNotification), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let view = self.view as! YZWCardListView
        view.reloadCollectionView()
    }
    
    @objc func bookMarkRefresh() -> Void {
        let view = self.view as! YZWCardListView
        view.reloadCollectionView()
        view.lbTell.alpha = 0
        view.scrollViewDidEndDecelerating(view.collectionView)
    }
    
    override func loadView() {
        
        let view = YZWCardListView.aaqLayout()
        view.tg_insetsPaddingFromSafeArea = UIRectEdge.init()
        view.backgroundColor = UIColor.bgMainColor()
        self.view = view
        
//        view.colorBlock = { (color) in
//            self.view.backgroundColor = color.withAlphaComponent(0.6)
//        }
        
        let swipUp = UISwipeGestureRecognizer.init(target: self, action: #selector(upSwip))
        swipUp.direction = UISwipeGestureRecognizer.Direction.up
        view.addGestureRecognizer(swipUp)
        
        let swipDown = UISwipeGestureRecognizer.init(target: self, action: #selector(downSwip))
        swipDown.direction = UISwipeGestureRecognizer.Direction.down
        view.addGestureRecognizer(swipDown)
    }
    
    @objc func upSwip() {
        
    }
    
    @objc func downSwip() {
        
    }
    

}
