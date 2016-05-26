//
//  WTLiveHeaderView.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/8.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit
import SDCycleScrollView
import SnapKit
import SDWebImage

/// headerView的高度
let LiveheaderViewHeight: CGFloat = 100
/// 按钮组里面按钮列表
let entranceIconsButtonCoulmn: CGFloat = 4
/// 按钮组里面按钮高度
let entranceIconsButtonHeight: CGFloat = 85

// 定义协议
protocol WTLiveHeaderViewDelegate: NSObjectProtocol
{
    /**
     点击轮播轮图片事件
     
     - parameter headerView: self
     - parameter value:      图片链接或者房间ID
     */
    func headerView(headerView: WTLiveHeaderView, value: String);
}

class WTLiveHeaderView: UIView
{
    // MARK: - 属性
    /// 代理
    weak var delegate: WTLiveHeaderViewDelegate?

    /// 首页广告模型
    var bannerItems: [WTBannerItem]?{
        didSet{
            
            // 1、遍历出所有图片的URL,并放进数组中
            var imageURLs = [NSURL]()
            for item in bannerItems!
            {
                if let imageTemp = item.image
                {
                    imageURLs.append(imageTemp)
                }
                
                if let imgTemp = item.img
                {
                    imageURLs.append(imgTemp)
                }
            }
            
            // 2、设置轮播图图片
            cycleScrollView.imageURLStringsGroup = imageURLs
        }
    }
    
    /// 首页按钮组模型
    var entranceIconsItems: [WTEntranceIconsItem]?{
        didSet{
            
            guard let entranceIconsItemsTemp = entranceIconsItems else
            {
                return
            }
        
            for i in 0..<entranceIconsItemsTemp.count
            {
                let button = groupButtonContentView.subviews[i] as! WTEntranceIconButton
                
                button.setTitle(entranceIconsItemsTemp[i].name, forState: .Normal)
                button.sd_setImageWithURL(entranceIconsItemsTemp[i].entrance_icon?.src, forState: .Normal)
            }
        }
    }
    
    // MARK: - 控件
    /// 轮播图
    private let cycleScrollView = SDCycleScrollView()
    /// 按钮组占位View
    private lazy var groupButtonContentView: UIView = {
        
        let groupButtonContentView = UIView()
        
        groupButtonContentView.backgroundColor = UIColor.whiteColor()
        
        // 1、添加按钮到按钮组View中
        var x: CGFloat = 0
        var y: CGFloat = 0
        let width = WTScreenWidth / entranceIconsButtonCoulmn
        
        for i in 0..<8{
            
            // 设置Frame
            let button = WTEntranceIconButton(type: .Custom)
            x = CGFloat(i) % entranceIconsButtonCoulmn * width
            y = CGFloat(i / Int(entranceIconsButtonCoulmn)) * entranceIconsButtonHeight
            button.frame = CGRect(x: x, y: y, width: width, height: entranceIconsButtonHeight)
            
            // 添加子控件
            groupButtonContentView.addSubview(button)
        }
        return groupButtonContentView
    }()
    
    /// 上线条
    private let topLine = UIView()
    /// 下线条
    private let bottomLine = UIView()
    
    // 系统回调函数
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
extension WTLiveHeaderView
{
    // MARK: - 设置UI
    private func setupUI()
    {
        backgroundColor = WTHomeTableViewBackGroundColor
        
        // 1、添加子控件
        addSubview(cycleScrollView)
        addSubview(groupButtonContentView)
        addSubview(topLine)
        addSubview(bottomLine)
        
        // 2、布局子控件
        // 轮播图
        cycleScrollView.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.size.equalTo(CGSize(width: WTScreenWidth, height: LiveheaderViewHeight))
        }
        
        // 按钮组
        groupButtonContentView.snp_makeConstraints { (make) in
            make.top.equalTo(cycleScrollView.snp_bottom).offset(10)
            make.width.equalTo(WTScreenWidth)
            make.height.equalTo(entranceIconsButtonHeight * 2)
        }
        
        // 上、下线
        topLine.snp_makeConstraints { (make) in
            make.top.equalTo(groupButtonContentView.snp_top).offset(0)
            make.width.equalTo(WTScreenWidth)
            make.height.equalTo(1)
        }
        bottomLine.snp_makeConstraints { (make) in
            make.bottom.equalTo(groupButtonContentView.snp_bottom).offset(0)
            make.width.equalTo(WTScreenWidth)
            make.height.equalTo(1)
        }
        
        // 3、设置子控件属性
        // 轮播图
        cycleScrollView.infiniteLoop = true                                             // 无限滚动
        cycleScrollView.autoScroll = true                                               // 自动滚动
        cycleScrollView.delegate = self                                                 // 代理
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight    // pageControl位置
        cycleScrollView.currentPageDotColor = WTMainColor                               // 当前分页控件小圆标颜色
        cycleScrollView.pageDotColor = UIColor.whiteColor()                             // 其他分页控件小圆标颜色
        
        // 上、下线
        topLine.backgroundColor = WTColor(r: 231, g: 231, b: 231, alpha: 0.5)
        bottomLine.backgroundColor = topLine.backgroundColor
    }
    
}

// MARK: - SDCycleScrollViewDelegate
extension WTLiveHeaderView: SDCycleScrollViewDelegate
{
    // MARK: 点击轮播图图片的回调
    func cycleScrollView(cycleScrollView: SDCycleScrollView!, didSelectItemAtIndex index: Int)
    {
        if let delegate = self.delegate
        {
            let value = bannerItems![index].value
            delegate.headerView(self, value: value)
        }
    }
}
