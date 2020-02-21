//
//  YZWBaseTableCell.swift
//  muouqing
//
//  Created by mac on 2019/8/13.
//  Copyright © 2019 baihai. All rights reserved.
//

import UIKit
import TangramKit

protocol YZWBaseTableCellProtocol {
    var rootLayout : TGBaseLayout! {get}
//    func setModel(model: AllTest1DataModel, isImageMessageHidden: Bool)
}

class YZWBaseTableCell: UITableViewCell, YZWBaseTableCellProtocol {
    
    //对于需要动态评估高度的UITableViewCell来说可以把布局视图暴露出来。用于高度评估和边界线处理。以及事件处理的设置。
//    fileprivate(set) var rootLayout : TGBaseLayout!
    var rootLayout : TGBaseLayout!
    
    weak var headImageView:UIImageView!
    weak var nickNameLabel:UILabel!
    weak var textMessageLabel:UILabel!
    weak var imageMessageImageView:UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        prepareCreateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
    func prepareCreateView() {
        
        self.rootLayout = TGLinearLayout(.horz)
        self.rootLayout.tg_topPadding = 5
        self.rootLayout.tg_bottomPadding = 5
        self.rootLayout.tg_width.equal(.fill)
        self.rootLayout.tg_height.equal(.wrap)
        self.rootLayout.tg_cacheEstimatedRect = true //这个属性只局限于在UITableViewCell中使用，用来优化tableviewcell的高度自适应的性能，其他地方请不要使用！！！
        self.contentView.addSubview(self.rootLayout)
        
        //如果您将布局视图作为子视图添加到UITableViewCell本身，并且同时设置了布局视图的宽度等于父布局的情况下，那么有可能最终展示的宽度会不正确。经过试验是因为对UITableViewCell本身的KVO监控所得到的新老尺寸的问题导致的这应该是iOS的一个BUG。所以这里建议最好是把布局视图添加到UITableViewCell的子视图contentView里面去。
        
        
        
        
        /*
         用线性布局实现时，整体用一个水平线性布局：左边是头像，右边是一个垂直的线性布局。垂直线性布局依次加入昵称、文本消息、图片消息。
         */
        
        
        let headImageView = UIImageView()
        self.rootLayout.addSubview(headImageView)
        self.headImageView = headImageView
        
        let messageLayout = TGLinearLayout(.vert)
        messageLayout.tg_width.equal(.fill)  //等价于tg_width.equal(100%)
        messageLayout.tg_height.equal(.wrap)
        messageLayout.tg_leading.equal(5)
        messageLayout.tg_vspace = 5 //前面4行代码描述的是垂直布局占用除头像外的所有宽度，并和头像保持5个点的间距。
        self.rootLayout.addSubview(messageLayout)
        
        
        let nickNameLabel = UILabel()
        nickNameLabel.textColor = .mainBlackColor()
        nickNameLabel.font = .fontRate(size: 17)
        nickNameLabel.text = "前面4行代码描述的是垂直布局占用除头像外的所有宽度，并和头像保持5个点的间距。"
        messageLayout.addSubview(nickNameLabel)
        self.nickNameLabel = nickNameLabel
        
        
        let textMessageLabel = UILabel()
        textMessageLabel.font = .fontRate(size: 15)
        textMessageLabel.textColor = .mainGrayColor()
        textMessageLabel.tg_width.equal(.fill)
        textMessageLabel.tg_height.equal(.wrap)  //高度为包裹，也就是动态高度。
        textMessageLabel.text = "高度为包裹，也就是动态高度。"
        messageLayout.addSubview(textMessageLabel)
        self.textMessageLabel = textMessageLabel
        
        let imageMessageImageView = UIImageView()
        imageMessageImageView.tg_centerX.equal(0)  //图片视图在父布局视图中水平居中。
        messageLayout.addSubview(imageMessageImageView)
        self.imageMessageImageView = imageMessageImageView
    }

    //iOS8以后您可以重载这个方法来动态的评估cell的高度，Autolayout内部是通过这个方法来评估高度的，因此如果用TangramKit实现的话就不需要调用基类的方法，而是调用根布局视图的sizeThatFits来评估获取动态的高度。
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize
    {
        /*
         通过布局视图的sizeThatFits方法能够评估出UITableViewCell的动态高度。sizeThatFits并不会进行布局而只是评估布局的尺寸。
         因为cell的高度是自适应的，因此这里通过调用高度为wrap的布局视图的sizeThatFits来获取真实的高度。
         */
        
        if #available(iOS 11.0, *) {
            //如果你的界面要支持横屏的话，因为iPhoneX的横屏左右有44的安全区域，所以这里要减去左右的安全区域的值，来作为布局宽度尺寸的评估值。
            //如果您的界面不需要支持横屏，或者延伸到安全区域外则不需要做这个特殊处理，而直接使用else部分的代码即可。
            return self.rootLayout.sizeThatFits(CGSize(width:targetSize.width - self.safeAreaInsets.left - self.safeAreaInsets.right, height:targetSize.height))
        } else {
            // Fallback on earlier versions
            return self.rootLayout.sizeThatFits(targetSize)  //如果使用系统自带的分割线，请记得将返回的高度height+1
        }
        
    }
}

extension YZWBaseTableCell {
    
}
