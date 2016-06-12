//
//  UIBarButtonItem-Extension.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/6/12.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import Foundation

extension UIBarButtonItem
{
    public static func createCloseItem(target: AnyObject?, action: Selector) -> UIBarButtonItem
    {
        let closeBtn = UIButton(type: .Custom)
        closeBtn.tintColor = WTMainColor
        closeBtn.setBackgroundImage(UIImage(named: "common_close"), forState: .Normal)
        closeBtn.sizeToFit()
        closeBtn.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        return UIBarButtonItem(customView: closeBtn)
    }
}