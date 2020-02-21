//
//  YZWAboutTableCell.swift
//  zizhibizhi
//
//  Created by mac on 2019/10/18.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit
import TangramKit

class YZWAboutTableCell: YZWBaseTableCell {

    var lbTitle : UILabel!
        var lbSubTitle : UILabel!
        var rightImage : UIImageView!
        
        override func prepareCreateView() {
            
    //        contentView.backgroundColor = .clear
            backgroundColor = .clear
    //        accessoryType = .disclosureIndicator
            
            self.rootLayout = TGLinearLayout(.vert)
            self.rootLayout.tg_topPadding = 0
            self.rootLayout.tg_bottomPadding = 0
            self.rootLayout.tg_width.equal(.fill)
            self.rootLayout.tg_height.equal(.wrap)
            self.rootLayout.tg_cacheEstimatedRect = true
    //        rootLayout.backgroundColor = .clear
            self.contentView.addSubview(self.rootLayout)
            
            let relayout = TGRelativeLayout.init()
            relayout.cornerRadius(value: YZWMathSize.rate(rate: 5))
            relayout.tg_size(width: .fill, height: .wrap)
            relayout.tg_padding = UIEdgeInsets.init(top: YZWMathSize.rate(rate: 10), left: YZWMathSize.rate(rate: 10), bottom: YZWMathSize.rate(rate: 10), right: YZWMathSize.rate(rate: 10))
            relayout.tg_top.equal(YZWMathSize.rate(rate: 5))
            relayout.tg_bottom.equal(YZWMathSize.rate(rate: 5))
            relayout.tg_horzMargin(YZWMathSize.rate(rate: 20))
            relayout.cornerRadius(value: YZWMathSize.rate(rate: 10))
            relayout.backgroundColor = UIColor.white.withAlphaComponent(0.5)
            rootLayout.addSubview(relayout)

            let lbTitle = UILabel.init()
            lbTitle.tg_size(width: .wrap, height: .fill)
            lbTitle.font = .fontRate(size: 15)
    //        lbTitle.tg_right.equal(0)
            lbTitle.tg_left.equal(YZWMathSize.rate(rate: 40))
            lbTitle.textColor = .textMainColor()//.mainBlackColor()
            relayout.addSubview(lbTitle)
            self.lbTitle = lbTitle

            let lbSubTitle = UILabel.init()
            lbSubTitle.tg_size(width: .wrap, height: .fill)
    //        lbSubTitle.tg_top.equal(lbTitle.tg_bottom).offset(0)
            lbSubTitle.font = .fontRate(size: 11)
            lbSubTitle.tg_right.equal(0)
            lbSubTitle.textColor = .textMainColor()//.darkGray
            relayout.addSubview(lbSubTitle)
            self.lbSubTitle = lbSubTitle

            let imageView = UIImageView.init()
            imageView.tg_size(width: YZWMathSize.rate(rate: 24), height: YZWMathSize.rate(rate: 24))
            imageView.tg_centerY.equal(0)
    //        imageView.tg_right.equal(0)
            imageView.tg_left.equal(YZWMathSize.rate(rate: 5))
            relayout.addSubview(imageView)
            self.rightImage = imageView
            
            
        }

}
