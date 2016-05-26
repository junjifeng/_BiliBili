//
//  WTVideoListCollectionView.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/4.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

private let videoListCell = "videoListCell"

private let margin: CGFloat = 8

class WTVideoListCollectionView: UICollectionView
{
    // MARK: 属性
    /// 视频列表模型
    var videos: [WTVideoItem]?
    
    // MARK: 系统回调函数    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout)
    {
        super.init(frame: frame, collectionViewLayout: layout)
        
        // 1、数据源
        dataSource = self
        // 2、注册cell
        self.registerNib(UINib(nibName: "WTVideoListCell", bundle: nil), forCellWithReuseIdentifier: videoListCell)
        // 3、设置背景颜色
        backgroundColor = UIColor.whiteColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDataSource
extension WTVideoListCollectionView: UICollectionViewDataSource
{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.videos?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(videoListCell, forIndexPath: indexPath) as! WTVideoListCell
        
        cell.video = videos![indexPath.row]
        
        return cell
    }
}

// MARK: - UICollectionViewFlowLayout
class WTVideoListLayout: UICollectionViewFlowLayout
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

