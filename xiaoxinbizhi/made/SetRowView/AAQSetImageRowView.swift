//
//  AAQSetImageRowView.swift
//  fashionColor
//
//  Created by mac on 2019/7/9.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit
import TangramKit

typealias AAQSetImageRowViewBlock = (Int) -> Void
class AAQSetImageRowView: TGLinearLayout {
    
    var btnLast = UIButton.init()
    var settingRowBlock : AAQSetImageRowViewBlock?

    class func initSettingRow(arr: Array<String>, strTitle: String) -> AAQSetImageRowView {
        let view = AAQSetImageRowView.init(.vert)
        view.tg_size(.wrap)
        view.createSettingRow(arr: arr, strTitle: strTitle)
        return view
    }
    
    func createSettingRow(arr: Array<String>, strTitle: String) -> Void {
        
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
        view.tg_size(.wrap)
        self.addSubview(view)
        
        for (idx, str) in arr.enumerated() {
            let btn = UIButton.init()
            btn.tg_height.equal(YZWMathSize.rate(rate: 40))
            btn.tg_width.equal(YZWMathSize.rate(rate: 70))
            btn.layer.cornerRadius = YZWMathSize.rate(rate: 5)
            btn.backgroundColor = UIColor.white
            btn.setImage(UIImage.init(named: str), for: .selected)
            btn.setImage(UIImage.init(named: String(str + "_s")), for: .normal)
            btn.imageEdgeInsets = UIEdgeInsets.init(top: YZWMathSize.rate(rate: 7), left: YZWMathSize.rate(rate: 7), bottom: YZWMathSize.rate(rate: 7), right: YZWMathSize.rate(rate: 7))
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
            self.settingRowBlock!(sender.tag-100)
        }
    }

}
