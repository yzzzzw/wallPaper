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
    
    
//    var lbName : UILabel?
    var lbColor : UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cornerRadiusRate(value: 10)
        
        let vRoot = TGLinearLayout.init(.vert)
        vRoot.addborderLine(color: .white, width: YZWMathSize.rate(rate: 2))
        vRoot.tg_margin(0)
        contentView.addSubview(vRoot)
        
        let lbName = UILabel.init()
        lbName.tg_size(width: .wrap, height: YZWMathSize.rate(rate: 20))
        lbName.tg_centerX.equal(0)
        lbName.tg_top.equal(YZWMathSize.rate(rate: 10))
        lbName.textColor = .textMainColor()//UIColor.mainBlackColor()
        lbName.font = UIFont.fontRate(size: 13)
        lbName.text = "fontShown".toLocalString()
        lbName.textAlignment = .center
        vRoot.addSubview(lbName)
        
        let lbColor = UILabel.init()
        lbColor.tg_size(width: .wrap, height: YZWMathSize.rate(rate: 20))
        lbColor.tg_centerX.equal(0)
        lbColor.textColor = .textMainColor()//.mainBlackColor()
        lbColor.font = UIFont.fontRate(size: 12)
        lbColor.textAlignment = .center
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
//        self.lbName?.font = UIFont.fontRate(fontName: text, size: 18)
        self.lbColor?.text = color
    }
}
