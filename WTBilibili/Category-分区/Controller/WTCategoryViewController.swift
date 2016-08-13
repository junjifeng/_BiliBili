//
//  WTCategoryViewController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/3.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  分区控制器

import UIKit

private let categoryHeaderViewH: CGFloat = 54

private let categoryCellIdentifier = "categoryCellIdentifier"

class WTCategoryViewController: UIViewController {

    // MARK: - 拖线的属性
    /// 头部的View
    @IBOutlet weak var headerView: UIView!
    /// 标题
    @IBOutlet weak var titleLabel: UILabel!
    /// 底部的View
    @IBOutlet weak var footerView: UIView!
    /// collectionView
    @IBOutlet weak var collectionView: UICollectionView!
    
    /// 数据源
    var userCenterItems = [WTUserCenterItem]()
    
    /// 记录scrollView的contentOff的Y值
    var endY: CGFloat = 0
    
    // MARK: - 系统回调函数
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // 设置View
        setupView()
        
        // 设置数据
        setupData()
    }
}

// MARK: - 自定义函数
extension WTCategoryViewController
{
    
    // MARK: - 设置View
    private func setupView()
    {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        headerView.backgroundColor = WTMainColor
        
        titleLabel.textColor = UIColor.whiteColor()
        
        collectionView.backgroundColor = WTColor(r: 244, g: 244, b: 244)
        collectionView.layer.cornerRadius = 5
        
        // 调整collectionView的item的间距
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let margin = (WTScreenWidth - (layout.itemSize.width * CGFloat(3))) / CGFloat(6)
        layout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    }
    
    // MARK: - 设置数据
    private func setupData()
    {
        
        userCenterItems.append(WTUserCenterItem(imageName: "home_region_icon_live", title: "直播", actionBlock: nil))
        userCenterItems.append(WTUserCenterItem(imageName: "home_region_icon_1", title: "番剧", actionBlock: nil))
        userCenterItems.append(WTUserCenterItem(imageName: "home_region_icon_1", title: "动画", actionBlock: nil))
        userCenterItems.append(WTUserCenterItem(imageName: "home_region_icon_3", title: "音乐", actionBlock: nil))
        userCenterItems.append(WTUserCenterItem(imageName: "home_region_icon_129", title: "舞蹈", actionBlock: nil))
        userCenterItems.append(WTUserCenterItem(imageName: "home_region_icon_4", title: "游戏", actionBlock: nil))
        userCenterItems.append(WTUserCenterItem(imageName: "home_region_icon_36", title: "科技", actionBlock: nil))
        userCenterItems.append(WTUserCenterItem(imageName: "home_region_icon_4", title: "生活", actionBlock: nil))
        userCenterItems.append(WTUserCenterItem(imageName: "home_region_icon_119", title: "鬼畜", actionBlock: nil))
        userCenterItems.append(WTUserCenterItem(imageName: "home_region_icon_4", title: "时尚", actionBlock: nil))
        userCenterItems.append(WTUserCenterItem(imageName: "home_region_icon_4", title: "娱乐", actionBlock: nil))
        userCenterItems.append(WTUserCenterItem(imageName: "home_region_icon_23", title: "电影", actionBlock: nil))
        userCenterItems.append(WTUserCenterItem(imageName: "home_region_icon_11", title: "电视剧", actionBlock: nil))
        userCenterItems.append(WTUserCenterItem(imageName: "home_region_icon_11", title: "游戏中心", actionBlock: nil))
        
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension WTCategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate
{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return userCenterItems.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(categoryCellIdentifier, forIndexPath: indexPath) as! WTCategoryCell
        
        cell.userCenterItem = userCenterItems[indexPath.row]
        
        return cell
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y < 0
        {
            UIView.animateWithDuration(0.1, animations: {
                
                self.endY += (-scrollView.contentOffset.y) * 0.3
                self.footerView.frame.origin.y = categoryHeaderViewH + self.endY
            })
            
            scrollView.contentOffset = CGPoint(x: 0, y: 0)
        }
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        UIView.animateWithDuration(0.3) {
            
            self.footerView.frame.origin.y = categoryHeaderViewH
            self.endY = 0
        }
    }
}