//
//  AAQColorCollectionCell.swift
//  fashionColor
//
//  Created by mac on 2019/7/6.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit

class AAQColorCollectionCell: UICollectionViewCell {
    
    var lbName = UILabel.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let lbName = UILabel.init()
        lbName.font = UIFont.fontRate(size: 15)
        lbName.textAlignment = NSTextAlignment.center
        lbName.layer.cornerRadius = YZWMathSize.rate(rate: 6)
        lbName.layer.masksToBounds = true
        self.backgroundView = lbName
        self.lbName = lbName
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
