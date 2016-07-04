//
//  WTNavigationController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/3.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

class WTNavigationController: UINavigationController {
    
    // MARK: - 系统回调函数
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func pushViewController(viewController: UIViewController, animated: Bool)
    {
        
        if childViewControllers.count > 0
        {
            // 隐藏导航栏和TabBar
            viewController.navigationController?.setNavigationBarHidden(true, animated: false)
            viewController.hidesBottomBarWhenPushed = true
            
            // 统一设置左侧的返回按钮
            let leftItem = UIButton(type: .Custom)
            leftItem.setBackgroundImage(UIImage(named: "common_back"), forState: .Normal)
            leftItem.sizeToFit()
            leftItem.addTarget(self, action: #selector(leftItemClick), forControlEvents: .TouchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftItem)
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    override func childViewControllerForStatusBarStyle() -> UIViewController?
    {
        return topViewController
    }
}

// MARK: - 事件处理
extension WTNavigationController
{
    // MARK: 返回按钮点击
    func leftItemClick()
    {
        popViewControllerAnimated(true)
    }
}
