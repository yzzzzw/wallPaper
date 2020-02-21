//
//  AAQColorListView.swift
//  fashionColor
//
//  Created by mac on 2019/7/23.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit
import TangramKit

class AAQColorListView: TGRelativeLayout, UICollectionViewDelegate, UICollectionViewDataSource {

    var arrPostrCard = UIColor.colorList()
    var arrFilter = UIColor.colorList()
    
    class func initialView() -> AAQColorListView {
        let view = AAQColorListView.init()
        view.tg_insetsPaddingFromSafeArea = UIRectEdge.all
        view.backgroundColor = UIColor.bgMainColor()
        view.createView()
        return view
    }
    
    func createView() {
        
//        let searchBar = UISearchBar.init()
//        searchBar.tg_top.equal(YZWMathSize.rate(rate: 0))
//        searchBar.placeholder = "请输入颜色"
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
        vCollect.backgroundColor = UIColor.bgMainColor()
        vCollect.collectionViewLayout = flowLayout
        vCollect.showsHorizontalScrollIndicator = false
        vCollect.delegate = self
        vCollect.dataSource = self
        vCollect.register(object_getClass(AAQColorListCell.init()), forCellWithReuseIdentifier: "idCell")
        return vCollect
        
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrFilter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "idCell", for: indexPath) as! AAQColorListCell
        let dic = self.arrFilter[indexPath.row]
//        cell.backgroundColor = .hexadecimalColor(hexadecimal: dic["color"]!)
        cell.backgroundColor = UIColor.white.withAlphaComponent(0.5)
//        cell.theColorImgView.tintColor = .hexadecimalColor(hexadecimal: dic["color"]!)
        cell.theColorImgView.backgroundColor = .hexadecimalColor(hexadecimal: dic["color"]!)//UIColor.mainColor().withAlphaComponent(0.5)
        cell.reloadInfo(text: dic["title"]!, color: dic["color"]!, textColor: dic["textColor"]!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ctr = AAQPreviewController.init()
        ctr.index = self.arrPostrCard.firstIndex(of: self.arrFilter[indexPath.item])!
        self.getCurrentController()!.present(ctr, animated: true) {
            
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.endEditing(true)
    }

}

extension AAQColorListView : UISearchBarDelegate {
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        var arr = [] as! Array<Dictionary<String, String>>
        for dic : Dictionary<String, String> in self.arrPostrCard {
            
            let isA = dic["title"]!.range(of: searchBar.text!) != nil
            let isB = dic["color"]!.range(of: searchBar.text!) != nil
            if isA || isB {
                arr.append(dic)
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
