//
//  AAQSetFontRowView.swift
//  fashionColor
//
//  Created by mac on 2019/7/26.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit
import TangramKit

typealias AAQSetFontRowViewBlock = (String) -> Void
class AAQSetFontRowView: TGLinearLayout {
    
    var btnLast = UIButton.init()
    var settingRowBlock : AAQSetFontRowViewBlock?
    
    class func initSettingRow(arr: Array<String>, strTitle: String) -> AAQSetFontRowView {
        let view = AAQSetFontRowView.init(.vert)
        view.tg_size(width: YZWMathSize.rate(rate: 345), height: YZWMathSize.rate(rate: 80))
        view.createSettingRow(arr: arr, strTitle: strTitle)
        return view
    }
    
    var arrFontName : [String]?
    
    func createSettingRow(arr: Array<String>, strTitle: String) -> Void {
        self.arrFontName = arr
        
        let lbTitle = UILabel.init()
        lbTitle.text = strTitle
        lbTitle.font = UIFont.fontRate(size: 19)
        lbTitle.textColor = UIColor.mainColor()
        lbTitle.textAlignment = .left
        lbTitle.tg_height.equal(YZWMathSize.rate(rate: 40))
        lbTitle.tg_width.equal(.wrap)
        self.addSubview(lbTitle)
        
        let scrollView = UIScrollView.init()
//        scrollView.tg_left.equal(YZWMathSize.rate(rate: 20))
        scrollView.tg_size(.fill)
        scrollView.showsHorizontalScrollIndicator = false
        self.addSubview(scrollView)
        
        let lineLayout = TGLinearLayout.init(.horz)
        lineLayout.tg_height.equal(.wrap)
        lineLayout.tg_width.equal(.fill)
        scrollView.addSubview(lineLayout)
        
        lineLayout.tg_width.equal(.wrap).min(scrollView.tg_width, increment: 0)
        
        for (idx, str) in arr.enumerated() {
            let btn = UIButton.init()
            btn.tg_right.equal(YZWMathSize.rate(rate: 20))
            btn.tg_height.equal(YZWMathSize.rate(rate: 40))
            btn.tg_width.equal(YZWMathSize.rate(rate: 60))
            btn.layer.cornerRadius = YZWMathSize.rate(rate: 5)
            btn.backgroundColor = UIColor.white
            btn.titleLabel?.font = UIFont.fontRate(fontName: str, size: 14)
            btn.setTitle("fontSize".toLocalString(), for: .normal)
            btn.setTitleColor(UIColor.mainColor(), for: .selected)
            btn.setTitleColor(UIColor.mainBlackColor(), for: .normal)
            btn.imageEdgeInsets = UIEdgeInsets.init(top: YZWMathSize.rate(rate: 7), left: YZWMathSize.rate(rate: 7), bottom: YZWMathSize.rate(rate: 7), right: YZWMathSize.rate(rate: 7))
            if idx == 0 {
                btn.isSelected = true
                self.btnLast = btn
            }
            btn.tag = 100 + idx
            btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
            lineLayout.addSubview(btn)
        }
        
    }
    
    @objc func btnAction(sender: UIButton) {
        if self.btnLast != sender {
            sender.isSelected = true
            self.btnLast.isSelected = false
            self.btnLast = sender
            self.settingRowBlock!(self.arrFontName![sender.tag-100])
        }
    }
    
}
