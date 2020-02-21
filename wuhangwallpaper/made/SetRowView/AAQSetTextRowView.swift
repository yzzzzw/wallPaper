//
//  AAQSetTextRowView.swift
//  fashionColor
//
//  Created by mac on 2019/7/10.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit
import TangramKit

typealias AAQSetTextRowViewBlock = (Int) -> Void
class AAQSetTextRowView: TGLinearLayout {
    
    var btnLast = UIButton.init()
    var settingTextRowBlock : AAQSetTextRowViewBlock?
    
    class func initSettingTextRow(arr: Array<String>, strTitle: String) -> AAQSetTextRowView {
        let view = AAQSetTextRowView.init(.vert)
        view.tg_size(.wrap)
        view.createSettingTextRow(arr: arr, strTitle: strTitle)
        return view
    }
    
    func createSettingTextRow(arr: Array<String>, strTitle: String) -> Void {
        
        let lbTitle = UILabel.init()
        lbTitle.text = strTitle
        lbTitle.font = UIFont.fontRate(size: 19)
        lbTitle.textColor = UIColor.mainColor()
        lbTitle.textAlignment = .left
        lbTitle.tg_height.equal(YZWMathSize.rate(rate: 40))
        lbTitle.tg_width.equal(.wrap)
        self.addSubview(lbTitle)
        
        let view = TGFlowLayout.init(.vert, arrangedCount: 4)
        view.tg_space = YZWMathSize.rate(rate: 20)
//        view.tg_left.equal(YZWMathSize.rate(rate: 20))
        view.tg_size(.wrap)
//        view.tg_centerX.equal(0)
        self.addSubview(view)
        
        for (idx, str) in arr.enumerated() {
            let btn = UIButton.init()
            btn.tg_height.equal(YZWMathSize.rate(rate: 40))
            btn.tg_width.equal(YZWMathSize.rate(rate: 70))
            btn.layer.cornerRadius = YZWMathSize.rate(rate: 5)
            btn.setTitle(str, for: .normal)
            btn.setTitleColor(UIColor.mainColor(), for: .selected)
            btn.setTitleColor(UIColor.mainBlackColor(), for: .normal)
            btn.backgroundColor = UIColor.white
            if idx == 0 {
                btn.isSelected = true
                self.btnLast = btn
            }
            btn.tag = 100 + idx
            btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
            view.addSubview(btn)
        }
        
    }
    
    @objc func btnAction(sender: UIButton) {
        if self.btnLast != sender {
            sender.isSelected = true
            self.btnLast.isSelected = false
            self.btnLast = sender
            self.settingTextRowBlock!(sender.tag-100)
        }
    }
    
}
