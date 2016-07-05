//
//  WTTabBar.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/7/5.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  自定义TabBar

import UIKit

protocol WTTabBarDelegate: NSObjectProtocol
{
    func tabBarDidClickWithTabBarBtn(index: Int)
}

class WTTabBar: UITabBar
{
    /// 代理
    var tabBarDelegate: WTTabBarDelegate?
    
    /// 子控制器
    var tabBarItems: [UITabBarItem]? {
        
        didSet{
            
            for tabBarItem in tabBarItems!
            {
                let btn = WTTabBarButton()
                addSubview(btn)
                
                btn.tabBarItem = tabBarItem
                btn.tag = buttons.count
                btn.addTarget(self, action: #selector(tabBarBtnClick(_:)), forControlEvents: .TouchUpInside)
                
                buttons.append(btn)
                if btn.tag == 0
                {
                    tabBarBtnClick(btn)
                }
            }
            
            backgroundColor = UIColor.whiteColor()
        }
    }
    
    /// 存放按钮的数据
    private var buttons = [WTTabBarButton]()
    /// 当前选中的按钮
    private var selectedBtn: WTTabBarButton?
    
    // MARK: - 系统回调函数
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        for view in subviews
        {
            let tabbarButton: AnyClass = NSClassFromString("UITabBarButton")!
            if view.isMemberOfClass(tabbarButton)
            {
                view.removeFromSuperview()
            }
        }
        
        // 重新布局子控件
        let btnW = WTScreenWidth / CGFloat(buttons.count)
        let btnH = frame.height
        var btnX:CGFloat = 0
        let btnY:CGFloat = 0
        var i = 0;
        for view in subviews
        {
            if view.isMemberOfClass(WTTabBarButton)
            {
                btnX = CGFloat(i) * btnW
                view.frame = CGRect(x: btnX, y: btnY, width: btnW, height: btnH)
                i += 1
            }
        }
    }
}

// MARK: - 事件
extension WTTabBar
{
    func tabBarBtnClick(tabBarBtn: WTTabBarButton)
    {
        self.selectedBtn?.selected = false
        tabBarBtn.selected = true
        self.selectedBtn = tabBarBtn
        tabBarDelegate?.tabBarDidClickWithTabBarBtn(tabBarBtn.tag)
    }
}
