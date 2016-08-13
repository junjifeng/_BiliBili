//
//  Common.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/3.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit
import Foundation

/// 屏幕宽度、高度
let WTScreenWidth = UIScreen.mainScreen().bounds.size.width
let WTScreenHeight = UIScreen.mainScreen().bounds.size.height

let WTTabBarHeight: CGFloat = 48

let DOMAIN = "com.wutouqishi14.com"

/// 设置颜色
public func WTColor(r r: CGFloat , g: CGFloat, b: CGFloat) -> UIColor
{
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}

/// 设置颜色
public func WTColor(r r:CGFloat , g:CGFloat, b:CGFloat, alpha: CGFloat) -> UIColor
{
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
}

/// 主色调
let WTMainColor = WTColor(r: 251, g: 114, b: 153)
/// 标题按钮默认颜色
let WTHomeTitleBtnNormalColor = WTColor(r: 153, g: 153, b: 153)
/// 标题按钮选中颜色
let WTHomeTitleBtnSelectedColor = WTMainColor

/// 随机色
public func WTRandomColor() -> UIColor
{
    return WTColor(r: CGFloat(arc4random_uniform(255)) / 255.0, g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
}

/// 注册帐号获取验证码默认颜色
let WTRegisterGetCodeNormalColor = WTColor(r: 222, g: 105, b: 140)
/// 注册帐号获取验证码选中颜色
let WTRegisterGetCodeSelectedColor = WTColor(r: 234, g: 176, b:193)

let WTHomeTableViewBackGroundColor = WTColor(r: 244, g: 244, b: 244)

/// 时间戳
let WTTimeInterval = Int(NSDate().timeIntervalSince1970)
/// uuid
let WTUDID =  (UIDevice.currentDevice().identifierForVendor?.UUIDString)!


/// 日志打印
public func WTLog<T>(message: T, file: String = #file, method: String = #function, line: Int = #line)
{
//    #if DEBUG
        //print("\((file as NSString).lastPathComponent):\(line) \(method): \(message)")
        print("\(line) \(method): \(message)")
//    #endif
}