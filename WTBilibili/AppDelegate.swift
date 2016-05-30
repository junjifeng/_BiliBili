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
        window?.rootViewController = UINavigationController(rootViewController: WTLoginViewController())
        window?.makeKeyAndVisible()
        
        // 2、设置全局tabBar的颜色
        UITabBar.appearance().tintColor = WTColor(r: 180, g: 84, b: 112)
        
        return true
    }
}

