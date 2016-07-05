//
//  WTTabBarController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/3.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  自定义TabBar控制器

import UIKit

class WTTabBarController: UITabBarController
{
    var items = [UITabBarItem]()
    
    // MARK: - 系统回调函数
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // 设置UI
        setupUI()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}

// MARK: - 自定义函数
extension WTTabBarController
{
    // MARK: 设置UI
    private func setupUI()
    {
        // 1、首页
        addOneChildViewController(WTLiveViewController(), title: "首页", imageName: "home_home_tab")
        
        // 2、分区
        let categoryVC = UIStoryboard(name: "WTCategoryViewController", bundle: nil).instantiateInitialViewController()!
        addOneChildViewController(categoryVC, title: "分区", imageName: "home_category_tab")
        
        // 3、关注
        addOneChildViewController(WTDiscoverViewController(), title: "关注", imageName: "home_attention_tab")
        
        // 4、发现
        addOneChildViewController(WTDiscoverViewController(), title: "发现", imageName: "home_discovery_tab")
        
        // 5、我的
        addOneChildViewController(WTUserCenterViewController(), title: "我的", imageName: "home_mine_tab")
        
        // 6、自定义tabBar
        let tabBar = WTTabBar()
        tabBar.tabBarItems = items
        tabBar.tabBarDelegate = self
        setValue(tabBar, forKey: "tabBar")
    }
    
    // MARK: 添加一个控制器
    private func addOneChildViewController(viewController: UIViewController, title: String, imageName: String)
    {
        // 1、设置tabBarItem的基本属性
        viewController.title = title
        
        let tabBarItem = UITabBarItem()
        tabBarItem.image = UIImage(named: imageName)
        tabBarItem.selectedImage = UIImage(named: imageName + "_s")
        items.append(tabBarItem)
        
        // 2、添加到子控器中
        addChildViewController(WTNavigationController(rootViewController: viewController))
    }
}

// MARK: - WTTabBarDelegate
extension WTTabBarController: WTTabBarDelegate
{
    func tabBarDidClickWithTabBarBtn(index: Int)
    {
        self.selectedIndex = index
    }
}
