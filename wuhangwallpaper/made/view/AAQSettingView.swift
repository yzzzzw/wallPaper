//
//  AAQSettingView.swift
//  fashionColor
//
//  Created by mac on 2019/7/8.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit
import TangramKit

typealias AAQSettingViewColorBlock = (Int) -> Void
typealias AAQSettingViewTextBlock = (String) -> Void
typealias AAQSettingViewFontSizeBlock = (CGFloat) -> Void
typealias AAQSettingViewOrientationBlock = (Bool) -> Void
typealias AAQSettingViewAlignmentBlock = (Int) -> Void
typealias AAQSettingViewKernBlock = (Int) -> Void
typealias AAQSettingViewLineSpaceBlock = (Int) -> Void
typealias AAQSettingViewFontNameBlock = (String) -> Void
typealias AAQSettingViewWidthContentBlock = (CGFloat) -> Void
typealias AAQSettingViewFontColorBlock = (Int) -> Void
typealias AAQSettingViewBorderColorBlock = (Int) -> Void
typealias AAQSettingViewBorderWidthBlock = (CGFloat) -> Void
class AAQSettingView: TGLinearLayout, UIGestureRecognizerDelegate, UITextViewDelegate {
    
    var index = 0
    var colorBlock : AAQSettingViewColorBlock?
    var contentBlock : AAQSettingViewTextBlock?
    var fontSizeBlock : AAQSettingViewFontSizeBlock?
    var orientationBlock : AAQSettingViewOrientationBlock?
    var textAlignmentBlock : AAQSettingViewAlignmentBlock?
    var kernBlock : AAQSettingViewKernBlock?
    var lineSpaceBlock : AAQSettingViewLineSpaceBlock?
    var fontNameBlock : AAQSetFontRowViewBlock?
    var widthContentBlock : AAQSettingViewWidthContentBlock?
    var fontColorBlock : AAQSettingViewFontColorBlock?
    var borderColorBlock : AAQSettingViewBorderColorBlock?
    var borderWidthBlock : AAQSettingViewBorderWidthBlock?
    
    class func initSetingView() -> AAQSettingView {
        
        let view = AAQSettingView.init(.vert)
        view.tg_size(width: .fill, height: YZWMathSize.rate(rate: 400))
        view.createSettingView()
        view.alpha = 0
        view.backgroundColor = .bgMainColor()
        return view
    }
    
