//
//  YZWCardCollectionCell.swift
//  fashionColor
//
//  Created by mac on 2019/7/5.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit
import TangramKit
import Toast_Swift

typealias YZWCardCollectionCellDeleteBlock = (YZWCardCollectionCell) -> Void
class YZWCardCollectionCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    
    var isCurrentItem : Bool!//是否是当前显示的
    
    var vImg = UIImageView.init()
    var vLineAlpha = TGRelativeLayout.init()
    var deleteBlock : YZWCardCollectionCellDeleteBlock?
    var index : Int!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let vRoot = TGRelativeLayout.init()
        vRoot.tg_margin(0)
//        vRoot.backgroundColor = UIColor.red
        self.contentView.addSubview(vRoot)
        
        let vImg = UIImageView.init()
        vImg.tg_margin(0)
//        vImg.backgroundColor = UIColor.green
        vRoot.addSubview(vImg)
//        vImg.alpha = 0.5
        self.vImg = vImg
        
//        let vImg2 = UIImageView.init()
//        vImg2.tg_margin(0)
//        vImg2.image = UIImage.init(named: "timg")
//        vRoot.addSubview(vImg2)
//        vImg2.alpha = 0.5
        
        let vLineAlpha = TGRelativeLayout.init()
        vLineAlpha.tg_margin(0)
        vLineAlpha.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        vLineAlpha.alpha = 0
        vRoot.addSubview(vLineAlpha)
        self.vLineAlpha = vLineAlpha
        
        let vLine = TGFlowLayout.init(.vert, arrangedCount: 2)
        vLine.tg_size(.wrap)
        vLine.tg_centerX.equal(0)
        vLine.tg_centerY.equal(0)
        vLine.tg_space = YZWMathSize.rate(rate: 20)
        vLineAlpha.addSubview(vLine)
        
        let arrBtnImg = ["sharePicture", "deletePicture"]
//        let arrColor = ["87843b","8f4b2e","73b9a2","f15b6c"]
        for idx in 0...arrBtnImg.count-1 {
            let name = arrBtnImg[idx]
            let btn = UIButton.init()
            btn.tg_size(width: YZWMathSize.rate(rate: 36), height: YZWMathSize.rate(rate: 36))
            btn.setImage(UIImage.init(named: name), for: .normal)
//            btn.tg_left.equal(YZWMathSize.rate(rate: 10))
//            btn.tg_right.equal(YZWMathSize.rate(rate: 10))
            btn.backgroundColor = UIColor.white
            btn.layer.cornerRadius = YZWMathSize.rate(rate: 18)
            btn.backgroundColor = .mainColor()//UIColor.hexadecimalColor(hexadecimal: arrColor[idx])
            btn.imageView?.contentMode = ContentMode.scaleAspectFit
            btn.imageEdgeInsets = UIEdgeInsets.init(top: YZWMathSize.rate(rate: 3), left: YZWMathSize.rate(rate: 0), bottom: YZWMathSize.rate(rate: 3), right: YZWMathSize.rate(rate: 0))
            btn.addTarget(self, action: #selector(bookMarkAction), for: .touchUpInside)
            btn.tag = 100 + idx
            vLine.addSubview(btn)
        }
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(tapGestureAction))
        tapGesture.delegate = self
        self.contentView.addGestureRecognizer(tapGesture)
        
        self.isCurrentItem = false
        
    }
    
    @objc func bookMarkAction(btn: UIButton) {
        switch btn.tag-100 {
            case 0:
                do {
                    self.sharePhoto()
                }
            case 1:
                do {
                    self.deleteBookMark()
                }
            default:
                do {
                    
                }
            }
//        case 0:
//            do {
//                self.savePhotoToAlbum()
//            }
//        case 1:
//            do {
//                self.sharePhoto()
//            }
//        case 2:
//            do {
//                self.editPicture()
//            }
//        case 3:
//            do {
//                self.deleteBookMark()
//            }
//        default:
//            do {
//
//            }
//        }
        
        self.tapGestureAction()
    }
    
    func editPicture() -> Void {
        let ctr = AAQEditController.init()
        ctr.image = self.vImg.image
        ctr.index = self.index
        self.getCurrentController()?.navigationController?.pushViewController(ctr, animated: true)
        weak var weakSelf = self
        ctr.block = { (image) in
            weakSelf!.vImg.image = image
        }
    }
    
    func sharePhoto() -> Void {
        let ctr = UIActivityViewController.init(activityItems: [self.vImg.image!], applicationActivities: nil)
        self.currentNavViewController()?.present(ctr, animated: true, completion: {
            
        })
    }
    
    func savePhotoToAlbum() -> Void {
        UIImageWriteToSavedPhotosAlbum(self.vImg.image!, self, #selector(image(image:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    func deleteBookMark() -> Void {
        self.deleteBlock!(self)
    }
    
    @objc func image(image: UIImage, didFinishSavingWithError: NSError?, contextInfo: AnyObject) {
        print("---")
        
        if didFinishSavingWithError != nil {
            print("错误")
            return
        }
        
        var style = ToastStyle()
        style.messageColor = .white
        style.titleFont = UIFont.fontRate(size: 13)
        self.currentNavViewController()?.view.makeToast("~完成图片保存啦~", duration: 0.8, position: .center, style: style)
        
        print("OK")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapGestureAction() {
        
        UIView.animate(withDuration: 0.3) {
            if self.vLineAlpha.alpha == 0 {
                self.vLineAlpha.alpha = 1
            } else {
                self.vLineAlpha.alpha = 0
            }
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if !self.isCurrentItem {
            return false
        }
        if touch.view != self.contentView {
            return true
        }
        return false
    }
    
}
