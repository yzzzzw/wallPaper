//
//  AAQAddBookMarkController.swift
//  fashionColor
//
//  Created by mac on 2019/7/6.
//  Copyright © 2019 bh. All rights reserved.
//

//MARK: 待定
import UIKit
import TangramKit

class AAQAddBookMarkController: UIViewController {
    
    var index = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.brown

        let swipBack = UISwipeGestureRecognizer.init(target: self, action: #selector(swipBackAction))
        swipBack.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipBack)
        
        
        
    }
    
    override func loadView() {
        
        let lineLayout = TGLinearLayout.init(.vert)
        lineLayout.tg_margin(0)
        lineLayout.tg_insetsPaddingFromSafeArea = UIRectEdge.init()
        self.view = lineLayout
        
        let tvTitle = UITextView.init()
        tvTitle.tg_margin(YZWMathSize.rate(rate: 70))
        tvTitle.backgroundColor = UIColor.white
        tvTitle.tg_height.equal(YZWMathSize.rate(rate: 100))
        tvTitle.tg_width.equal(.wrap)
        tvTitle.font = UIFont.fontRate(size: 14)
        tvTitle.tg_top.equal(YZWMathSize.rate(rate: 30))
        lineLayout.addSubview(tvTitle)
        
        weak var weakSelf = self
        //MARK: 背景颜色选择
        let vColorCollect = AAQColorCollectView.aaqColloectLayout()
        vColorCollect.tg_top.equal(YZWMathSize.rate(rate: 15))
        lineLayout.addSubview(vColorCollect)
        
        vColorCollect.colorCallBack = { (colorHex, index) in
            weakSelf!.view.backgroundColor = UIColor.hexadecimalColor(hexadecimal: colorHex)
            weakSelf!.index = index
        }
        
        let btnLineLayout = TGLinearLayout.init(.horz)
        btnLineLayout.tg_size(.wrap)
        btnLineLayout.tg_centerX.equal(0)
        btnLineLayout.tg_top.equal(YZWMathSize.rate(rate: 20))
        lineLayout.addSubview(btnLineLayout)
        
        let btnCeate = UIButton.init()
        btnCeate.tg_size(width: YZWMathSize.rate(rate: 60), height: YZWMathSize.rate(rate: 40))
        btnCeate.setTitle("生成", for: .normal)
        btnCeate.setTitleColor(UIColor.white, for: .normal)
        btnCeate.titleLabel?.font = UIFont.fontRate(size: 15)
        btnCeate.backgroundColor = UIColor.mainColor()
        btnCeate.addTarget(self, action: #selector(btnCreateAction), for: .touchUpInside)
        btnCeate.layer.cornerRadius = YZWMathSize.rate(rate: 6)
        btnLineLayout.addSubview(btnCeate)
        
        let btnPreview = UIButton.init()
        btnPreview.tg_size(width: YZWMathSize.rate(rate: 60), height: YZWMathSize.rate(rate: 40))
        btnPreview.tg_left.equal(YZWMathSize.rate(rate: 40))
        btnPreview.setTitle("预览", for: .normal)
        btnPreview.setTitleColor(UIColor.white, for: .normal)
        btnPreview.titleLabel?.font = UIFont.fontRate(size: 15)
        btnPreview.backgroundColor = UIColor.mainColor()
        btnPreview.addTarget(self, action: #selector(btnPreviewAction), for: .touchUpInside)
        btnPreview.layer.cornerRadius = YZWMathSize.rate(rate: 6)
        btnLineLayout.addSubview(btnPreview)
        
    }
    
    @objc func swipBackAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func btnCreateAction() {
        
        
    }
    
    @objc func btnPreviewAction() {
        let ctr = AAQPreviewController.init()
        ctr.index = self.index
        ctr.view.backgroundColor = self.view.backgroundColor
        self.navigationController?.pushViewController(ctr, animated: true)
    }
    
}
