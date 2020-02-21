//
//  AAQCardCollectionView.swift
//  fashionColor
//
//  Created by mac on 2019/7/5.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit
import TangramKit
import Toast_Swift

typealias YZWCardListViewCurrentItemBlock = (UIColor) -> Void
class YZWCardListView: TGRelativeLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var arrInfo = AAQColorSingle.shareInstance.getInfo()
    var colorBlock : YZWCardListViewCurrentItemBlock?
    var cellLast : YZWCardCollectionCell?
    var lbTell = UILabel.init()
    var bgImg = UIImageView.init()
    
    func reloadCollectionView() -> Void {
        self.arrInfo = AAQColorSingle.shareInstance.getInfo()
        self.collectionView.reloadData()
        
        self.scrollViewDidEndDecelerating(self.collectionView)
    }
    
    //MARK: 代理
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "idCell", for: indexPath) as! YZWCardCollectionCell
        
        cell.index = indexPath.item
        
        if self.arrInfo.count == 1 {
            cell.isCurrentItem = true
        }
        
        //刷新数据
        let strImgData = self.arrInfo[indexPath.row]
        let data = Data.init(base64Encoded: strImgData)
        cell.vImg.image = UIImage.init(data: data!)
        UIView.animate(withDuration: 0.3) {
            cell.vLineAlpha.alpha = 0
        }
        
        //MARK: cell Block
        let weakSelf = self
        cell.deleteBlock = { (cell) in
            let deleteIndexPath = collectionView.indexPath(for: cell)
            weakSelf.arrInfo.remove(at: deleteIndexPath!.item)
            AAQColorSingle.shareInstance.removeMark(index: deleteIndexPath!.item)
            weakSelf.collectionView.deleteItems(at: [deleteIndexPath!])
            weakSelf.scrollViewDidEndDecelerating(weakSelf.collectionView)
            if weakSelf.arrInfo.count == 0 {
                UIView.animate(withDuration: 0.3, animations: {
                    weakSelf.lbTell.alpha = 1
                })
            }
        }
        
        return cell
    }
    
    //MARK: 初始化
    lazy var collectionView: UICollectionView = {
        let layout = YZWCardFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: YZWMathSize.rate(rate: 75), bottom: 0, right: YZWMathSize.rate(rate: 75))
        layout.itemSize = CGSize(width: YZWMathSize.rate(rate: 225), height: YZWMathSize.rate(rate: 400))
        
        let xPadding = 0 as CGFloat
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.tg_centerY.equal(0)
        collectionView.tg_size(width: aaqScreenWidth, height: YZWMathSize.rate(rate: 400))
        collectionView.backgroundColor = UIColor.clear
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(object_getClass(YZWCardCollectionCell.init()), forCellWithReuseIdentifier: "idCell")
        return collectionView
    }()
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let index = indexPath.row
        let pointInView = self.convert(collectionView.center, to: collectionView)
        let centerIndex = collectionView.indexPathForItem(at: pointInView)?.row ?? 0
        if index == centerIndex { // 若点击的是中间位置的书，则选择完成
            
        } else { // 若点击旁边的书，则让其滚动至中间位置
            scrollToItem(withAnimation: true, index: index)
            print("点击下标：\(index)")
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pointInView = self.convert(collectionView.center, to: collectionView)
        let index = collectionView.indexPathForItem(at: pointInView)?.row ?? 0
        print("滚动至下标：\(index)")
        
        for cell in collectionView.visibleCells {
            let cellCurrent = cell as! YZWCardCollectionCell
            let indexCell = collectionView.indexPath(for: cellCurrent)

            cellCurrent.vLineAlpha.alpha = 0
            if index == indexCell?.item {
                cellCurrent.isCurrentItem = true
                self.bgImg.image = cellCurrent.vImg.image!
            } else {
                cellCurrent.isCurrentItem = false
            }
        }
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("stop")
        self.scrollViewDidEndDecelerating(self.collectionView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {//过渡动画
    }
    
    fileprivate func scrollToItem(withAnimation animation: Bool, index: Int) {
        
        self.collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: animation)
    }
    
    //MARK: 加载view
    class func aaqLayout() -> YZWCardListView {
        let view = YZWCardListView.init()
        view.tg_margin(0)
        view.aaqCreateView()
        return view
    }
    
    func aaqCreateView() -> Void {
        
        let vLighting = UIImageView.init()
        vLighting.image = UIImage.init(named: "img_lighting")
        vLighting.tg_centerX.equal(0)
        vLighting.tg_size(width: aaqScreenWidth / 2, height: aaqScreenWidth / 5)
        vLighting.tg_bottom.equal(self.collectionView.tg_top).offset(YZWMathSize.rate(rate: -20))
        self.addSubview(vLighting)
        
        self.addSubview(self.collectionView)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.4) {
            self.scrollViewDidEndDecelerating(self.collectionView)
        }
    }
    
    @objc func btnAddAction() {
        let ctr = AAQPreviewController.init()
        self.getCurrentController()!.present(ctr, animated: true) {
            
        }
    }
    
    @objc func btnAboutAction() {
        let ctr = YZWAboutController.init()
        let naviCtr = UINavigationController.init(rootViewController: ctr)
        
        self.getCurrentController()?.present(naviCtr, animated: true, completion: {
            
        })
    }

}
