//
//  UIFont-Extension.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/7/7.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import Foundation

/// 设置QIHei字体
extension UIFont
{
    public static func setQIHeiFontWithSize(size: CGFloat) -> UIFont
    {
        return UIFont(name: "HYQiHei-EZJ", size: size)!
    }

}