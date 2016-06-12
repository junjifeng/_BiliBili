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
    // MARK: - 系统回调函数
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // 设置UI
        setupUI()
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
        
        // 2、关注
        addOneChildViewController(WTDiscoverViewController(), title: "关注", imageName: "home_attention_tab")
        
        // 3、发现
        addOneChildViewController(WTDiscoverViewController(), title: "发现", imageName: "home_discovery_tab")
        
        // 4、我的
        addOneChildViewController(UIStoryboard(name: "WTMineViewController", bundle: nil).instantiateInitialViewController()!, title: "我的", imageName: "home_mine_tab")
    }
    
    // MARK: 添加一个控制器
    private func addOneChildViewController(viewController: UIViewController, title: String, imageName: String)
    {
        // 1、设置tabBarItem的基本属性
        viewController.title = title
        viewController.tabBarItem.image = UIImage(named: imageName)
        viewController.tabBarItem.selectedImage = UIImage(named: imageName + "_s")
        
        // 2、添加到子控器中
        addChildViewController(WTNavigationController(rootViewController: viewController))
    }
}
