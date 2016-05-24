//
//  Common.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/3.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

/// 屏幕宽度、高度
let WTScreenWidth = UIScreen.mainScreen().bounds.size.width
let WTScreenHeight = UIScreen.mainScreen().bounds.size.height

let DOMAIN = "com.wutouqishi14.com"

/// 设置颜色
func WTColor(r r:CGFloat , g:CGFloat, b:CGFloat) ->UIColor
{
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}

/// 主色调
let WTMainColor = WTColor(r: 251, g: 114, b: 153)
/// 标题按钮默认颜色
let WTHomeTitleBtnNormalColor = WTColor(r: 153, g: 153, b: 153)
/// 标题按钮选中颜色
let WTHomeTitleBtnSelectedColor = WTMainColor