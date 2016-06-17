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
        
        // 2、设置全局tabBar的颜色
        UITabBar.appearance().tintColor = WTColor(r: 180, g: 84, b: 112)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor(hex: 666666)!, NSFontAttributeName: UIFont.systemFontOfSize(17)]
        
        
        XMGTopWindow.show()
//        let fontFamilies = UIFont.familyNames()
//        
//        for i in 0..<fontFamilies.count
//        {
//            let fontFamily = fontFamilies[i]
//            let fontNames = UIFont.fontNamesForFamilyName(fontFamily)
//            WTLog("fontFamily:\(fontFamily)-->fontNames:\(fontNames)")
//        }
        
        return true
    }
}

