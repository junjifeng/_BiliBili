//
//  WTLiveListCollectionView.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/9.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

/// 视频的cell被点击
let WTLiveListDidClickNotification = "WTLiveListDidClickNotification"

private let liveListCell = "liveListCell"

private let margin: CGFloat = 8

class WTLiveListCollectionView: UICollectionView
{
    
    // MARK: 属性
    /// 视频列表模型
    var lives: [WTLiveItem]?{
        didSet{
            self.reloadData()
        }
    }
    
    // MARK: 系统回调函数
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout)
    {
        super.init(frame: frame, collectionViewLayout: layout)
        
        // 1、数据源
        dataSource = self
        delegate = self
        // 2、注册cell
        self.registerNib(UINib(nibName: "WTLiveListCell", bundle: nil), forCellWithReuseIdentifier: liveListCell)
        // 3、设置背景颜色
        backgroundColor = UIColor.whiteColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - UICollectionViewDataSource And UICollectionViewDelegate
extension WTLiveListCollectionView: UICollectionViewDataSource, UICollectionViewDelegate
{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.lives?.count > 0 ? 4 : 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(liveListCell, forIndexPath: indexPath) as! WTLiveListCell
        
        cell.live = lives![indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        NSNotificationCenter.defaultCenter().postNotificationName(WTLiveListDidClickNotification, object: nil, userInfo: ["liveItem": lives![indexPath.row]])
    }
}

// MARK: - UICollectionViewFlowLayout
class WTLiveListLayout: UICollectionViewFlowLayout
{
    override func prepareLayout()
    {
        super.prepareLayout()
        
        let width = (WTScreenWidth - margin * 3) / 2;
        itemSize = CGSize(width: width, height: 150)
        minimumLineSpacing = margin
        minimumInteritemSpacing = margin
    }
}

