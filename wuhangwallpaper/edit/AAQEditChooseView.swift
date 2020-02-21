//
//  AAQEditChooseView.swift
//  fashionColor
//
//  Created by mac on 2019/7/31.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit
import TangramKit

typealias AAQEditChooseViewBlock = (UIImage) -> Void
class AAQEditChooseView: TGRelativeLayout, UICollectionViewDelegate, UICollectionViewDataSource {

    var imgCallBack : AAQEditChooseViewBlock?
    var isFirst : Bool?
    var indexCurrent = IndexPath.init(item: 0, section: 0)
    
    //MARK: 加载view
    class func aaqColloectLayout() -> AAQEditChooseView {
        
        let view = AAQEditChooseView.init()
        view.tg_centerX.equal(0)
        view.tg_size(.wrap)
        view.aaqCollectCreateView()
        view.isFirst = true
        return view
    }
    
    func aaqCollectCreateView() -> Void {
        self.addSubview(self.collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "idCell", for: indexPath) as! AAQEditChooseCell
        
        cell.reloadImage(index: indexPath.item)
        if self.indexCurrent.item == indexPath.item {
            cell.contentView.layer.borderWidth = 4
        } else {
            cell.contentView.layer.borderWidth = 0
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if self.indexCurrent != indexPath {
            let cell = collectionView.cellForItem(at: indexPath) as! AAQEditChooseCell
            cell.contentView.layer.borderWidth = 4
            
            let cellLast = collectionView.cellForItem(at: self.indexCurrent)
            if cellLast != nil {
                cellLast!.contentView.layer.borderWidth = 0
            }
            self.indexCurrent = indexPath
            self.imgCallBack!(cell.viewImg.image!)
        }
        //        self.indexLastSelect = indexPath.item
        //        self.colorCallBack!(UIColor.colorList()[indexPath.row]["color"]!, indexPath.row)
    }
    
    //MARK: 初始化
    lazy fileprivate var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = YZWMathSize.rate(rate: 10)
        layout.itemSize = CGSize(width: aaqScreenWidth * 0.2, height: aaqScreenHeight * 0.2)
        
        let xPadding = 0 as CGFloat
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.tg_size(width: YZWMathSize.rate(rate: 335), height: YZWMathSize.rate(rate: 120))
        collectionView.backgroundColor = UIColor.clear
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(object_getClass(AAQEditChooseCell.init()), forCellWithReuseIdentifier: "idCell")
        return collectionView
    }()

}
