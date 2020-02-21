//
//  AAQFontCellTableViewCell.swift
//  fashionColor
//
//  Created by mac on 2019/8/13.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit
import TangramKit

class AAQFontCell: UICollectionViewCell {
    
    
    var theLbName : UILabel?
    var lbColor : UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let vRoot = TGRelativeLayout.init()
        vRoot.tg_size(.fill)
        contentView.addSubview(vRoot)
        
//        let bgImgView = UIImageView.init()
//        bgImgView.tg_size(.fill)
//        bgImgView.image = UIImage.init(named: "color_beijing")
//        vRoot.addSubview(bgImgView)
        
        let colorImgView = UIImageView.init()
        colorImgView.tg_size(width: YZWMathSize.rate(rate: 100), height: YZWMathSize.rate(rate: 100))
        colorImgView.cornerRadiusRate(value: 50)
        colorImgView.tg_centerX.equal(0)
        colorImgView.tg_centerY.equal(0)
        colorImgView.backgroundColor = .white
//        colorImgView.tg_top.equal(YZWMathSize.rate(rate: 10))
        colorImgView.addborderLine(color: .white, width: YZWMathSize.rate(rate: 2))
        vRoot.addSubview(colorImgView)
//        theColorImgView = colorImgView
        
        let lbName = UILabel.init()
        lbName.tg_size(width: YZWMathSize.rate(rate: 70), height: .wrap)
        lbName.tg_centerX.equal(0)
//        lbName.tg_centerY.equal(-YZWMathSize.rate(rate: 20))
        lbName.adjustsFontSizeToFitWidth = true
        lbName.tg_bottom.equal(colorImgView.tg_centerY).offset(YZWMathSize.rate(rate: 5))
//        lbName.numberOfLines = 0
//        lbName.tg_top.equal(YZWMathSize.rate(rate: 5))
        lbName.textColor = .textMainColor()//UIColor.mainBlackColor()
        lbName.font = UIFont.fontRate(size: 18)
        lbName.text = "fontShown".toLocalString()
        lbName.textAlignment = .center
        vRoot.addSubview(lbName)
        theLbName = lbName
        
        let lbColor = UILabel.init()
        lbColor.tg_size(width: YZWMathSize.rate(rate: 60), height: .wrap)
        lbColor.tg_top.equal(lbName.tg_bottom).offset(0)
        lbColor.tg_centerX.equal(0)
        lbColor.tg_centerY.equal(colorImgView.tg_centerY).offset(YZWMathSize.rate(rate: 15))
        lbColor.textColor = .textMainColor()//.mainBlackColor()
        lbColor.font = UIFont.fontRate(size: 8)
        lbColor.textAlignment = .center
        lbColor.numberOfLines = 0
        vRoot.addSubview(lbColor)
        self.lbColor = lbColor
        lbColor.tg_layoutCompletedDo { (layout, view) in
            lbColor.cornerRadiusRound()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadInfo(text: String, color: String) {
        self.theLbName?.font = UIFont.fontRate(fontName: text, size: 15)
        self.lbColor?.text = color
    }
}
