//
//  AppDelegate.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/3.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // 1、创建窗口、设置根控制器，显示窗口
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = WTTabBarController()
        window?.makeKeyAndVisible()
        
        let nav = UINavigationController()
        nav.visibleViewController
        
        // 2、设置全局tabBar的颜色
        let navBar = UINavigationBar.appearance()
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont.systemFontOfSize(17)]
        navBar.barTintColor = WTMainColor
        navBar.tintColor = UIColor.whiteColor()
        navBar.shadowImage = UIImage()
        application.statusBarStyle = .LightContent
        
        //NetworkTools.shareInstance.getLoginKey()
        
        
        
        return true
    }
}

