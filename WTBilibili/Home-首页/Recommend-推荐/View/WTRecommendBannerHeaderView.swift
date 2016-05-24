//
//  WTRecommendBannerCell.swift
//  WTBilibili
//
//  Created by 耿杰 on 16/5/4.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  推荐控制器的headerView

import UIKit
import SDCycleScrollView

/// headerView的高度
let recommendBannerHeaderViewHeight: CGFloat = 120

// 定义协议
protocol WTRecommendBannerHeaderViewDelegate: NSObjectProtocol
{
    func headerView(headerView: WTRecommendBannerHeaderView, value: String);
}

class WTRecommendBannerHeaderView: UIView
{
    // MARK: 属性
    /// 代理
    weak var delegate: WTRecommendBannerHeaderViewDelegate?
    
    /// 轮播图
    private let cycleScrollView = SDCycleScrollView()
    
    /// 首页推荐广告模型
    var recommendbannerItems: [WTRecommendBannerItem]?{
        didSet{

            // 1、遍历出所有图片的URL,并放进数组中
            var imageURLs = [NSURL]()
            for item in recommendbannerItems!
            {
                imageURLs.append(item.image!)
            }
            
            // 2、设置轮播图图片
            cycleScrollView.imageURLStringsGroup = imageURLs
        }
    }
    
    // MARK: 系统回调函数
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        // 设置UI
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - 自定义函数
extension WTRecommendBannerHeaderView
{
    // MARK: 设置UI
    private func setupUI()
    {
        // 1、添加子控件
        addSubview(cycleScrollView)
        
        // 2、布局子控件
        cycleScrollView.frame = CGRect(x: 0, y: 0, width: WTScreenWidth, height: recommendBannerHeaderViewHeight)
        
        // 3、设置子控件属性
        cycleScrollView.infiniteLoop = true                                             // 无限滚动
        cycleScrollView.autoScroll = true                                               // 自动滚动
        cycleScrollView.delegate = self                                                 // 代理
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight    // pageControl位置
        cycleScrollView.currentPageDotColor = WTMainColor                               // 当前分页控件小圆标颜色
        cycleScrollView.pageDotColor = UIColor.whiteColor()                             // 其他分页控件小圆标颜色
    }
}

// MARK: - SDCycleScrollViewDelegate
extension WTRecommendBannerHeaderView: SDCycleScrollViewDelegate
{
    // MARK: 点击轮播图图片的回调
    func cycleScrollView(cycleScrollView: SDCycleScrollView!, didSelectItemAtIndex index: Int)
    {
        if let delegate = self.delegate
        {
            let value = recommendbannerItems![index].value
            delegate.headerView(self, value: value)
        }
    }
}