    func createSettingView() -> Void {
        weak var weakSelf = self
        
        ///MARK: view create
        let scroll = UIScrollView.init()
//        scroll.tg_top.equal(YZWMathSize.rate(rate: 15))
        scroll.tg_width.equal(.fill)
        scroll.tg_height.equal(.fill)
        scroll.delegate = self
        scroll.showsVerticalScrollIndicator = false
        addSubview(scroll)
        
        let view = TGLinearLayout.init(.vert)
        view.tg_size(width: .fill, height: .wrap)
        view.tg_padding = UIEdgeInsets.init(top: YZWMathSize.rate(rate: 15), left: YZWMathSize.rate(rate: 15), bottom: YZWMathSize.rate(rate: 15), right: YZWMathSize.rate(rate: 15))
        scroll.addSubview(view)
        view.tg_height.equal(.wrap).min(scroll.tg_height, increment: 0)
        
        let lbTitle = UILabel()
        lbTitle.font = .fontRate(size: 19)
        lbTitle.tg_size(width: .wrap, height: .wrap)
        lbTitle.textColor = .textMainColor()
        lbTitle.text = "word".toLocalString()
        view.addSubview(lbTitle)
        
        let tvTitle = UITextView.init()
        tvTitle.cornerRadiusRate(value: 5)
        tvTitle.tg_top.equal(YZWMathSize.rate(rate: 10))
        tvTitle.tg_size(width: .fill, height: YZWMathSize.rate(rate: 100))
        tvTitle.backgroundColor = UIColor.white
        tvTitle.font = .fontRate(size: 17)
        tvTitle.textColor = .mainColor()
        tvTitle.delegate = self
        view.addSubview(tvTitle)
        
        let vBgColor = AAQSetColorRowView.initSettingColorRow(arr: UIFont.familyNames, strTitle: "backgroundColor".toLocalString())
        vBgColor.tg_top.equal(YZWMathSize.rate(rate: 10))
        view.addSubview(vBgColor)
        vBgColor.settingColorBlock = { (index) in
            weakSelf!.index = index
            weakSelf!.colorBlock!(index)
        }
        
        let vFontName = AAQSetFontRowView.initSettingRow(arr: UIFont.familyNames, strTitle: "fontName".toLocalString())
        vFontName.tg_top.equal(YZWMathSize.rate(rate: 20))
        view.addSubview(vFontName)
        vFontName.settingRowBlock = { (str) in
            self.fontNameBlock!(str)
        }

        let vFontSize = AAQSetTextRowView.initSettingTextRow(arr: ["20","25","30","35"], strTitle: "type".toLocalString())
        vFontSize.tg_top.equal(YZWMathSize.rate(rate: 10))
        view.addSubview(vFontSize)
        vFontSize.settingTextRowBlock = { (index) in
            let arrSize = ["20","25","30","35"]
            weakSelf!.fontSizeBlock!(CGFloat((arrSize[index] as NSString).floatValue))
        }
        
        let vTextColor = AAQSetColorRowView.initSettingColorRow(arr: UIFont.familyNames, strTitle: "textColor".toLocalString())
        vTextColor.tg_top.equal(YZWMathSize.rate(rate: 10))
        view.addSubview(vTextColor)
        vTextColor.settingColorBlock = { (index) in
            weakSelf!.index = index
            weakSelf!.fontColorBlock!(index)
        }

        let vFont = AAQSetTextRowView.initSettingTextRow(arr: ["aliLeft".toLocalString(), "aliCenter".toLocalString(), "aliRight".toLocalString()], strTitle: "alignment".toLocalString())
        vFont.tg_top.equal(YZWMathSize.rate(rate: 10))
        view.addSubview(vFont)
        vFont.settingTextRowBlock = { (index) in
            weakSelf!.textAlignmentBlock!(index)
        }

        let vKern = AAQSetTextRowView.initSettingTextRow(arr: ["0","8","16","24"], strTitle: "textEdge".toLocalString())
        vKern.tg_top.equal(YZWMathSize.rate(rate: 10))
        view.addSubview(vKern)
        vKern.settingTextRowBlock = { (index) in
            weakSelf!.kernBlock!(index)
        }
        
        let vWidthContent = AAQSetTextRowView.initSettingTextRow(arr: ["wide".toLocalString(),"medium".toLocalString(),"narrow".toLocalString()], strTitle: "lineWidth".toLocalString())
        vWidthContent.tg_top.equal(YZWMathSize.rate(rate: 10))
        view.addSubview(vWidthContent)
        vWidthContent.settingTextRowBlock = { (index) in
            let arrWidth = [YZWMathSize.rate(rate: 345),YZWMathSize.rate(rate: 255),YZWMathSize.rate(rate: 165),YZWMathSize.rate(rate: 75)]
            weakSelf!.widthContentBlock!(arrWidth[index])
        }

        let vLineSpace = AAQSetTextRowView.initSettingTextRow(arr: ["0","8","16","24"], strTitle: "lineEdge".toLocalString())
        vLineSpace.tg_top.equal(YZWMathSize.rate(rate: 10))
        view.addSubview(vLineSpace)
        vLineSpace.settingTextRowBlock = { (index) in
            self.lineSpaceBlock!(index)
        }
        
        let vBorderWidth = AAQSetTextRowView.initSettingTextRow(arr: ["none".toLocalString(),"narrow".toLocalString(),"medium".toLocalString(),"wide".toLocalString()], strTitle: "borderWidth".toLocalString())
        vBorderWidth.tg_top.equal(YZWMathSize.rate(rate: 10))
        view.addSubview(vBorderWidth)
        vBorderWidth.settingTextRowBlock = { (index) in
            let arrWidth = [YZWMathSize.rate(rate: 0),YZWMathSize.rate(rate: 30),YZWMathSize.rate(rate: 60),YZWMathSize.rate(rate: 90)]
            weakSelf!.borderWidthBlock!(arrWidth[index])
        }
        
        let vBorderColor = AAQSetColorRowView.initSettingColorRow(arr: UIFont.familyNames, strTitle: "borderColor".toLocalString())
        vBorderColor.tg_top.equal(YZWMathSize.rate(rate: 10))
        vBorderColor.tg_bottom.equal(YZWMathSize.rate(rate: 20))
        view.addSubview(vBorderColor)
        vBorderColor.settingColorBlock = { (index) in
            weakSelf!.index = index
            weakSelf!.borderColorBlock!(index)
        }
        
        
    }
    
    @objc func upSwipAction() {
        self.tg_height.equal(aaqScreenHeight * 0.9)
    }
    
    @objc func downSwipAction() {
        self.tg_height.equal(YZWMathSize.rate(rate: 300))
        self.endEditing(true)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.contentBlock!(textView.text)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.upSwipAction()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.downSwipAction()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
}
