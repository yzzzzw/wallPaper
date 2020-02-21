//
//  AAQColorCollectView.swift
//  fashionColor
//
//  Created by mac on 2019/7/6.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit
import TangramKit

typealias AAQColorCollectViewBlock = (String, NSInteger) -> ()
class AAQColorCollectView: TGRelativeLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var colorCallBack : AAQColorCollectViewBlock?
    var isFirst : Bool?
    var indexLastSelect : Int?
    var colorList = UIColor.colorList()
    
    //MARK: 加载view
    class func aaqColloectLayout() -> AAQColorCollectView {
        
        let view = AAQColorCollectView.init()
        view.tg_centerX.equal(0)
        view.tg_size(.wrap)
        view.aaqCollectCreateView()
        view.isFirst = true
        view.indexLastSelect = 0
        return view
    }
    
    func aaqCollectCreateView() -> Void {
        self.addSubview(self.collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(colorList.count)
        return colorList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "idCell", for: indexPath) as! AAQColorCollectionCell
        cell.backgroundView!.backgroundColor = UIColor.hexadecimalColor(hexadecimal: colorList[indexPath.row]["color"]!)
        cell.lbName.text = colorList[indexPath.row]["title"]!
        cell.lbName.textColor = .hexadecimalColor(hexadecimal: colorList[indexPath.row]["textColor"]!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.colorCallBack!(colorList[indexPath.row]["color"]!, indexPath.row)
    }
    
    //MARK: 初始化
    lazy fileprivate var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = YZWMathSize.rate(rate: 10)
        layout.itemSize = CGSize(width: YZWMathSize.rate(rate: 60), height: YZWMathSize.rate(rate: 45))
        
        let xPadding = 0 as CGFloat
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
//        collectionView.tg_centerY.equal(0)
        collectionView.tg_size(width: YZWMathSize.rate(rate: 345), height: YZWMathSize.rate(rate: 55))
        collectionView.backgroundColor = UIColor.clear
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(object_getClass(AAQColorCollectionCell.init()), forCellWithReuseIdentifier: "idCell")
        return collectionView
    }()
    
}
