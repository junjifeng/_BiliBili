//
//  WTStartupViewController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/3.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  启动页面控制器

import UIKit

class WTStartupViewController: UIViewController {

    // MARK: - 拖控件
    /// logo图片
    @IBOutlet weak var logoImageV: UIImageView!
    // MARK: - 系统回调函数
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // 1、先把尺寸设置0
        logoImageV.transform = CGAffineTransformMakeScale(0, 0)
        
        // 2、添加动画，并还原logoImageV原本大小
        UIView.animateWithDuration(1, delay: 0.5, options: .LayoutSubviews, animations: {
            
            self.logoImageV.transform = CGAffineTransformIdentity
            
            }) { (_) in
            
            // 2.1、延迟1秒切换根控制器
            self.performSelector(#selector(self.changeRootViewController), withObject: self, afterDelay: 1)
        }
    }
}

// MARK: - 事件
extension WTStartupViewController
{
    // MARK: 切换根控制器
    @objc private func changeRootViewController()
    {
        UIApplication.sharedApplication().keyWindow?.rootViewController = WTTabBarController()
    }
}