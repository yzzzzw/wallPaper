//
//  YZWCardFlowLayout.swift
//  fashionColor
//
//  Created by mac on 2019/7/5.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit

class YZWCardFlowLayout: UICollectionViewFlowLayout {
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        let targetRect = CGRect(x: proposedContentOffset.x, y: 0.0, width:  self.collectionView!.bounds.size.width, height: self.collectionView!.bounds.size.height)
        // 目标区域中包含的cell
        let attriArray = super.layoutAttributesForElements(in: targetRect)! as [UICollectionViewLayoutAttributes]
        // collectionView落在屏幕中点的x坐标
        let horizontalCenterX = proposedContentOffset.x + (self.collectionView!.bounds.width / 2.0)
        var offsetAdjustment = CGFloat(MAXFLOAT)
        for layoutAttributes in attriArray {
            let itemHorizontalCenterX = layoutAttributes.center.x
            // 找出离中心点最近的
            if(abs(itemHorizontalCenterX-horizontalCenterX) < abs(offsetAdjustment)) {
                offsetAdjustment = itemHorizontalCenterX-horizontalCenterX
            }
        }
        //返回collectionView最终停留的位置
        return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
    }
    
    let ActiveDistance : CGFloat = 400 //垂直缩放除以系数
    let ScaleFactor : CGFloat = 0.15     //缩放系数  越大缩放越大
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let array = getCopyOfAttributes(attributes: super.layoutAttributesForElements(in: rect))
        var visibleRect = CGRect()
        visibleRect.origin = self.collectionView!.contentOffset
        visibleRect.size = self.collectionView!.bounds.size
        
//        let theDis = visibleRect.origin.x + visibleRect.size.width / 2
        
        for attributes in array! {
            let distance = visibleRect.midX - attributes.center.x
            let normalizedDistance = abs(distance/ActiveDistance)
            let zoom = 1 - ScaleFactor * normalizedDistance
//            print(String(format: "%.2f  %.2f   %.2f  %.2f", distance, visibleRect.midX, attributes.center.x, (self.collectionView?.contentOffset.x)!))
            attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0)
//            attributes.transform3D = CATransform3DMakeRotation(CGFloat(Double.pi / 4.0) * zoom, 0, 1, 0)
//            attributes.frame.origin.y = abs(distance * ScaleFactor)
        }
        return array
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        // 滑动放大缩小  需要实时刷新layout
        return true
    }
    
    // 防止报错 先复制attributes
    func getCopyOfAttributes(attributes: [UICollectionViewLayoutAttributes]?) -> [UICollectionViewLayoutAttributes]? {
        
        var arr: [UICollectionViewLayoutAttributes] = []
        if let attributes = attributes {
            for attribute in attributes {
                arr.append(attribute.copy() as! UICollectionViewLayoutAttributes)
            }
            return arr
        }
        return nil
    }
    
}
