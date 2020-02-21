//
//  AAQPreviewController.swift
//  fashionColor
//
//  Created by mac on 2019/7/6.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit
import TangramKit

class AAQPreviewController: UIViewController, UIGestureRecognizerDelegate {
    
    var strColor = String()
    var vSet = AAQSettingView.initSetingView()
    
    var vBookMark = TGRelativeLayout.init()
    
    var lbColorName = UILabel.init()
    var theLbContent = UILabel.init()
    
    var index = 0
    
    
    var lineSpace : CGFloat = 0.0
    var fontSize = YZWMathSize.rate(rate: 20)
    var kern : CGFloat = 0.0
    var textAlignment = NSTextAlignment.left
    var strContent = String()
    var strFontName = "Copperplate"
    var widthContent = YZWMathSize.rate(rate: 345)
    
    override func loadView() {
        let weakSelf = self
        
        let view = TGRelativeLayout.init()
        view.tg_insetsPaddingFromSafeArea = UIRectEdge.init()
        self.view = view
        
        let vBookMark = TGRelativeLayout.init()
        vBookMark.tg_margin(0)
        view.addSubview(vBookMark)
        self.vBookMark = vBookMark
        
        let lbContent = UILabel.init()
        lbContent.tg_size(.wrap)
        lbContent.tg_width.equal(self.widthContent)
        lbContent.numberOfLines = 0
        lbContent.tg_centerX.equal(0)
        lbContent.tg_centerY.equal(0)
        lbContent.font = .fontRate(size: 14)
        lbContent.textAlignment = .left
        lbContent.text = "warmTips".toLocalString()
        vBookMark.addSubview(lbContent)
        theLbContent = lbContent
        
//        let lbColorName = UILabel.init()
//        lbColorName.tg_size(.wrap)
//        lbColorName.tg_centerX.equal(0)
//        lbColorName.tg_bottom.equal(view.tg_bottom).offset(YZWMathSize.rate(rate: 40))
//        lbColorName.font = UIFont.fontRate(size: 20)
//        vBookMark.addSubview(lbColorName)
//        self.lbColorName = lbColorName
        
        
        
        let toolBarMargin = YZWMathSize.rate(rate: 15)
        let toolBarView = TGFlowLayout.init(.vert, arrangedCount: 4)
        toolBarView.tg_bottom.equal(YZWMathSize.rate(rate: 50))
        toolBarView.tg_size(width: .wrap, height: .wrap)
        toolBarView.tg_padding = UIEdgeInsets.init(top: 0, left: toolBarMargin, bottom: 0, right: toolBarMargin)
        toolBarView.tg_centerX.equal(0)
        toolBarView.cornerRadiusRate(value: 20)
        toolBarView.backgroundColor = .white//.bgMainColor()
        view.addSubview(toolBarView)
        
        let imageSpace = YZWMathSize.rate(rate: 10)
        let btnWidth = YZWMathSize.rate(rate: 40)
        
        let btnBack = UIButton()
        btnBack.setImage(UIImage.init(named: "article_back"), for: .normal)
        btnBack.imageEdgeInsets = UIEdgeInsets.init(top: imageSpace, left: imageSpace, bottom: imageSpace, right: imageSpace)
        btnBack.tg_size(width: btnWidth, height: btnWidth)
        btnBack.addTarget(self, action: #selector(btnBackAction), for: .touchUpInside)
        toolBarView.addSubview(btnBack)
        
        let btnSave = UIButton()
        btnSave.setImage(UIImage.init(named: "article_save"), for: .normal)
        btnSave.imageEdgeInsets = UIEdgeInsets.init(top: imageSpace, left: imageSpace, bottom: imageSpace, right: imageSpace)
        btnSave.tg_size(width: btnWidth, height: btnWidth)
        btnSave.addTarget(self, action: #selector(btnSaveAction), for: .touchUpInside)
        toolBarView.addSubview(btnSave)
        
        let btnEdit = UIButton()
        btnEdit.setImage(UIImage.init(named: "article_edit"), for: .normal)
        btnEdit.imageEdgeInsets = UIEdgeInsets.init(top: imageSpace, left: imageSpace, bottom: imageSpace, right: imageSpace)
        btnEdit.tg_size(width: btnWidth, height: btnWidth)
        btnEdit.addTarget(self, action: #selector(btnEditAction), for: .touchUpInside)
        toolBarView.addSubview(btnEdit)
        
        //MARK: 设置中心
        let vSet = AAQSettingView.initSetingView()
        vSet.tg_bottom.equal(view.tg_bottom)
        view.addSubview(vSet)
        self.vSet = vSet
        
        vSet.colorBlock = { (index) in
            weakSelf.index = index
            weakSelf.refreshDataView()
        }
        vSet.contentBlock = { (str) in
            weakSelf.strContent = str
            weakSelf.refreshContentData()
        }
        vSet.fontSizeBlock = { (fontSize) in
            weakSelf.fontSize = fontSize
            weakSelf.refreshDataView()
        }
        vSet.orientationBlock = { (isVert) in//下个版本
            weakSelf.refreshContentData()
        }
        vSet.textAlignmentBlock = { (index) in
            if index == 0 {
                weakSelf.textAlignment = NSTextAlignment.left
            } else if index == 1 {
                weakSelf.textAlignment = NSTextAlignment.center
            } else {
                weakSelf.textAlignment = NSTextAlignment.right
            }
            weakSelf.refreshContentData()
        }
        vSet.kernBlock = { (index) in
            self.kern = CGFloat(index) * 8.0
            self.refreshContentData()
        }
        vSet.lineSpaceBlock = { (index) in
            self.lineSpace = CGFloat(index) * 8.0
            self.refreshContentData()
        }
        vSet.fontNameBlock = { (fontName) in
            self.strFontName = fontName
            self.refreshDataView()
        }
        vSet.widthContentBlock = { (width) in
            weakSelf.theLbContent.tg_width.equal(width)
        }
        vSet.fontColorBlock = { (index) in
            let arrColor = UIColor.colorList()
            let dic = arrColor[index] as Dictionary<String, String>
            weakSelf.theLbContent.textColor = UIColor.hexadecimalColor(hexadecimal: dic["color"]!)
        }
        vSet.borderColorBlock = { (index) in
            let arrColor = UIColor.colorList()
            let dic = arrColor[index] as Dictionary<String, String>
            let color = UIColor.hexadecimalColor(hexadecimal: dic["color"]!)
            self.vBookMark.layer.borderColor = color.cgColor
        }
        vSet.borderWidthBlock = { (width) in
            self.vBookMark.layer.borderWidth = width
        }
        
        self.refreshDataView()
    }
    
    func refreshContentData() {
        
        let paragrapy = NSMutableParagraphStyle.init()
        paragrapy.lineSpacing = self.lineSpace
        paragrapy.alignment = self.textAlignment
        
        let myAttribute = [NSAttributedString.Key.kern: self.kern,
                           NSAttributedString.Key.paragraphStyle: paragrapy] as [NSAttributedString.Key : Any]
        let strAttr = NSAttributedString.init(string: self.strContent, attributes: myAttribute)
        theLbContent.attributedText = strAttr
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: 手势
        let swipLeft = UISwipeGestureRecognizer.init(target: self, action: #selector(swipLeftAction))
        swipLeft.direction = UISwipeGestureRecognizer.Direction.left
        swipLeft.delegate = self
        self.vBookMark.addGestureRecognizer(swipLeft)
        
        let swipRight = UISwipeGestureRecognizer.init(target: self, action: #selector(swipRightAction))
        swipRight.direction = UISwipeGestureRecognizer.Direction.right
        swipRight.delegate = self
        self.vBookMark.addGestureRecognizer(swipRight)
        
//        let swipDown = UISwipeGestureRecognizer.init(target: self, action: #selector(swipDownAction))
//        swipDown.direction = UISwipeGestureRecognizer.Direction.down
//        self.vBookMark.addGestureRecognizer(swipDown)
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        tap.delegate = self
        self.vBookMark.addGestureRecognizer(tap)
        
//        let longPress = UILongPressGestureRecognizer.init(target: self, action: #selector(longPressAction))
//        self.vBookMark.addGestureRecognizer(longPress)
        
    }
    
    //MARK: 手势事件
    @objc func swipLeftAction() -> Void {
        self.changeColor(isAdd: true)
    }
    
    @objc func swipRightAction() -> Void {
        self.changeColor(isAdd: false)
    }
    
//    @objc func swipDownAction() -> Void {
//        self.dismiss(animated: true) {
//
//        }
//    }
    @objc func btnBackAction(sender: UIButton) {
        self.dismiss(animated: true) {}
    }
    
    @objc func swipUpAction() -> Void {
        UIView.animate(withDuration: 0.3) {
            self.vSet.alpha = 1.0
        }
    }
    
    @objc func tapAction() -> Void {
        
        UIView.animate(withDuration: 0.2) {
//            if self.vSet.alpha == 0 {
//                self.vSet.alpha = 1.0
//            } else {
                self.vSet.alpha = 0
                self.vSet.endEditing(true)
//            }
        }
    }
    
    @objc func btnSaveAction(sender: UIButton) {
        let str = self.vBookMark.capture!.pngData()?.base64EncodedString()
        AAQColorSingle.shareInstance.saveBookMark(str: str!)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: addBookMarkNotification), object: nil, userInfo: nil)
        self.dismiss(animated: true) {
            
        }
    }
    
    @objc func btnEditAction(sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
//            if self.vSet.alpha == 0 {
                self.vSet.alpha = 1.0
//            } else {
//                self.vSet.alpha = 0
//                self.vSet.endEditing(true)
//            }
        }
    }
    
//    @objc func longPressAction(gesture: UILongPressGestureRecognizer) {
//        
//        if gesture.state == UIGestureRecognizer.State.began {
//            let str = self.vBookMark.capture!.pngData()?.base64EncodedString()
//            AAQColorSingle.shareInstance.saveBookMark(str: str!)
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: addBookMarkNotification), object: nil, userInfo: nil)
//            self.dismiss(animated: true) {
//                
//            }
//        }
//    }
    
    func changeColor(isAdd: Bool) -> Void {
        
        if isAdd {
            self.index += 1
        } else {
            self.index -= 1
        }
        
        self.refreshDataView()
    }
    
    func refreshDataView() -> Void {
        
        let arrColor = UIColor.colorList()
        
        if self.index < 0 || self.index >= arrColor.count {
            self.index = (self.index + arrColor.count) % arrColor.count
        }
        
        let dic = arrColor[self.index] as Dictionary<String, String>
        
        self.vBookMark.backgroundColor = UIColor.hexadecimalColor(hexadecimal: dic["color"]!)
        self.lbColorName.text = dic["title"]
        self.lbColorName.textColor = .hexadecimalColor(hexadecimal: dic["textColor"]!)
        theLbContent.font = UIFont.fontRate(fontName: self.strFontName, size: self.fontSize)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view != self.vBookMark {
            return false
        }
        return true
    }
    
}
