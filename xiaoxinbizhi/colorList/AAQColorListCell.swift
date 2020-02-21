//
//  AAQColorListCell.swift
//  fashionColor
//
//  Created by mac on 2019/7/23.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit
import TangramKit
class AAQColorListCell: UICollectionViewCell {

    var theLbName: UILabel!
    var theLbColor: UILabel!
    var theColorImgView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        addborderLine(color: UIColor.white.withAlphaComponent(0.5), width: YZWMathSize.rate(rate: 3))
        cornerRadiusRate(value: 10)
        
        let vRoot = TGLinearLayout.init(.horz)
        vRoot.addborderLine(color: .white, width: YZWMathSize.rate(rate: 2))
        vRoot.tg_margin(0)
        contentView.addSubview(vRoot)
        
        let colorImgView = UIImageView.init()
        colorImgView.tg_size(width: YZWMathSize.rate(rate: 60), height: YZWMathSize.rate(rate: 60))
//        colorImgView.image = UIImage.init(named: "meiguihua")?.withRenderingMode(.alwaysTemplate)
////        colorImgView.tintColor =
        colorImgView.addborderLine(color: .white, width: YZWMathSize.rate(rate: 2))
        vRoot.addSubview(colorImgView)
        theColorImgView = colorImgView
        
        let lbName = UILabel.init()
        lbName.tg_size(width: .fill, height: .wrap)
        lbName.tg_centerX.equal(0)
        lbName.tg_centerY.equal(0)
        lbName.numberOfLines = 0
//        lbName.tg_left.equal(YZWMathSize.rate(rate: 30))
        lbName.textColor = UIColor.textMainColor()
        lbName.font = UIFont.fontRate(size: 13)
        lbName.textAlignment = .center
        vRoot.addSubview(lbName)
        theLbName = lbName
        
//        let lbColor = UILabel.init()
//        lbColor.tg_size(width: .wrap, height: .wrap)
//        lbColor.tg_centerY.equal(0)
////        lbColor.tg_right.equal(YZWMathSize.rate(rate: 30))
//        lbColor.textColor = .mainBlackColor()
//        lbColor.font = UIFont.fontRate(size: 14)
//        lbColor.textAlignment = .right
//        vRoot.addSubview(lbColor)
//        theLbColor = lbColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadInfo(text: String, color: String, textColor: String) {
        theLbName.text = text + "\n" + color
//        theLbName.textColor = .hexadecimalColor(hexadecimal: textColor)
//        theLbColor.text = color
//        theLbColor.textColor = .hexadecimalColor(hexadecimal: textColor)
    }

}
