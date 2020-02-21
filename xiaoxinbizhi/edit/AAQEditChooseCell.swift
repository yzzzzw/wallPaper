//
//  AAQEditChooseCell.swift
//  fashionColor
//
//  Created by mac on 2019/7/31.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit
import TangramKit

class AAQEditChooseCell: UICollectionViewCell {
    
    var lbName = UILabel.init()
    var viewImg : UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.layer.borderColor = UIColor.mainBlackColor().cgColor
        
        let view = TGRelativeLayout.init()
        view.tg_margin(0)
        self.contentView.addSubview(view)
        
        let viewImg = UIImageView.init()
        viewImg.contentMode = .scaleAspectFill
        viewImg.layer.masksToBounds = true
        viewImg.tg_margin(0)
        view.addSubview(viewImg)
        self.viewImg = viewImg
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadImage(index: Int) {
        let image = UIImage.init(named: String("image_" + String(index)))
        self.viewImg.image = image
    }
    
}
