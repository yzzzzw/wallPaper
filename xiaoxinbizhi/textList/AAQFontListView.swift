//
//  AAQFontListView.swift
//  fashionColor
//
//  Created by mac on 2019/8/13.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit
import TangramKit

class AAQFontListView: TGRelativeLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var arrPostrCard = UIFont.familyNames
    var arrFilter = UIFont.familyNames
    
    class func initialView() -> AAQFontListView {
        let view = AAQFontListView.init()
        view.tg_insetsPaddingFromSafeArea = UIRectEdge.all
        view.backgroundColor = UIColor.bgMainColor()
        view.createView()
        return view
    }
    
    func createView() {
        
//        let searchBar = UISearchBar.init()
//        searchBar.tg_top.equal(YZWMathSize.rate(rate: 0))
//        searchBar.placeholder = "请输入字体名称"
//        searchBar.tg_size(width: YZWMathSize.rate(rate: 375), height: YZWMathSize.rate(rate: 36))
//        searchBar.tg_centerX.equal(0)
//        searchBar.backgroundImage = UIImage.imageFrom(color: UIColor.white)
//        searchBar.delegate = self
//        self.addSubview(searchBar)
        
        collectionView.tg_top.equal(0)
        collectionView.tg_bottom.equal(0)
        collectionView.tg_horzMargin(0)
        self.addSubview(self.collectionView)
    }
    
    lazy var collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize.init(width: YZWMathSize.rate(rate: 172), height: YZWMathSize.rate(rate: 60))
        flowLayout.minimumLineSpacing = YZWMathSize.rate(rate: 10)
        flowLayout.sectionInset = UIEdgeInsets.init(top: YZWMathSize.rate(rate: 10), left: YZWMathSize.rate(rate: 10), bottom: YZWMathSize.rate(rate: 10), right: YZWMathSize.rate(rate: 10))
        
        let vCollect = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        //        vCollect.tg_margin(0)
        vCollect.backgroundColor = UIColor.bgMainColor()
        vCollect.collectionViewLayout = flowLayout
        vCollect.showsHorizontalScrollIndicator = false
        vCollect.delegate = self
        vCollect.dataSource = self
        vCollect.register(object_getClass(AAQFontCell.init()), forCellWithReuseIdentifier: "idCell")
        return vCollect
        
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrFilter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "idCell", for: indexPath) as! AAQFontCell
        let str = self.arrFilter[indexPath.row]
        cell.backgroundColor = UIColor.white.withAlphaComponent(0.5)
//        cell.backgroundColor = .textMainColor()
        cell.reloadInfo(text: str, color: str)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ctr = AAQPreviewController.init()
        ctr.strFontName = self.arrFilter[indexPath.item]
        self.getCurrentController()!.present(ctr, animated: true) {
            
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.endEditing(true)
    }
    
}

extension AAQFontListView : UISearchBarDelegate {
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        var arr = [] as! Array<String>
        for str : String in self.arrPostrCard {
            
            let isA = str.range(of: searchBar.text!) != nil
            if isA {
                arr.append(str)
            }
            
        }
        self.arrFilter = arr
        
        self.collectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            self.arrFilter = self.arrPostrCard
            self.collectionView.reloadData()
        }
    }

}
