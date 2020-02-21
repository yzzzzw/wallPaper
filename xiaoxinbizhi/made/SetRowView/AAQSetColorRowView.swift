//
//  AAQSetColorRowView.swift
//  fashionColor
//
//  Created by mac on 2019/7/26.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit
import TangramKit

typealias AAQSetColorRowViewBlock = (Int) -> Void
class AAQSetColorRowView: TGLinearLayout {
    
    var btnLast = UIButton.init()
    var settingColorBlock : AAQSetColorRowViewBlock?
    
    class func initSettingColorRow(arr: Array<String>, strTitle: String) -> AAQSetColorRowView {
        let view = AAQSetColorRowView.init(.vert)
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
        
        weak var weakSelf = self
        //MARK: 背景颜色选择
        let vColorCollect = AAQColorCollectView.aaqColloectLayout()
        self.addSubview(vColorCollect)
        
        vColorCollect.colorCallBack = { (colorHex, index) in
            weakSelf?.settingColorBlock!(index)
        }
        
    }
    
    @objc func btnAction(sender: UIButton) {
        if self.btnLast != sender {
            sender.isSelected = true
            self.btnLast.isSelected = false
            self.btnLast = sender
            self.settingColorBlock!(sender.tag-100)
        }
    }
}
